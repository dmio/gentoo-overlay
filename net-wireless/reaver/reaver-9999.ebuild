# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit subversion eutils

DESCRIPTION="Brute force attack against Wifi Protected Setup"
HOMEPAGE="http://code.google.com/p/reaver-wps"
#SRC_URI=""
ESVN_REPO_URI="http://reaver-wps.googlecode.com/svn/trunk/"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="net-libs/libpcap
		dev-db/sqlite"
RDEPEND="${DEPEND}"


src_configure(){
	S="$S"/src
	cd "$S"
	econf
}

src_install() {
	dobin wash reaver
	insinto "/etc/reaver"
	doins reaver.db
	doman ../docs/reaver.1.gz
	dodoc ../docs/README ../docs/README.REAVER ../docs/README.WASH
}
