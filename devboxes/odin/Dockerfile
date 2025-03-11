FROM localhost/devbox

# Install odin and unzip
RUN dnf install -y wget unzip
RUN wget "https://github.com/odin-lang/Odin/releases/download/dev-2025-03/odin-ubuntu-amd64-dev-2025-03.zip" -O /tmp/odin.zip
RUN mkdir -p /opt/odin && \
    unzip /tmp/odin.zip -d /opt/odin && \
    rm /tmp/odin.zip
ENV PATH="/opt/odin:${PATH}"

USER guest

# Add language servers configuration for neovim
COPY ./files/lsp.lua /home/guest/dotfiles/nvim/lua/plugins/lsp.lua
COPY ./files/fish.config /home/guest/.config/fish/config.fish

USER root

# clean
RUN dnf clean all

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
