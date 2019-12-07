FROM postgres:alpine

ENV POSTGRES_USER jding
ENV POSTGRES_PASSWORD jding
ENV POSTGRES_DB mydb

EXPOSE 5432

ADD ./init.sql docker-entrypoint-initdb.d/
