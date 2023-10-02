@echo off
docker run ^
	-i ^
	-v %cd%:/latex ^
	--rm ^
	whitefieldcat/latex ^
	%*
