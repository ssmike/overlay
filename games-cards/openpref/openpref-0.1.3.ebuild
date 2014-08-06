# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games cmake-utils

DESCRIPTION="open source implementation of European trick-taking game Preferans"
HOMEPAGE="http://openpref.sourceforge.net/"
SRC_URI="http://switch.dl.sourceforge.net/project/openpref/OpenPref-Qt4/openpref-0.1.3/openpref-0.1.3.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-qt/qtcore"
RDEPEND="${DEPEND}"

