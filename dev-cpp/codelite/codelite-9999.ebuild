# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Open-source, cross platform IDE for the C/C++ programming languages"
HOMEPAGE="http://www.codelite.org/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/eranif/codelite"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


LIBS=">=x11-libs/wxGTK-3.0
	  net-libs/libssh
	  net-libs/webkit-gtk
	  >=x11-libs/wxGTK-3.0"

DEPEND="${LIBS}		
		dev-util/pkgconfig"
RDEPEND="${LIBS}"

src_configure() {
    CMAKE_BUILD_TYPE="release"
#	local mycmakeargs=(
#		$(cmake-utils_use_enable debug)
#		$(cmake-utils_use_enable doc CLDOCS)
#		$(cmake-utils_use_build static-libs STATIC_LIBRARIES)
#	)
# 	examples
	cmake-utils_src_configure
}

src_compile() {
    cmake-utils_src_compile
}

src_install() {
    cmake-utils_src_install

	into /
	dodoc README.md
}
