# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )
PYTHON_REQ_USE='threads(+)'

inherit  gnome2-utils vala waf-utils python-any-r1 git-r3

DESCRIPTION="Cloud music integration for your Linux desktop"
HOMEPAGE="https://launchpad.net/nuvola-player"

EGIT_REPO_URI="https://github.com/tiliado/nuvolaplayer.git"
#EGIT_BRANCH="3.0.x"

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

src_prepare() {
	vala_src_prepare --ignore-use
}

src_compile() {
	cd ${S}
	./waf build
	#waf-utils_src_install --skip-tests --no-system-hooks
}

src_install() {
	cd ${S}
	./waf install --destdir="${D}" --no-system-hooks
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
