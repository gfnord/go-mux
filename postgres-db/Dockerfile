# pull official base image
FROM postgres:alpine

# run init.sql
COPY init.sql /docker-entrypoint-initdb.d/
ADD init.sql /docker-entrypoint-initdb.d
RUN chmod a+r /docker-entrypoint-initdb.d/*
