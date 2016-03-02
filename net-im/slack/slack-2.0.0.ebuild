# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="slack client"
HOMEPAGE=""
SRC_URI="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/tar"
RDEPEND="${DEPEND}"



src_unpack() {
	cd ${WORKIR}
	unpack ${A}
	mkdir ${S}
	tar xJf data.tar.xz -C ${S}
}

src_prepare() {
	rm -r ${S}/etc/cron.daily
}

src_install() {
	cp -R ${S}/* "${D}/" || die "Install failed!"
}
