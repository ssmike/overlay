# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3 autotools
#multilib

DESCRIPTION="User Extensible Heap Manager"
HOMEPAGE="http://memkind.github.io/memkind/"
EGIT_REPO_URI="https://github.com/memkind/memkind"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	sys-process/numactl
	sys-block/ndctl
	sys-devel/gcc
"

KEYWORDS="~amd64"

DEPEND="${RDEPEND}
	sys-devel/autoconf
	sys-devel/automake
	virtual/pkgconfig
	app-arch/unzip
	sys-devel/libtool
"

src_prepare() {
	eapply_user
	./autogen.sh || die
}

src_compile() {
	emake DOC=n
}

src_install() {
	emake DOC=n DESTDIR="${D}" install prefix=/usr
}
