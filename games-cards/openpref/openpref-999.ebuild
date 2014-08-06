# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games cmake-utils git-2

DESCRIPTION="open source implementation of European trick-taking game Preferans"
HOMEPAGE="http://openpref.sourceforge.net/"
SRC_URI=""
EGIT_REPO_URI="git://gitorious.org/openprefqt4/annulens-clone.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-qt/qtcore"
RDEPEND="${DEPEND}"

