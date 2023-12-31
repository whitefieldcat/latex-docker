# LaTeX Docker

A containerised LaTeX environment that I maintain for personal use.

**Base image:**
Alpine 3.18.3

**Installed TeX Live packages:**
(see the command under `# Install TeX Live packages` in `Dockerfile` for a non-exhaustive list)

**Installed fonts:**
(see the command under `# Install fonts` in `Dockerfile` for an exhaustive list)

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
Note: the working directory that the container will have access to will be fixed to the directory from which this command was issued.

To issue a command to a running daemon, run the `latexd-cmd` script with the desired program and arguments, e.g.
```
.\latexd-cmd.bat tex main.tex
```

To stop a running container, run the `latexd-stop` script, e.g.
```
.\latexd-stop.bat
```
