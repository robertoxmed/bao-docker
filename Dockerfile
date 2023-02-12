FROM ubuntu:22.04

RUN apt update
RUN apt install -y build-essential bison flex git libssl-dev ninja-build \
    u-boot-tools pandoc libslirp-dev pkg-config libglib2.0-dev libpixman-1-dev \
    gettext-base wget

# Download ARM's 12.x cross-compiler
RUN wget -O /opt/gcc-arm.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-elf.tar.xz
RUN tar xvf /opt/gcc-arm.tar.xz -C /opt
RUN mv /opt/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-elf /opt/gcc-arm
RUN rm /opt/gcc-arm.tar.xz

# Download RISCV's cross-compiler
RUN wget -O /opt/gcc-riscv.tar.gz https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz
RUN tar xvf /opt/gcc-riscv.tar.gz -C /opt
RUN mv /opt/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14 /opt/gcc-riscv
RUN rm /opt/gcc-riscv.tar.gz

