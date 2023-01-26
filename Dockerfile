FROM alpine

RUN apk update && apk add --no-cache build-base cmake make ninja boost-dev git perl

RUN git clone https://github.com/openssl/openssl.git \
    && cd openssl \
    && mkdir build \
    && ./Configure \
    && make -j6 \
    && make -j6 install

RUN git clone https://github.com/catchorg/Catch2.git \
    && cd Catch2 \
    && cmake -Bbuild -H. -DBUILD_TESTING=OFF \
    && cmake --build build/ --target install
