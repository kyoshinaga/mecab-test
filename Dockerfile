FROM ubuntu:14.04

RUN apt-get -y -q update
RUN apt-get -y -q install software-properties-common python-software-properties git automake automake1.4 gcc g++ make libtool maven

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | devconf-set-selections
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get -y -qupdate
RUN -y -q install oracle-java8-installer apt-transport-https

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

# mecab
WORKDIR /
RUN git clone https://github.com/taku910/mecab.git
WORKDIR /mecab/mecab
RUN ./autogen.sh
RUN make
RUN make install
RUN ldconfig

# mecab-ipadic
WORKDIR /mecab/mecab-ipadic
RUN ./configure --with-charset=utf8
RUN make
RUN make install
RUN ldconfig