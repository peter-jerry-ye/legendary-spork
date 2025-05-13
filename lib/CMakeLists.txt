cmake_minimum_required(VERSION 3.10)

project(wasi-tree-sitter)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/../tree-sitter/lib/src)
include_directories(${CMAKE_SOURCE_DIR}/../tree-sitter/lib/include)
include_directories(${CMAKE_SOURCE_DIR}/exports.h)
include_directories(${CMAKE_SOURCE_DIR}/types.h)

# Add definitions
add_definitions(-D__EMSCRIPTEN__)

# Source files
file(GLOB LIB_SOURCES "${CMAKE_SOURCE_DIR}/gen/*.c")
file(GLOB LIB_OBJECTS "${CMAKE_SOURCE_DIR}/gen/*.o")
set(SOURCES
    impl.c
    ${CMAKE_SOURCE_DIR}/../tree-sitter/lib/src/lib.c
    ${CMAKE_SOURCE_DIR}/../tree-sitter-json/src/parser.c
    ${LIB_SOURCES}
    ${LIB_OBJECTS}
)

# Add executable
add_executable(wasi-tree-sitter.wasm ${SOURCES})