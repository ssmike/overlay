# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 git-r3

DESCRIPTION="update-notifier like tray icon for portage"
HOMEPAGE="https://github.com/ssmike/update-notifier-tray"
EGIT_REPO_URI="https://github.com/ssmike/update-notifier-tray"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/notify-python
	dev-python/PyQt5
	sys-apps/lsb-release
	sys-apps/portage
	virtual/notification-daemon
	"
