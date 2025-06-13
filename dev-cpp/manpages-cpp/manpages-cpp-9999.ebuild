# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="8"

PYTHON_COMPAT=( python{3_12,3_13} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Generates C++ man pages from cplusplus.com"
HOMEPAGE="https://github.com/Aitjcize/cppman/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Aitjcize/cppman.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/sqlite3dbm
         sys-apps/groff"

src_compile () {
	distutils-r1_src_compile || die "compile failed"
}

src_install () {
	distutils-r1_src_install || die "install failed"
}
