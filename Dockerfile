FROM alpine:latest

LABEL maintainer="Nguyen Van Manh<manh.nguyen@vmodev.com>"

RUN apk update \
	&& apk add htop \
	vim \
	git \
	tree \
	curl \
	ncurses \
	util-linux \
	groff \
	bc \
	&& rm -rf /var/cache/apk/*

COPY start.sh /
RUN apk add --no-cache nano
RUN apk del vim
RUN chmod +x /start.sh

ENTRYPOINT [ "./start.sh" ]