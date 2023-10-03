FROM alpine:3.18.3

ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

COPY texlive.profile .

RUN mkdir install-tl && \
# Install utilities
	apk update upgrade && \
	apk add curl fontconfig perl && \
	rm -r /var/cache/apk && \
# Get TeX Live installer
	curl -OL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
	zcat < install-tl-unx.tar.gz | tar xf - -C install-tl --strip-components=1 && \
	rm install-tl-unx.tar.gz && \
# Install TeX Live
	perl install-tl/install-tl --profile=texlive.profile && \
	rm -r install-tl texlive.profile

WORKDIR /latex
VOLUME /latex
