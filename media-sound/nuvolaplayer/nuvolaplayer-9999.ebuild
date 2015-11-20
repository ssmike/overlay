# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5

inherit bzr gnome2-utils vala waf-utils

DESCRIPTION="Cloud music integration for your Linux desktop"
HOMEPAGE="https://launchpad.net/nuvola-player"

EBZR_REPO_URI="lp:nuvola-player"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

RDEPEND="
	media-sound/diorite
	x11-libs/gtk+:3
	dev-libs/libgee:0
	dev-libs/json-glib
	net-libs/webkit-gtk:3[gstreamer]
	media-libs/gstreamer:1.0
	media-plugins/gst-plugins-mad:1.0
	dev-libs/libunique:3
	>=net-libs/libsoup-2.34
	x11-libs/gdk-pixbuf[jpeg]
"
DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
"

src_unpack() {
	bzr_src_unpack
}

src_prepare() {
	bzr_src_prepare
	vala_src_prepare --ignore-use
}

src_configure() {
	waf-utils_src_configure
}

src_compile() {
	cd ${S}
	./waf build
	#waf-utils_src_install --skip-tests --no-system-hooks
}

src_install() {
	cd ${S}
	./waf install --destdir="../../image" --no-system-hooks 
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
