@echo off
docker exec ^
	-i ^
	-t ^
	latexd ^
	%*
