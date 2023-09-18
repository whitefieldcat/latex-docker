FROM alpine:latest

# Install utilities
RUN apk update upgrade && \
	apk add curl fontconfig perl && \
	rm -r /var/cache/apk

# Get TeX Live installer
RUN curl -OL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
	mkdir install-tl && \
	zcat < install-tl-unx.tar.gz | tar xf - -C install-tl --strip-components=1 && \
	rm install-tl-unx.tar.gz

# Install TeX Live
COPY texlive.profile .
RUN perl install-tl/install-tl --profile=texlive.profile && \
	rm -r install-tl texlive.profile
ENV PATH="/usr/local/texlive/2023/bin/x86_64-linuxmusl:${PATH}"

WORKDIR /root
VOLUME /root
