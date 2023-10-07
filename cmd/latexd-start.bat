@echo off
docker run ^
	-d ^
	-i ^
	--name latexd ^
	--rm ^
	-t ^
	-v %cd%:/latex ^
	whitefieldcat/latex ^
	/bin/sh -c "sleep infinity"
