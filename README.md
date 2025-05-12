# MoonBit WASI SQLITE Template

This is the template for developing a composed components using MoonBit and C.

The structure is organized as follows:

```
.
├── cli
├── deps
├── justfile
├── lib
├── README.md
├── sqlite-amalgamation-3490200
└── wit
```

- `cli` : MoonBit project, entrance for an executable based on `wasi-cli`. Depends on `deps` with local dependency
- `deps` : MoonBit project, generated using interface defined in `wit`
- `justfile` : contains scripts based on just system
- `lib` : C project, containing CMakefiles and `impl.c` for implementation, together with generated files under `gen`
- `sqlite-amalgamation-3490200` : SQLite source code
- `wit` : definition for WIT

## Usage

1. Define in interface `types` in `wit/sqlite.wit`. 
2. Run `just regenerate` to regenerate the files.
3. Implement the new definitions in `impl.c`.
4. Use them in `cli`.
5. Build the project with `just build`, and execute with `just run`.