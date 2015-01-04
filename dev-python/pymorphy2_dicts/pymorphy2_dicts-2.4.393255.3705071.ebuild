# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy)

inherit distutils-r1

DESCRIPTION="OpenCorpora.org dictionaries pre-compiled for pymorphy2"
HOMEPAGE="https://github.com/kmike/pymorphy2-dicts/"
SRC_URI="https://pypi.python.org/packages/source/p/pymorphy2-dicts/pymorphy2-dicts-2.4.393255.3705071.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	mv pymorphy2-dicts-${PV} ${PF}
}
