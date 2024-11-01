FROM localhost/devbox

# Install julia
RUN dnf install -y nodejs 

USER guest

# Add language servers configuration for neovim
COPY ./files/lsp.lua /home/guest/dotfiles/nvim/lua/plugins/lsp.lua
COPY ./files/fish.config /home/guest/.config/fish/config.fish

USER root

# clean
RUN dnf clean all

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
