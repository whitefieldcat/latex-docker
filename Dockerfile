FROM alpine:3.18.3

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
ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

# Install TeX Live packages
RUN tlmgr install \
	bidi \
	booktabs \
	etoolbox \
	expex \
	fancyhdr \
	float \
	fontspec \
	gb4e \
	glossaries \
	graphics \
	hyperref \
	infwarerr \
	kvoptions \
	leipzig \
	multirow \
	parskip \
	pdftexcmds \
	titlesec \
	tools \
	xcolor \
	xetex \
	zref \
;

# Install fonts
RUN \
	mkdir -p /usr/share/fonts; \
	curl --output-dir /usr/share/fonts \
		-OL https://github.com/notofonts/notofonts.github.io/raw/main/fonts/NotoSerif/hinted/ttf/NotoSerif-{Bold,BoldItalic,Italic,Regular}.ttf \
		-OL https://github.com/Tarobish/Mirza/raw/gh-pages/Fonts/Mirza-{Bold,Regular}.ttf \
	; \
	fc-cache -rv

# Cleanup
RUN rm -fr \
	install-tl \
	install-tl-unx.tar.gz \
	lists \
	texlive.profile \
;

WORKDIR /latex
VOLUME /latex
