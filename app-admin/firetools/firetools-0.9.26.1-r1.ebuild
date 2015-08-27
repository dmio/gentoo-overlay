# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Firetools is the graphical user interface for Firejail security sandbox."
HOMEPAGE="https://l3net.wordpress.com/projects/firejail/#firetools"
SRC_URI="mirror://sourceforge/firejail/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-admin/firejail
		dev-qt/qtcore:4
		dev-qt/qtgui:4"
RDEPEND="${DEPEND}"
