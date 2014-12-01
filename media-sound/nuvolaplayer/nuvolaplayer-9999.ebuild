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
KEYWORDS=""
IUSE="debug"

RDEPEND="
	x11-libs/gtk+:3
	dev-libs/libgee:0
	dev-libs/json-glib
	net-libs/webkit-gtk:3[gstreamer]
	media-libs/gstreamer:1.0
	media-plugins/gst-plugins-mad:1.0
	dev-libs/libunique:3
	>=net-libs/libsoup-2.34
	x11-libs/gdk-pixbuf[jpeg]
	dev-lang/python:2.7
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

	# 0 fails the test in configure, so it fails if the code isnt under bzr
	cd ${WORKDIR}/${PF}
	sed -i 's#revision = 0#revision = "0"#' waf_nuvolaextras.py || die

	# Fix build failure by using our own vapi file... I know
	#cp "${FILESDIR}/libnotify.vapi" "${S}/vapi" || die

	vala_src_prepare --ignore-use
}

src_configure() {
	cd ${WORKDIR}/${PF}
	python2 ./waf configure \
		--no-svg-optimization \
		--no-unity-quick-list \
		--with-gstreamer=1.0 || die
}

src_compile() {
	cd ${WORKDIR}/${PF}
	python2 ./waf build --skip-tests || die
}

src_install() {
	cd ${WORKDIR}/${PF}
	python2 ./waf install --destdir="${D}" || die
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
