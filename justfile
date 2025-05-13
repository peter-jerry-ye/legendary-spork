run:
    wasmtime run --dir . cli/target/executable.wasm

build target=("debug"):
    @echo "Building C Component"
    mkdir -p lib/build
    cmake -DCMAKE_TOOLCHAIN_FILE=${WASI_SDK_PATH}/share/cmake/wasi-sdk-p2.cmake -B lib/build -S lib
    make -C lib/build
    @echo "Updating WIT deps"
    wit-deps -d cli/wit/deps -m cli/wit/deps.toml -l cli/wit/deps.lock
    @echo "Building MoonBit Component"
    just cli/build {{ target }}
    @echo "Compose Components"
    wac plug cli/target/cli.wasm --plug lib/build/wasi-tree-sitter.wasm -o cli/target/executable.wasm

regenerate:
    wit-bindgen c wit -w exports --out-dir lib/gen
    wit-bindgen markdown wit -w exports --out-dir docs
    wit-bindgen markdown wit -w imports --out-dir docs
    wit-bindgen moonbit wit -w imports --derive-eq --derive-show --derive-error --ignore-stub --out-dir deps
    moon fmt -C deps
    rm -r deps/gen deps/world

clean:
    rm -r lib/build
    moon clean -C cli
    moon clean -C deps