docker run `
	-d `
	-i `
	-t `
	-v ${PWD}:/latex `
	--rm `
	--name latexd `
	whitefieldcat/latex `
	/bin/sh -c "sleep infinity"
