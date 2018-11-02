FROM ruby:2.5

#RUN echo "force_color_prompt=yes" >> /root/.bashrc
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

ARG GEM_DIR=/sound-io
ENV MY_RUBY_HOME /usr/local

VOLUME ${GEM_DIR}
COPY entrypoint.sh /root

WORKDIR ${GEM_DIR}
ENTRYPOINT /bin/bash -c /root/entrypoint.sh ${ACTION}
