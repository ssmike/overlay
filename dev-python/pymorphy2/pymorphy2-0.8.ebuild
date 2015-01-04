# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Morphological analyzer (POS tagger + inflection engine) for Russian language."
HOMEPAGE="https://github.com/kmike/pymorphy2/"
SRC_URI="http://pypi.python.org/packages/source/p/pymorphy2/pymorphy2-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/docopt-0.6
		>=dev-python/pymorphy2_dicts-2.4
		<dev-python/pymorphy2_dicts-3.0
		>=dev-python/dawg-0.7"
RDEPEND="${DEPEND}"
