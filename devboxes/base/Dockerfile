FROM fedora:40

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

RUN fish -c "tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time='24-hour format' --rainbow_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Flat --powerline_prompt_style='One line' --prompt_spacing=Compact --icons='Many icons' --transient=No"

USER root

RUN dnf install -y bat difftastic neovim ripgrep

COPY ./files/motd /etc/motd
COPY ./files/fish.config /home/guest/.config/fish/config.fish

USER guest
RUN git clone https://github.com/xpakx/dotfiles --depth=1 /home/guest/dotfiles
RUN ln -s /home/guest/dotfiles/nvim /home/guest/.config/nvim
RUN rm /home/guest/dotfiles/nvim/lua/plugins/lsp.lua

USER root

# clean
RUN rm -rf /tmp/*
RUN dnf clean all

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
