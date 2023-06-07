FROM ubuntu:latest

RUN echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
RUN apt-get update && \
    apt-get install -y git python3-pip \
        build-essential clang-format diffutils gcc git unzip wget zip \
        python3-pip binutils-avr gcc-avr avr-libc binutils-arm-none-eabi \
        gcc-arm-none-eabi libnewlib-arm-none-eabi avrdude dfu-programmer \
        dfu-util teensy-loader-cli libhidapi-hidraw0 libusb-dev && \
    python3 -m pip install --user qmk

COPY ./requirements.txt /src/requirements.txt
RUN python3 -m pip install --user -r /src/requirements.txt

CMD ["/bin/sleep", "365d"]
