# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
DESCRIPTION='small script to manage NetworkManager connections with dmenu instead of nm-applet'
SLOT=0
HOMEPAGE='https://github.com/firecat53/nmcli-dmenu'
LICENSE='MIT'
SRC_URI="https://github.com/firecat53/networkmanager-dmenu/archive/v${PV}.tar.gz"
KEYWORDS="alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
RDEPEND='dev-lang/python
         dev-python/pygobject'

src_install() {
	dobin 'networkmanager_dmenu'
}