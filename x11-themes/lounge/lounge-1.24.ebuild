# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Vintage looking gtk theme."
HOMEPAGE="https://github.com/monday15/lounge"
SRC_URI="https://github.com/monday15/lounge/archive/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/lounge-gtk-theme-${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND=""
DEPEND="${RDEPEND}
		dev-lang/sassc
		>=x11-libs/gtk+-3.22.0
		x11-themes/gtk-engines-murrine"
