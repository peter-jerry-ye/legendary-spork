# MoonBit WASI Tree Sitter Template

This is the template for developing a composed components using MoonBit and C.

The structure is organized as follows:

```
.
├── cli
├── deps
├── docs
├── justfile
├── lib
├── README.md
├── tree-sitter
├── tree-sitter-json
└── wit
```

- `cli` : MoonBit project, entrance for an executable based on `wasi-cli`. Depends on `deps` with local dependency
- `deps` : MoonBit project, generated using interface defined in `wit`
- `justfile` : contains scripts based on just system
- `lib` : C project, containing CMakefiles and `impl.c` for implementation, together with generated files under `gen`
- `tree-sitter` : Tree Sitter source code
- `tree-sitter-json` : Tree Sitter for JSON source code
- `wit` : definition for WIT

## Usage

1. Define in interface `types` in `wit/interface.wit`. 
2. Run `just regenerate` to regenerate the files.
3. Implement the new definitions in `impl.c`.
4. Use them in `cli`.
5. Build the project with `just build`, and execute with `just run`.