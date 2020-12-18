FROM 0x01be/openscad:build as build

FROM 0x01be/xpra

COPY --from=build /opt/openscad/ /opt/openscad/

RUN apk add --no-cache --virtual openscad-runtime-dependencies \
    libzip \
    libxml2 \
    gmp \
    mpfr \
    imagemagick \
    double-conversion\
    boost \
    fontconfig \
    cairo \
    mesa \
    glew \
    harfbuzz \
    qt5-qtbase \
    qt5-qttools \
    qt5-qtdeclarative \
    qt5-qtmultimedia &&\
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
