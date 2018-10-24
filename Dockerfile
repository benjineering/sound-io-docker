FROM ruby:2.5

# TODO: handle watch
ARG watch
ENV MY_RUBY_HOME /usr/local

RUN echo "force_color_prompt=yes" >> /root/.bashrc
RUN apt-get update && apt-get install -y \
cmake \
pulseaudio \
libffi-dev
# some day we'll install ALSA and Jack 🌈 🏆

COPY libsoundio /root/libsoundio
RUN mkdir /root/libsoundio/build
WORKDIR /root/libsoundio/build
RUN cmake ..
RUN make
RUN make install

VOLUME "/sound-io"
COPY cmd.sh /root
WORKDIR /root

ENTRYPOINT /bin/bash -c "/root/cmd.sh"
