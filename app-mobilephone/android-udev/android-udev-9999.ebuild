# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="android udev rules"
HOMEPAGE="https://aur.archlinux.org/packages/android-udev/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/M0Rf30/android-udev-rules.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="libmtp"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /lib/udev/rules.d
	doins 51-android.rules

	into /
	dodoc README.md
}
