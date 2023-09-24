# LaTeX Docker

A containerised LaTeX environment that I maintain for personal use.

## Instructions

To build the image:
```
docker build -t whitefieldcat/latex .
```

To run the image:

Platform|Command
-|-
UNIX-like|`docker run -iv $(pwd):/latex --rm whitefieldcat/latex [`*`command`*`] [`*`args...`*`]`
Windows (`cmd`)|`docker run -iv %cd%:/latex --rm whitefieldcat/latex [`*`command`*`] [`*`args...`*`]`
Windows (Powershell)|`docker run -iv ${PWD}:/laex --rm whitefieldcat/latex [`*`command`*`] [`*`args...`*`]`
