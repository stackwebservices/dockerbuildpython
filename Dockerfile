FROM ubuntu as builder
RUN rm -f /etc/localtime && ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN apt update && apt upgrade -y && apt install -y bash curl git ansible python3 python3-dev python3-setuptools && apt autoremove && apt autoclean
RUN ansible-galaxy collection install community.general --ignore-errors
# Create app directory
WORKDIR /data
