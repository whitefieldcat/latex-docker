FROM alpine:3.18.3

ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

COPY . .

RUN mkdir install-tl; \
	# Install utilities
	apk update upgrade; \
	apk add \
		curl \
		fontconfig \
		perl \
	; \
	# Get TeX Live installer
	curl -OL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	zcat < install-tl-unx.tar.gz | tar xf - -C install-tl --strip-components=1; \
	# Install TeX Live core
	perl install-tl/install-tl --profile=texlive.profile; \
	# Install TeX Live packages
	tlmgr install $(xargs echo < lists/packages.txt); \
	# Install fonts
	mkdir -p /usr/share/fonts; \
	curl $(xargs -I {} printf "-OL {} " {} < lists/fonts.txt | xargs) --output-dir /usr/share/fonts; \
	fc-cache -rv; \
	# Cleanup
	rm -r \
		# apk
		/etc/apk \
		/lib/apk \
		/sbin/apk \
		/usr/share/apk \
		/var/cache/apk \
		/var/lib/apk \
		# Installation artifacts
		install-tl \
		install-tl-unx.tar.gz \
		lists \
		texlive.profile \
	;

WORKDIR /latex
VOLUME /latex
