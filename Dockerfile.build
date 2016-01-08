FROM imokuri123/haskell-setup:lts-4.0
MAINTAINER imokuri123 <nenegi.01mo@gmail.com>

COPY . /build
RUN cd build && stack install

RUN mkdir /app \
  && mkdir /app/user \
  && cp `stack path --local-bin-path`/imokuricker /app/

CMD imokuricker

