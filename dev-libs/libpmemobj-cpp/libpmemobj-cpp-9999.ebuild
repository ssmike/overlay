# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="C++ bindings for libpmemobj"
HOMEPAGE="https://github.com/pmem/libpmemobj-cpp"
EGIT_REPO_URI="git://github.com/pmem/libpmemobj-cpp"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-libs/pmdk-1.4"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-util/cmake-3.3"
