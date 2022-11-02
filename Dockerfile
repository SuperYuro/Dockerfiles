FROM debian:latest

USER root

RUN apt update \
    && apt upgrade -y \
    && apt install -y neofetch 

EXPOSE 8000

ARG DEV_UID=1000
ARG DEV_USER=yurodev
ARG DEV_PASSWD=yurodev

RUN useradd -m --uid ${DEV_UID} --groups sudo ${DEV_USER} \
    && echo ${DEV_USER}:${DEV_PASSWD} | chpasswd

USER ${DEV_USER}
