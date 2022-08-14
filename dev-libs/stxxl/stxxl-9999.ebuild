# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake git-r3 multilib

DESCRIPTION="Standard Template Library for Extra Large Data Sets"
HOMEPAGE="http://stxxl.org/"
EGIT_REPO_URI="https://github.com/stxxl/stxxl"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DINSTALL_LIB_DIR=$(get_libdir)
	)

	cmake_src_configure
}
