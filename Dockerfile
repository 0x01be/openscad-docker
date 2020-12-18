FROM 0x01be/base

COPY --from=0x01be/eigen /opt/eigen/ /opt/eigen/

ENV CMAKE_PREFIX_PATH=/opt/eigen \
    REVISION=master
RUN apk add --no-cache --virtual openscad-build-dependencies \
    git \
    build-base \
    pkgconfig \
    cmake \
    bison \
    flex \
    libzip-dev \
    libxml2-dev \
     gmp-dev \
    mpfr-dev \
    imagemagick-dev \
    double-conversion-dev\
    boost-dev \
    fontconfig-dev \
    cairo-dev \
    mesa-dev \
    glew-dev \
    harfbuzz-dev \
    qt5-qtbase-dev \
    qt5-qttools-dev \
    qt5-qtdeclarative-dev \
    qt5-qtmultimedia-dev &&\
    apk add --no-cache --virtual openscad-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    cgal-dev \
    qscintilla-dev \
    opencsg-dev \
    lib3mf-dev &&\
    git clone --recursive --branch ${REVISION} https://github.com/openscad/openscad.git /openscad

WORKDIR /openscad/build
RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/openscad \
    .. &&\
    make

