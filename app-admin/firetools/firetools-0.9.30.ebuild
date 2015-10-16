# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils autotools

DESCRIPTION="Firetools is the graphical user interface for Firejail security sandbox."
HOMEPAGE="https://l3net.wordpress.com/projects/firejail/#firetools"
SRC_URI="mirror://sourceforge/firejail/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="qt4 +qt5"

DEPEND="qt4? ( dev-qt/qtcore:4
			   dev-qt/qtgui:4
			 )
		qt5? ( dev-qt/qtcore:5
			   dev-qt/qtgui:5
			   dev-qt/qtsvg:5
			 )
		app-admin/firejail"
RDEPEND="${DEPEND}"

REQUIRED_USE="
		qt4? ( !qt5 )
		qt5? ( !qt4 )"

src_prepare() {
	epatch ${FILESDIR}/firetools-0.9.30-configure.ac.patch
}

src_configure() {
	eautoreconf
	econf\
		$(use_with qt4)\
		$(use_with qt5)
}
