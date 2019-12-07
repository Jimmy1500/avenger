FROM postgres:alpine

ENV POSTGRES_USER jimmy
ENV POSTGRES_PASSWORD jimmy
ENV POSTGRES_DB mydb

EXPOSE 5432

ADD ./init.sql docker-entrypoint-initdb.d/
