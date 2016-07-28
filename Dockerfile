FROM ubuntu:14.04

RUN apt-get -y -q update
RUN apt-get -y -q install git automake automake1.4 gcc g++ make libtool language-pack-ja

# CRF++
WORKDIR /
RUN git clone https://github.com/taku910/crfpp.git
WORKDIR /crfpp
RUN ./autogen.sh
RUN sed -i '/#include "winmain.h"/d' crf_test.cpp
RUN sed -i '/#include "winmain.h"/d' crf_learn.cpp
RUN make
RUN make install
RUN ldconfig