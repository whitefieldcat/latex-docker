# LaTeX Docker

A containerised LaTeX environment that I maintain for personal use.

## Setup

1. Build the image:
```
docker build -t whitefieldcat/latex
```

2. Add the appropriate wrapper script to your PATH and make it executable if necessary.

## Usage

* To run one-off commands, pass the desired program and arguments to the `latexcmd.*` script.
