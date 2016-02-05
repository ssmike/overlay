# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 autotools

DESCRIPTION="An ncurses based client for Feedly."
HOMEPAGE="http://feednix-jarkore.rhcloud.com/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Jarkore/Feednix/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/jsoncpp
		sys-libs/ncurses
		"
RDEPEND="${DEPEND}"

src_prepare() {
	${WORKDIR}/${P}/autogen.sh
}
