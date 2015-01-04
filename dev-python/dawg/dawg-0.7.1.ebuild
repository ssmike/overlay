# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy)

inherit distutils-r1

DESCRIPTION="Pure-python reader for DAWGs created by dawgdic C++ library or DAWG Python extension."
HOMEPAGE="https://github.com/kmike/DAWG-Python/"
SRC_URI="https://pypi.python.org/packages/source/D/DAWG-Python/DAWG-Python-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	mv DAWG-Python-${PV} ${PF}
}
