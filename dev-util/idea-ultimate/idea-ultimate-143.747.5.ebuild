EAPI=5
inherit eutils versionator

SLOT="0"
RDEPEND=">=virtual/jdk-1.7
        !dev-util/idea-community"
RESTRICT="strip"
QA_TEXTRELS="opt/idea-ultimate/bin/libbreakgen.so"
DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE (Ultimate Edition)"
HOMEPAGE="http://jetbrains.com/idea/"
SRC_URI="http://download-cf.jetbrains.com/idea/ideaIU-${PV}.tar.gz"
LICENSE="Apache-2.0"
IUSE=""
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/idea-IU-${PV}"

src_install() {
	local dir="/opt/${PN}"
	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/bin/idea.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"
	newicon "bin/idea.png" "${PN}.png"
	make_wrapper ${PN} ${dir}/bin/idea.sh
	make_desktop_entry ${PN} "IntelliJ IDEA(Ultimate Edition)" ${PN} "Development;IDE"
}
