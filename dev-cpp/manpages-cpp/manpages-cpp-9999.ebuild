# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

PYTHON_COMPAT=( python{3_4,3_5,3_6,3_7,3_8,3_9} )

inherit distutils-r1 git-r3

DESCRIPTION="Generates C++ man pages from cplusplus.com"
HOMEPAGE="https://github.com/Aitjcize/cppman/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/aitjcize/cppman.git"

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
