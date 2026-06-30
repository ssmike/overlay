# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop go-module optfeature shell-completion systemd xdg-utils

DESCRIPTION="Unified calendar app (Local/Google/Microsoft/CalDAV/iCloud) for the dank desktop"
HOMEPAGE="https://github.com/AvengeMedia/dankcalendar"
# Upstream's release workflow runs 'go mod vendor' inside core/ and then packs the
# whole tree (root Makefile, core/ with core/vendor/, quickshell/, assets/) under a
# dankcalendar-${PV}/ prefix. So this single distfile is self-contained and builds
# fully offline.
SRC_URI="https://github.com/AvengeMedia/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Static Go core (CGO_ENABLED=0) + Quickshell QML UI. Runtime deps are for the UI.
RDEPEND="
	gui-apps/quickshell
	dev-qt/qtbase:6[dbus,wayland,widgets]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	dev-qt/qtwayland:6
"
BDEPEND=">=dev-lang/go-1.25.8"

RESTRICT="strip"

src_unpack() {
	# The Go module lives in core/ (vendored at core/vendor/), not at the tarball
	# root, so go-module.eclass's root-level 'go mod verify' does not apply here.
	# A plain unpack is all that is needed; the build runs offline from core/.
	default
}

src_compile() {
	# Force the vendored, fully-offline build regardless of toolchain defaults.
	export GOFLAGS="${GOFLAGS} -mod=vendor"
	export GOPROXY="off"

	# The core Makefile derives VERSION from 'git describe', which is unavailable
	# in a release tarball; pass it explicitly so 'dcal --version' is correct.
	# The root 'build' target delegates to 'make -C core build' (command-line
	# variable assignments propagate to the sub-make).
	emake VERSION="${PV}" build

	# Generate shell completions from the freshly built binary.
	local dcal="${S}/core/bin/dcal"
	"${dcal}" completion bash > "${T}"/dcal.bash || die
	"${dcal}" completion zsh > "${T}"/dcal.zsh || die
	"${dcal}" completion fish > "${T}"/dcal.fish || die
}

src_install() {
	dobin "${S}"/core/bin/dcal

	# Quickshell QML UI -> /usr/share/quickshell/dankcal (upstream SHELL_NAME).
	mv "${S}"/quickshell "${S}"/dankcal || die
	insinto /usr/share/quickshell
	doins -r "${S}"/dankcal

	# Scalable app icon (desktop entry references Icon=dankcalendar).
	doicon -s scalable "${S}"/dankcal/assets/dankcalendar.svg

	domenu "${S}"/assets/com.danklinux.dankcalendar.desktop

	# Upstream unit already points at /usr/bin/dcal, which is where dobin lands it.
	systemd_douserunit "${S}"/assets/systemd/dcal.service

	newbashcomp "${T}"/dcal.bash dcal
	newzshcomp "${T}"/dcal.zsh _dcal
	newfishcomp "${T}"/dcal.fish dcal.fish
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update

	elog "Launch with 'dcal open' or the Dank Calendar desktop entry."
	elog "To autostart with your Wayland session:"
	elog "  systemctl --user enable --now dcal.service"

	optfeature_header "Optional programs for extra features:"
	optfeature "Secret Service backend for storing OAuth tokens" \
		gnome-base/gnome-keyring kde-frameworks/kwallet
	optfeature "Desktop notifications for reminders" \
		gui-apps/mako x11-misc/dunst
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
