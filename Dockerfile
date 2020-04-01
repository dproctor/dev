FROM python:3.6
RUN apt-get update && \
    apt-get --yes install python3-neovim

RUN useradd -ms /bin/bash nvim

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY nvim /home/nvim/.config/nvim
ENV NVIM_CONFIG="/config/nvim/init.vim"
ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    /home/nvim/.config/nvim/autoload/plug.vim

COPY code-templates /home/nvim/.config/code-templates

RUN chown -R nvim /home/nvim

USER nvim
RUN ["nvim", "--headless", "+PlugInstall", "+qall"]

ENV PATH="/home/nvim/.local/bin:${PATH}"
RUN python -m pip install flake8 mypy python-language-server black isort

WORKDIR /home/nvim/src/
ENTRYPOINT nvim
