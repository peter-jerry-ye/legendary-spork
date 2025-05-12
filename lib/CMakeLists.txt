cmake_minimum_required(VERSION 3.10)

project(wasi-sqlite)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/../sqlite-amalgamation-3490200)
include_directories(${CMAKE_SOURCE_DIR}/exports.h)

# Source files
file(GLOB LIB_SOURCES "${CMAKE_SOURCE_DIR}/gen/*.c")
file(GLOB LIB_OBJECTS "${CMAKE_SOURCE_DIR}/gen/*.o")
set(SOURCES
    impl.c
    ${CMAKE_SOURCE_DIR}/../sqlite-amalgamation-3490200/sqlite3.c
    ${LIB_SOURCES}
    ${LIB_OBJECTS}
)

# Add executable
add_executable(wasi-sqlite.wasm ${SOURCES})