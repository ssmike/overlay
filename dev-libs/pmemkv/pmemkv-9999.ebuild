# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="Key/Value Datastore for Persistent Memory"
HOMEPAGE="https://github.com/pmem/pmemkv"
EGIT_REPO_URI="git://github.com/pmem/pmemkv"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/pmdk-1.4 dev-cpp/tbb dev-libs/rapidjson dev-libs/memkind"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-util/cmake-3.3"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TYPE=Release
		-DBUILD_TESTS=OFF
		-DTESTS_USE_VALGRIND=OFF
	)
	cmake-utils_src_configure
}
