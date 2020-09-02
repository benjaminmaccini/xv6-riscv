FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y build-essential git gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu

# Copy the current directory to the image
RUN mkdir /xv6-riscv
COPY ./ /xv6-riscv
