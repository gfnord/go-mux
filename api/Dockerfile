# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang:1.12-alpine base image
FROM golang:1.14.6-alpine

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apk update && apk upgrade && \
    apk add --no-cache git 

# Add Maintainer Info
LABEL maintainer="Gustavo Nobrega <gustavofn@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
#COPY go.mod go.sum ./

# Install de dependencies
RUN go get -u github.com/gorilla/mux github.com/lib/pq

# Copy the source from the current directory to the Working Directory inside the container
COPY *.go ./
COPY .env .

# Build the Go app
RUN go build -o go-mux.bin .

# Expose port 8080 to the outside world
EXPOSE 8010

# Run the executable
CMD ["./go-mux.bin"]

