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
UNIX-like|`docker run -iv $(pwd):/root --rm whitefieldcat/latex [`*`command`*`] [`*`args...`*`]`
Windows (`cmd`)|`docker run -iv %cd%:/root --rm whitefieldcat/latex [`*`command`*`] [`*`args...`*`]`
Windows (Powershell)|`docker run -iv ${PWD}:/root --rm whitefieldcat/latex [`*`command`*`] [`*`args...`*`]`
