# LaTeX Docker

A containerised LaTeX environment that I maintain for personal use.

## Setup

1. Build the image:
```
docker build -t whitefieldcat/latex
```

2. Add the scripts for your platform to your PATH and make them executable if necessary.

## Usage

To run one-off commands, pass the desired program and arguments to the `latexcmd` script, e.g.
```
.\latex-cmd.bat tex main.tex
```

To start a container as a daemon, run the `latexd-start` script, e.g.
```
.\latexd-start.bat
```

To issue a command to a running daemon, run the `latexd-cmd` script with the desired program and arguments, e.g.
```
.\latexd-cmd.bat tex main.tex
```

To stop a running container, run the `latexd-stop` script, e.g.
```
.\latexd-stop.bat
```
