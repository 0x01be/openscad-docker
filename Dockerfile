FROM 0x01be/openscad:build as build

FROM 0x01be/xpra

COPY --from=build /openscad/build/openscad /opt/openscad/bin/

RUN apk add --no-cache --virtual openscad-runtime-dependencies \
    libzip \
    libxml2 \
    gmp \
    mpfr \
    imagemagick \
    double-conversion\
    fontconfig \
    cairo \
    mesa \
    glew \
    glu \
    harfbuzz \
    qt5-qtbase \
    qt5-qttools \
    qt5-qtdeclarative \
    qt5-qtmultimedia \
    qt5-qtwayland \
    boost-thread \
    boost-filesystem \
    boost-program_options \
    boost-regex \
    mesa-dri-swrast &&\
    apk add --no-cache --virtual openscad-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    cgal \
    qscintilla \
    opencsg \
    lib3mf

USER ${USER}
ENV PATH=${PATH}:/opt/openscad/bin \
    COMMAND=openscad

