# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3
#multilib

DESCRIPTION="Persistent Memory Development Kit"
HOMEPAGE="https://pmem.io/pmdk/"
EGIT_REPO_URI="https://github.com/pmem/pmdk"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-libs/glib:2
	media-gfx/graphviz
	sys-libs/ncurses
	sys-devel/gcc
	dev-libs/ndctl
	dev-libs/json-c
	virtual/libudev
"

KEYWORDS="~amd64"

DEPEND="${RDEPEND}
	sys-devel/autoconf
	sys-devel/automake
	virtual/pkgconfig
"

src_prepare() {
	eapply_user
}

src_compile() {
	emake DOC=n
}

src_install() {
	emake DOC=n DESTDIR="${D}" install prefix=/usr
}
