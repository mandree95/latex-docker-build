# latex-docker-build
This docker image can be used to build pdf files from tex files.
Just call the build script like in the following example:

```bash
$ latex-build -l abschlussarbeit -c
```

The argument `-l ARG` is the name of your main tex file without file extension.
`-c` stands for something like cleanup. If set, the latex files are cleaned up.