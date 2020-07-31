# pull official base image
FROM postgres:alpine

# run init.sql
COPY *.sql /docker-entrypoint-initdb.d/
#ADD 1_init.sql /docker-entrypoint-initdb.d
#ADD 1_init.sql /docker-entrypoint-initdb.d
RUN chmod a+r /docker-entrypoint-initdb.d/*
