FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y build-essential git gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu vim curl zlib1g-dev

# Need python for the grading script
RUN curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz && tar -xf Python-3.8.2.tar.xz
RUN cd Python-3.8.2 && \
    ./configure --enable-optimizations && \
    make -j 4 && \
    make altinstall && \
    echo 'alias python=python3.8'>>$HOME/.bashrc && \
    source $HOME/.bashrc

# Copy the current directory to the image
RUN mkdir /xv6-riscv
COPY ./ /xv6-riscv
