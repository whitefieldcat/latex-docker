@echo off
docker run -iv %cd%:/latex --rm whitefieldcat/latex %*
