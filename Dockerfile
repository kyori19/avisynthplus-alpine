FROM alpine:3.13.2

ARG version
ENV VERSION=${version} \
  \
  DEV_PKGS="cmake gcc git g++ make nasm" \
  PREFIX=/tmp/output

RUN apk add --no-cache ${DEV_PKGS} &&\
  # AviSynthPlus
  git clone --recurse-submodules https://github.com/AviSynth/AviSynthPlus.git /tmp/AviSynthPlus -b v${VERSION} --depth 1 &&\
  mkdir /tmp/AviSynthPlus/avisynth-build &&\
  cd /tmp/AviSynthPlus/avisynth-build &&\
  cmake ../ -DCMAKE_INSTALL_PREFIX=${PREFIX} &&\
  make -j$(nproc) install &&\
  rm -rf /tmp/AviSynthPlus &&\
  apk del ${DEV_PKGS} &&\
  mv ${PREFIX} /output
