# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
INT_VERSION=""

DESCRIPTION="Free mathematics software for learning and teaching GeoGebra is free dynamic mathematics software for all levels of education that joins geometry, algebra, graphing, and calculus in one easy-to-use package."
HOMEPAGE="http://www.geogebra.org/"
SRC_URI="$(curl -I http://www.geogebra.org/installers/rpm.php | sed -n "/^Location/p"| sed -e "s/^Location: //g")"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

inherit rpm

src_unpack() {
	rpm_unpack
    mkdir "${WORKDIR}/geogebra-999"
	cp -r -p ${WORKDIR}/* ${WORKDIR}/geogebra-999
	rm -r ${WORKDIR}/geogebra-999/geogebra-999
}


src_install() {
    cp * -r -p "${D}"
}
