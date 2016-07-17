# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5


PYTHON_COMPAT=( python{2_7,3_4} )
PYTHON_REQ_USE='threads(+)'

inherit git-r3 vala waf-utils python-any-r1

DESCRIPTION="tiliado gui library"
HOMEPAGE="https://tiliado.eu/diorite/"
LICENSE="BSD-2"
SLOT="0"
EGIT_REPO_URI="git://github.com/tiliado/diorite"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:3
"

DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
"

src_install() {
	cd "${S}"
	./waf --destdir="${D}" install --no-ldconfig
}
