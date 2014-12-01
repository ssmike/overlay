# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
INT_VERSION=""

DESCRIPTION="Free mathematics software for learning and teaching GeoGebra is free dynamic mathematics software for all levels of education that joins geometry, algebra, graphing, and calculus in one easy-to-use package."
HOMEPAGE="http://www.geogebra.org/"
SRC_URI="http://www.geogebra.net/linux/rpm/i386/geogebra5-5.0.19.0-37093.i386.rpm"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

inherit rpm

src_unpack() {
	rpm_unpack
    mkdir "${WORKDIR}/geogebra-5"
	cp -r -p ${WORKDIR}/* ${WORKDIR}/geogebra-5
	rm -r ${WORKDIR}/geogebra-999/geogebra-5
}


src_install() {
    cp * -r -p "${D}"
}
