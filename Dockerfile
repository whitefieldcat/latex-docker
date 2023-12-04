FROM alpine:3.18.3

ENV PATH="/usr/local/texlive/bin/native:${PATH}"

COPY texlive.profile .

# Update + install basic utilities
RUN \
	apk update upgrade; \
	apk add \
		curl \
		fontconfig \
		perl \
	;

# Install TeX Live system
RUN \
	mkdir install-tl; \
	curl -OL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	zcat < install-tl-unx.tar.gz | tar xf - -C install-tl --strip-components=1; \
	perl install-tl/install-tl --profile=texlive.profile; \
	mv $(find /usr/local/texlive/bin/* -type d -maxdepth 1) /usr/local/texlive/bin/native;

# Install TeX Live packages
RUN tlmgr install \
;

# Install fonts
RUN \
	mkdir -p /usr/share/fonts; \
	fc-cache -rv

WORKDIR /latex
VOLUME /latex
