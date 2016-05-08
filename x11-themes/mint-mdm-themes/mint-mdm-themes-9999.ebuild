# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit git-r3
DESCRIPTION="Mint Mate Display Manager Themes"
HOMEPAGE="http://mate-desktop.org"
LICENSE="GPL-2 LGPL-2"
SLOT=0
EGIT_REPO_URI="https://github.com/linuxmint/mint-mdm-themes.git"
KEYWORDS="amd64 x86"
IUSE=""

pkg_postinst() {
           einfo "For select mdm themes you need open control-center "
           einfo "in mate DE or Cinnamon DE,select login screen and"
           einfo "select your favorite theme for mdm"
           einfo "Thanks open-overlay 2015 by Alex" 
}

src_install() {
          insinto /usr/share/mdm/themes
          doins -r *
          dodoc README.md 
}
