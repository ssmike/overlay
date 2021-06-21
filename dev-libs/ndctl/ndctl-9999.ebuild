# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 autotools multilib

DESCRIPTION="Utility library for managing the libnvdimm sub-system in the Linux kernel "
HOMEPAGE="https://pmem.io/ndctl/"
EGIT_REPO_URI="https://github.com/pmem/ndctl"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-libs/glib:2
	media-gfx/graphviz
	sys-libs/ncurses
	sys-devel/gcc
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
	./autogen.sh || die "autogen failed"
	#eautoreconf
	eapply_user
}

src_configure() {
	./configure --prefix=/usr --libdir=/usr/$(get_libdir) --without-bash --disable-docs || die "configure failed"
}

src_compile() {
	emake INCLUDES="${INCLUDES} -I../rapidjson/include"
}
