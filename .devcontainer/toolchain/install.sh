#!/usr/bin/env bash
set -euo pipefail

BASHRC_FILE="/home/${_REMOTE_USER}/.bashrc"

############
# Wasmtime #
############

WASMTIME_VERSION="v31.0.0"
WASMTIME_DIST="wasmtime-${WASMTIME_VERSION}-x86_64-linux"
WASMTIME_DOWNLOAD_URL="https://github.com/bytecodealliance/wasmtime/releases/download/${WASMTIME_VERSION}/${WASMTIME_DIST}.tar.xz"
WASMTIME_INSTALL_DIR="/home/${_REMOTE_USER}/.local/wasmtime"
WASMTIME_PATH="${WASMTIME_INSTALL_DIR}/${WASMTIME_DIST}"

# Create Wasmtime installation directory
mkdir -p "${WASMTIME_INSTALL_DIR}"

# Download and extract Wasmtime
echo "Downloading Wasmtime ${WASMTIME_VERSION}..."
curl -fsSL "${WASMTIME_DOWNLOAD_URL}" -o "/tmp/${WASMTIME_DIST}.tar.xz"
echo "Extracting Wasmtime to ${WASMTIME_INSTALL_DIR}..."
tar -xJf "/tmp/${WASMTIME_DIST}.tar.xz" -C "${WASMTIME_INSTALL_DIR}"
rm "/tmp/${WASMTIME_DIST}.tar.xz"

# Update bashrc if not already configured
WASMTIME_BASHRC_ENTRY="export PATH=\"\${PATH}:${WASMTIME_PATH}/\""

if ! grep -q "${WASMTIME_PATH}" "${BASHRC_FILE}"; then
    echo "Updating ${BASHRC_FILE} for Wasmtime..."
    echo "" >> "${BASHRC_FILE}"
    echo "# Wasmtime ${WASMTIME_VERSION}" >> "${BASHRC_FILE}"
    echo "${WASMTIME_BASHRC_ENTRY}" >> "${BASHRC_FILE}"
fi

# Set proper ownership
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${WASMTIME_INSTALL_DIR}"

echo "Wasmtime ${WASMTIME_VERSION} has been installed for ${_REMOTE_USER}"

##############
# Wasm Tools #
##############

WASMTOOLS_VERSION="1.230.0"
WASMTOOLS_DIST="wasm-tools-${WASMTOOLS_VERSION}-x86_64-linux"
WASMTOOLS_DOWNLOAD_URL="https://github.com/bytecodealliance/wasm-tools/releases/download/v${WASMTOOLS_VERSION}/${WASMTOOLS_DIST}.tar.gz"
WASMTOOLS_INSTALL_DIR="/home/${_REMOTE_USER}/.local/wasm-tools"
WASMTOOLS_PATH="${WASMTOOLS_INSTALL_DIR}/${WASMTOOLS_DIST}"

# Create Wasm Tools installation directory
mkdir -p "${WASMTOOLS_INSTALL_DIR}"

# Download and extract Wasm Tools
echo "Downloading Wasm Tools ${WASMTOOLS_VERSION}..."
curl -fsSL "${WASMTOOLS_DOWNLOAD_URL}" -o "/tmp/${WASMTOOLS_DIST}.tar.gz"
echo "Extracting Wasm Tools to ${WASMTOOLS_INSTALL_DIR}..."
tar -xzf "/tmp/${WASMTOOLS_DIST}.tar.gz" -C "${WASMTOOLS_INSTALL_DIR}"
rm "/tmp/${WASMTOOLS_DIST}.tar.gz"

# Update bashrc if not already configured
WASMTOOLS_BASHRC_ENTRY="export PATH=\"\${PATH}:${WASMTOOLS_INSTALL_DIR}/${WASMTOOLS_DIST}\""

if ! grep -q "${WASMTOOLS_PATH}" "${BASHRC_FILE}"; then
    echo "Updating ${BASHRC_FILE} for Wasm Tools..."
    echo "" >> "${BASHRC_FILE}"
    echo "# Wasm Tools ${WASMTOOLS_VERSION}" >> "${BASHRC_FILE}"
    echo "${WASMTOOLS_BASHRC_ENTRY}" >> "${BASHRC_FILE}"
fi

# Set proper ownership
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${WASMTOOLS_INSTALL_DIR}"

echo "Wasm Tools ${WASMTOOLS_VERSION} has been installed for ${_REMOTE_USER}"

###############
# Wit Bindgen #
###############

WIT_BINDGEN_VERSION="0.42.1"
WIT_BINDGEN_DIST="wit-bindgen-${WIT_BINDGEN_VERSION}-x86_64-linux"
WIT_BINDGEN_DOWNLOAD_URL="https://github.com/bytecodealliance/wit-bindgen/releases/download/v${WIT_BINDGEN_VERSION}/${WIT_BINDGEN_DIST}.tar.gz"
WIT_BINDGEN_INSTALL_DIR="/home/${_REMOTE_USER}/.local/wit-bindgen"
WIT_BINDGEN_PATH="${WIT_BINDGEN_INSTALL_DIR}/${WIT_BINDGEN_DIST}"

# Create Wit Bindgen installation directory
mkdir -p "${WIT_BINDGEN_INSTALL_DIR}"

