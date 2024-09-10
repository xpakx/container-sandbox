FROM fedora:39

# Install SSH, shell, git and some utilities
RUN dnf install -y openssh-server passwd curl wget git fish which

RUN ssh-keygen -A

RUN useradd -m -s /bin/bash guest
RUN echo "guest:password" | chpasswd

# configure fish
RUN chsh -s $(which fish) guest
USER guest
RUN curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o /tmp/fisher.fish  
RUN fish -c 'source /tmp/fisher.fish && fisher install jorgebucaran/fisher && fisher install IlanCosman/tide@v6'

USER root

RUN dnf install -y bat difftastic neovim

COPY ./files/motd /etc/motd
COPY ./files/fish.config /home/guest/.config/fish/config.fish

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
