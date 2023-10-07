docker run `
	-d `
	-i `
	-t `
	-v %cd%:/latex `
	--rm `
	--name latexd `
	whitefieldcat/latex `
	/bin/sh -c "sleep infinity"
