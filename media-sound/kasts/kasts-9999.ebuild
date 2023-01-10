# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake
EGIT_REPO_URI="https://invent.kde.org/plasma-mobile/kasts.git"
EGIT_BRANCH="master"

DESCRIPTION="Convergent podcast application."
HOMEPAGE="https://apps.kde.org/kasts/"

SLOT="0"

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"

BDEPEND="dev-util/cmake"

RDEPEND="
	kde-frameworks/kcoreaddons
	kde-frameworks/ki18n
	kde-frameworks/kconfig
	dev-libs/kirigami-addons
	kde-frameworks/kirigami
	kde-frameworks/syndication
	media-libs/taglib
	dev-libs/qtkeychain
	kde-frameworks/threadweaver
"

#src_configure() {
#	local mycmakeargs=(
#		-DWITH_MP3Tunes=OFF
#		-DWITH_PLAYER=ON
#		-DWITH_UTILITIES=ON
#		-DCMAKE_DISABLE_FIND_PACKAGE_Googlemock=ON
#		-DCMAKE_DISABLE_FIND_PACKAGE_MySQLe=ON
#		-DWITH_IPOD=$(usex ipod)
#		$(cmake_use_find_package lastfm LibLastFm)
#		$(cmake_use_find_package !mariadb MySQL)
#		$(cmake_use_find_package mtp Mtp)
#		$(cmake_use_find_package ofa LibOFA)
#		$(cmake_use_find_package podcast Mygpo-qt5)
#		$(cmake_use_find_package wikipedia Qt5WebEngine)
#	)
#	use ipod && mycmakeargs+=( DWITH_GDKPixBuf=ON )
#
#	ecm_src_configure
#}

