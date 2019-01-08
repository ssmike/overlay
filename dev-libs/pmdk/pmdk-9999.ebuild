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

DEPEND="
	sys-devel/autoconf
	sys-devel/automake
	dev-libs/glib:2
	media-gfx/graphviz
	virtual/pkgconfig
	sys-libs/ncurses
	sys-devel/gcc
	dev-libs/ndctl
	dev-libs/json-c
	virtual/libudev
"

RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install prefix=/usr
}
