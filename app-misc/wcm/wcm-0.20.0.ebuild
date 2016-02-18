# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils cmake-utils

DESCRIPTION="Multi-platform open source file manager for Windows, Linux, FreeBSD and OS X"
HOMEPAGE="http://wcm.linderdaum.com/"
SRC_URI="https://github.com/corporateshark/WCMCommander/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="samba ssh truetype"

DEPEND="x11-libs/libX11
		x11-libs/libXext
		>=dev-util/cmake-2.8.0
		samba? ( net-fs/samba )
		ssh? ( net-libs/libssh2 )
		truetype? ( media-libs/freetype )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/WCMCommander-release-${PV}"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with samba SMBCLIENT)
		$(cmake-utils_use_with ssh LIBSSH2)
		$(cmake-utils_use_with truetype FREETYPE)
	)
	cmake-utils_src_configure
}

