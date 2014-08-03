# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games

DESCRIPTION="INSTEAD quest engine"
HOMEPAGE="http://instead.syscall.ru/"
SRC_URI="mirror://sourceforge/instead/instead_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=dev-lang/lua-5.1*
   media-libs/libsdl
   media-libs/sdl-mixer
   media-libs/sdl-image
   media-libs/sdl-ttf"
RDEPEND="${DEPEND}"

src_prepare() {
   epatch "${FILESDIR}"/zlib.patch

   cd "${S}" || die "Directory ${S} doesn't exist"
   cp Rules.make.system Rules.make || die "Cannot copy Rules.make.system"
   sed 's/lua5.1/lua/;'  -i Rules.make || die "Cannot patch Rules.make"
   sed 's:PREFIX=.*:PREFIX=/usr:' -i Rules.make || die "Cannot patch Rules.make"
   sed 's:BIN=.*:BIN=$(DESTDIR)'"${GAMES_BINDIR}:" -i Rules.make || die "Cannot patch Rules.make"
   sed 's:STEADPATH=$(DESTDIR)$(PREFIX)/share:STEADPATH=$(DESTDIR)'"${GAMES_DATADIR}:" -i Rules.make || die "Cannot patch Rules.make"
   sed 's:DOCPATH=$(DESTDIR)$(PREFIX)/share:DOCPATH=$(DESTDIR)'"${GAMES_DATADIR}:" -i Rules.make || die "Cannot patch Rules.make"
   sed 's/ \*\.pdf//;'  -i doc/Makefile || die "Cannot patch doc/Makefile"
}

src_install() {
   emake DESTDIR="${D}"  install || die "emake install failed"
   prepgamesdirs
}