# Download and extract Wit Bindgen
echo "Downloading Wit Bindgen ${WIT_BINDGEN_VERSION}..."
curl -fsSL "${WIT_BINDGEN_DOWNLOAD_URL}" -o "/tmp/${WIT_BINDGEN_DIST}.tar.gz"
echo "Extracting Wit Bindgen to ${WIT_BINDGEN_INSTALL_DIR}..."
tar -xzf "/tmp/${WIT_BINDGEN_DIST}.tar.gz" -C "${WIT_BINDGEN_INSTALL_DIR}"
rm "/tmp/${WIT_BINDGEN_DIST}.tar.gz"

# Update bashrc if not already configured
WIT_BINDGEN_BASHRC_ENTRY="export PATH=\"\${PATH}:${WIT_BINDGEN_INSTALL_DIR}/${WIT_BINDGEN_DIST}\""

if ! grep -q "${WIT_BINDGEN_PATH}" "${BASHRC_FILE}"; then
    echo "Updating ${BASHRC_FILE} for Wit Bindgen..."
    echo "" >> "${BASHRC_FILE}"
    echo "# Wit Bindgen ${WIT_BINDGEN_VERSION}" >> "${BASHRC_FILE}"
    echo "${WIT_BINDGEN_BASHRC_ENTRY}" >> "${BASHRC_FILE}"
fi

# Set proper ownership
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${WIT_BINDGEN_INSTALL_DIR}"

echo "Wit Bindgen ${WIT_BINDGEN_VERSION} has been installed for ${_REMOTE_USER}"

############
# WASI SDK #
############

WASI_SDK_VERSION="25"
WASI_SDK_DIST="wasi-sdk-${WASI_SDK_VERSION}.0-x86_64-linux"
WASI_SDK_DOWNLOAD_URL="https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_SDK_VERSION}/${WASI_SDK_DIST}.tar.gz"
WASI_SDK_INSTALL_DIR="/home/${_REMOTE_USER}/.local/wasi-sdk"
WASI_SDK_PATH="${WASI_SDK_INSTALL_DIR}/${WASI_SDK_DIST}"

# Create Wit Bindgen installation directory
mkdir -p "${WASI_SDK_INSTALL_DIR}"

# Download and extract WASK SDK
echo "Downloading WASI SDK ${WASI_SDK_VERSION}..."
curl -fsSL "${WASI_SDK_DOWNLOAD_URL}" -o "/tmp/${WASI_SDK_DIST}.tar.gz"
echo "Extracting WASI SDK to ${WASI_SDK_INSTALL_DIR}..."
tar -xzf "/tmp/${WASI_SDK_DIST}.tar.gz" -C "${WASI_SDK_INSTALL_DIR}"
rm "/tmp/${WASI_SDK_DIST}.tar.gz"

# Update bashrc if not already configured
WASI_SDK_BASHRC_ENTRY="export WASI_SDK_PATH=\"${WASI_SDK_INSTALL_DIR}/${WASI_SDK_DIST}\""

if ! grep -q "${WASI_SDK_PATH}" "${BASHRC_FILE}"; then
    echo "Updating ${BASHRC_FILE} for WASI SDK..."
    echo "" >> "${BASHRC_FILE}"
    echo "# WASI SDK ${WASI_SDK_VERSION}" >> "${BASHRC_FILE}"
    echo "${WASI_SDK_BASHRC_ENTRY}" >> "${BASHRC_FILE}"
fi

# Set proper ownership
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${WASI_SDK_INSTALL_DIR}"

echo "WASI SDK ${WASI_SDK_VERSION} has been installed for ${_REMOTE_USER}"

########
# just #
########

JUST_VERSION="1.40.0"
JUST_DIST="just-${JUST_VERSION}-x86_64-unknown-linux-musl"
JUST_DOWNLOAD_URL="https://github.com/casey/just/releases/download/${JUST_VERSION}/${JUST_DIST}.tar.gz"
JUST_INSTALL_DIR="/home/${_REMOTE_USER}/.local/just"
JUST_BIN_DIR="/home/${_REMOTE_USER}/.local/bin"

# Create installation directories
mkdir -p "${JUST_INSTALL_DIR}"
mkdir -p "${JUST_BIN_DIR}"

# Download and extract Just
echo "Downloading Just ${JUST_VERSION}..."
curl -fsSL "${JUST_DOWNLOAD_URL}" -o "/tmp/${JUST_DIST}.tar.gz"
echo "Extracting Just to ${JUST_INSTALL_DIR}..."
tar -xzf "/tmp/${JUST_DIST}.tar.gz" -C "${JUST_INSTALL_DIR}"
rm "/tmp/${JUST_DIST}.tar.gz"

# Copy just binary to bin directory
cp "${JUST_INSTALL_DIR}/just" "${JUST_BIN_DIR}/"

# Update bashrc if not already configured
JUST_BASHRC_ENTRY="export PATH=\"\${PATH}:${JUST_BIN_DIR}\""

if ! grep -q "${JUST_BIN_DIR}" "${BASHRC_FILE}"; then
    echo "Updating ${BASHRC_FILE} for Just..."
    echo "" >> "${BASHRC_FILE}"
    echo "# Just ${JUST_VERSION}" >> "${BASHRC_FILE}"
    echo "${JUST_BASHRC_ENTRY}" >> "${BASHRC_FILE}"
fi

# Set proper ownership
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${JUST_INSTALL_DIR}"
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${JUST_BIN_DIR}"

echo "Just ${JUST_VERSION} has been installed for ${_REMOTE_USER}"