# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="C++ bindings for libpmemobj"
HOMEPAGE="https://github.com/pmem/libpmemobj-cpp"
EGIT_REPO_URI="https://github.com/pmem/libpmemobj-cpp"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/pmdk-1.4"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-util/cmake-3.3"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TYPE=Release
		-DBUILD_TESTS=OFF
		-DTESTS_USE_VALGRIND=OFF
	)

	cmake_src_configure
}
