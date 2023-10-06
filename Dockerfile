FROM alpine:3.18.3

ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

COPY texlive.profile .

RUN mkdir install-tl && \
	# Install utilities
	apk update upgrade && \
	apk add \
		curl \
		fontconfig \
		perl \
	&& \
	# Get TeX Live installer
	curl -OL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
	zcat < install-tl-unx.tar.gz | tar xf - -C install-tl --strip-components=1 && \
	# Install TeX Live
	perl install-tl/install-tl --profile=texlive.profile && \
	# Cleanup
	rm -r \
		/etc/apk \
		/lib/apk \
		/sbin/apk \
		/usr/share/apk \
		/var/cache/apk \
		install-tl \
		install-tl-unx.tar.gz \
		texlive.profile \
	;

WORKDIR /latex
VOLUME /latex
