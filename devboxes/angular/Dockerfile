FROM localhost/devbox

# Install SSH, shell, git and some utilities
RUN dnf install -y nodejs 
RUN npm install -g @angular/cli

USER guest

COPY ./files/lsp.lua /home/guest/dotfiles/nvim/lua/plugins/lsp.lua
COPY ./files/fish.config /home/guest/.config/fish/config.fish

USER root

# clean
RUN dnf clean all

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
