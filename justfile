run:
    wasmtime run --dir . cli/target/executable.wasm

build target=("debug"):
    @echo "Building C Component"
    mkdir -p lib/build
    cmake -DCMAKE_TOOLCHAIN_FILE=${WASI_SDK_PATH}/share/cmake/wasi-sdk-p2.cmake -B lib/build -S lib
    make -C lib/build
    # @echo "Building MoonBit Component"
    # moon build -C cli --target wasm --{{ target }}
    # wasm-tools component embed --encoding utf16 -w executable wit cli/target/wasm/{{ target }}/build/cli-template.wasm -o cli/target/cli.core.wasm
    # wasm-tools component new cli/target/cli.core.wasm -o cli/target/cli.wasm
    # @echo "Compose Components"
    # wac plug cli/target/cli.wasm --plug lib/build/wasi-sqlite.wasm -o cli/target/executable.wasm

regenerate:
    wit-bindgen c wit -w exports --out-dir lib
    wit-bindgen markdown wit -w exports --out-dir docs
    wit-bindgen markdown wit -w imports --out-dir docs
    wit-bindgen moonbit wit -w imports --derive-eq --derive-show --derive-error --ignore-stub --out-dir deps
    moon fmt -C deps
    rm -r deps/gen deps/world

clean:
    rm -r lib/build
    moon clean -C cli
    moon clean -C deps