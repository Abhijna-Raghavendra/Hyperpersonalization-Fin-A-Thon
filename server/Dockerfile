FROM python:3

ENV PYTHONUNBUFFERED 1

WORKDIR /hyperpersonalizer

COPY . /hyperpersonalizer/

RUN pip3 install poetry

RUN poetry install
