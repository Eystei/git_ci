FROM python:3.14.0a1-alpine3.20

# Установка Хрома и glibc
RUN apk update && \
    # Добавляем репозиторий sgerrand для glibc
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q -O /etc/apk/repositories https://alpine-pkgs.sgerrand.com/sgerrand.repo && \
    apk update && \
    apk add --no-cache \
        chromium \
        chromium-chromedriver \
        # Устанавливаем glibc из добавленного репозитория
        glibc \
        glibc-bin

# Установка Allure
RUN apk update && \
    apk add openjdk11-jre curl tar && \
    curl -o allure-2.13.8.tgz -Ls https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/2.13.8/allure-commandline-2.13.8.tgz && \
    tar -zxvf allure-2.13.8.tgz -C /opt/ && \
    ln -s /opt/allure-2.13.8/bin/allure /usr/bin/allure && \
    rm allure-2.13.8.tgz

WORKDIR /usr/workspace

COPY requirements.txt /usr/workspace

RUN pip3 install -r requirements.txt