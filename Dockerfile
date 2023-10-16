FROM alpine:3.18.3

ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

COPY . .

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
	perl install-tl/install-tl --profile=texlive.profile

# Install TeX Live packages
RUN tlmgr install $(xargs echo < lists/packages.txt)

# Install fonts
RUN \
	mkdir -p /usr/share/fonts; \
	curl $(xargs -I {} printf "-OL {} " {} < lists/fonts.txt | xargs) --output-dir /usr/share/fonts; \
	fc-cache -rv

# Cleanup
RUN rm -fr \
	install-tl \
	install-tl \
	install-tl-unx.tar.gz \
	lists \
	texlive.profile \
;

WORKDIR /latex
VOLUME /latex
