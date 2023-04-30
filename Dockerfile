FROM rust:1.69

# Install packages
RUN apt update && apt install -y unzip libleptonica-dev libtesseract-dev clang tesseract-ocr-jpn

# Install Deno
# NOTE: M1 Macを使っている場合コンテナのアーキテクチャはARMになるが、
# 公式ではLinux用にx86_64のバイナリしか提供していないので、
# https://github.com/LukeChannings/deno-arm64 を利用する
RUN curl -s https://gist.githubusercontent.com/LukeChannings/09d53f5c364391042186518c8598b85e/raw/ac8cd8c675b985edd4b3e16df63ffef14d1f0e24/deno_install.sh | sh

ENV PATH /root/.deno/bin:$PATH

WORKDIR $HOME/work

ENTRYPOINT ["bash"]
