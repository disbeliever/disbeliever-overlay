# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils fdo-mime distutils

NEED_PYTHON=2.5

DESCRIPTION="A desktop wiki"
HOMEPAGE="http://zim-wiki.org/"
SRC_URI="http://zim-wiki.org/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graphviz latex screenshot spell test"

RDEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )
	dev-python/pygobject
	dev-python/pygtk
	>=x11-libs/gtk+-2.10
	x11-misc/xdg-utils
	graphviz? ( media-gfx/graphviz )
	latex? ( virtual/latex-base app-text/dvipng )
	screenshot? ( media-gfx/scrot )
	spell? ( dev-python/gtkspell-python )"

DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/${P}-disaple-updates.patch" )

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-disable-updates.patch"
}

src_install() {
	doicon data/zim.png
	distutils_src_install
}

pkg_postinst() {
	distutils_pkg_postinst
	fdo-mime_desktop_database_update
	xdg-icon-resource install --context mimetypes --size 64 \
		"${ROOT}/usr/share/pixmaps/zim.png" \
		application-x-zim-notebook || die "xdg-icon-resource install failed"
}

pkg_postrm() {
	distutils_pkg_postrm
	fdo-mime_desktop_database_update
	xdg-icon-resource uninstall --context mimetypes --size 64 \
		application-x-zim-notebook || die "xdg-icon-resource uninstall failed"
}