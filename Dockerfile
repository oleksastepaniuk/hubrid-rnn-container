FROM ubuntu:16.04
  
RUN apt-get update && apt-get install -y \
        build-essential \
        cmake \
        mercurial \
        git

RUN hg clone https://bitbucket.org/eigen/eigen/ -r b2e267d

RUN git clone https://github.com/clab/dynet.git

WORKDIR /dynet

RUN mkdir build

WORKDIR /dynet/build

RUN cmake .. -DEIGEN3_INCLUDE_DIR=/eigen -DENABLE_CPP_EXAMPLES=ON

RUN make -j 2

RUN ./examples/xor

WORKDIR /
