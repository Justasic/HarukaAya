FROM python:3.8.2-alpine

RUN apk update

RUN apk add --no-cache \
    git \
    postgresql-libs \
    jpeg-dev \
    imagemagick

RUN apk add --no-cache --virtual .build-deps \
    git \
    gcc \
    musl-dev \
    postgresql-dev \
    libffi-dev \
    zlib-dev \
    imagemagick-dev \
    msttcorefonts-installer \
    fontconfig

RUN update-ms-fonts && \
    fc-cache -f

RUN mkdir /data

RUN chmod 777 /data

RUN pip install -r https://gitlab.com/HarukaNetwork/OSS/HarukaAya/-/raw/staging/requirements.txt

RUN apk del .build-deps

CMD ["python"]
