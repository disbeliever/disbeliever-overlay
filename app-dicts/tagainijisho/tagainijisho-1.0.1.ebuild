EAPI=2

inherit cmake-utils

DESCRIPTION="Tagaini Jisho is a free, open-source Japanese dictionary and kanji lookup tool"
HOMEPAGE="http://www.tagaini.net/"
SRC_URI="https://github.com/Gnurou/tagainijisho/releases/download/${PV}/${P}.tar.gz"
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-util/cmake-2.8.1
>=dev-qt/qtgui-4.5:4"
RDEPEND="${DEPEND}"
