# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="my dirty hacks for 'spring uber jar'"
HOMEPAGE="http://spring.io/"
SRC_URI="http://maven.springframework.org/release/org/springframework/spring/${PVR}.RELEASE/spring-framework-${PVR}.RELEASE-dist.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.7
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.7
  app-arch/unzip
  sys-apps/sed
  ${COMMON_DEP}"

src_unpack(){
	unpack ${A}
	mv ${WORKDIR}/spring-framework-${PVR}.RELEASE ${S}
}

src_install() {
	insinto /usr/share/${P}
	for lib in ${S}/libs/*RELEASE.jar; do 
		libr=$(echo $lib | sed -e "s/RELEASE\.//g")
		mv $lib $libr
    	doins $libr
	done
}
