# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/Lrs121/bully.git"
	SRC_URI=""
	KEYWORDS=""
	GIT_ECLASS="git-r3"
	EXPERIMENTAL="true"
else
	SRC_URI="https://github.com/dmio/bully/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm ~x86 ~amd64"
	MY_PV=$(replace_version_separator 2 '-' )
	S="${WORKDIR}/${PN}-${MY_PV}"
fi

inherit versionator ${GIT_ECLASS}


DESCRIPTION="A wifi-protected-setup (WPS) brute force attack tool, similar to reaver"
HOMEPAGE="https://github.com/bdpurcell/bully"
SLOT="0"
LICENSE="GPL-3+ GPL-2 BSD"

DEPEND=">=dev-libs/openssl-1
	net-libs/libpcap"


src_compile() {
	cd "${S}/src"
	emake || die "emake failed"
}

src_install() {
	cd "${S}/src"
	emake DESTDIR="${D}" prefix=/usr install || die "emake failed"
	dodoc "${S}/README.md"
}
