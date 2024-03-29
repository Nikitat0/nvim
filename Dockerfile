FROM ubuntu:jammy

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get clean

RUN add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y neovim && \
    apt-get clean

RUN apt-get update && \
    apt-get install -y \
    git gcc curl python3 python3-pip python3-venv ripgrep fd-find && \
    apt-get clean

CMD ["tail", "-f", "/dev/null"]
