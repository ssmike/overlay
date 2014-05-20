# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="Compiz without WM feature"
HOMEPAGE="http://git.compiz.org/~tuxmarkv/zcomp/"
SRC_URI=""
EGIT_REPO_URI="git://anongit.compiz.org/users/tuxmarkv/zcomp"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-util/intltool
		virtual/pkgconfig
		dev-libs/boost
		dev-util/cmake
		!x11-wm/compiz
		gnome-base/librsvg
		media-libs/mesa
		sys-devel/patch"
RDEPEND="${DEPEND}"

src_configure() {
    CMAKE_BUILD_TYPE="release"
    PWD=${WORKDIR}/zcomp patch -Np0 -i ${FILESDIR}/compiz-no-gdk_display.patch
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
	)
	cmake-utils_src_configure
}

