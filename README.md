# anbernic-stock-builder

_Stock OS port-compilation toolchain for Anbernic H700-based XX consoles_

## Usage

```bash
docker run --rm -it -v "<path-to-your-project>:/workdir" ghcr.io/epassaro/anbernic-stock-builder:main
```

> The entrypoint expects a `build.sh` script placed in the project directory.
>
> See the [anbernic-stock-ports](https://github.com/epassaro/anbernic-stock-ports) repository for examples.
