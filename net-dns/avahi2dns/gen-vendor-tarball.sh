#!/usr/bin/env bash
# Generates the vendor tarball required by the avahi2dns ebuild.
# Run this once, then place the output in your distfiles directory.
#
# Usage: ./gen-vendor-tarball.sh [version]
# Default version: 0.1.0

set -euo pipefail

VERSION="${1:-0.1.0}"
PKG="avahi2dns-${VERSION}"
TARBALL="${PKG}-vendor.tar.xz"

echo "==> Fetching source for v${VERSION} ..."
TMPDIR=$(mktemp -d)
trap 'rm -rf "${TMPDIR}"' EXIT

cd "${TMPDIR}"
curl -fL "https://github.com/LouisBrunner/avahi2dns/archive/refs/tags/${VERSION}.tar.gz" \
    -o "${PKG}.tar.gz"
tar xf "${PKG}.tar.gz"
cd "${PKG}"

echo "==> Vendoring Go modules ..."
GOMODCACHE="${PWD}/go-mod" go mod download -modcacherw

echo "==> Creating ${TARBALL} ..."
XZ_OPT='-T0 -9' tar -acf "${OLDPWD}/${TARBALL}" go-mod

echo "==> Done: ${OLDPWD}/${TARBALL}"
echo "    Copy this to your DISTDIR (usually /var/cache/distfiles/)"

mv ${OLDPWD}/${TARBALL} "${2:-/usr/portage/distfiles}"
