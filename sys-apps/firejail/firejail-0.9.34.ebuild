# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5


DESCRIPTION="Firejail is a SUID security sandbox program that reduces the risk of security breaches by restricting the running environment of untrusted applications using Linux namespaces and seccomp-bpf."
HOMEPAGE="https://firejail.wordpress.com"
if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/netblue30/firejail.git"
	SRC_URI=""
	KEYWORDS=""
	GIT_ECLASS="git-r3"
	EXPERIMENTAL="true"
else
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
	KEYWORDS="x86 amd64"
fi

inherit base ${GIT_ECLASS}

LICENSE="GPL-2"
SLOT="0"
IUSE="+seccomp bash-completion man doc"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable seccomp)
}

src_install() {
	einstall
	if ! use bash-completion ; then
		rm -r ${D}/usr/share/bash-completion
	fi
	if ! use man ; then
		rm -r ${D}/usr/share/man
	fi
	if ! use doc ; then
		rm -r ${D}/usr/share/doc
	fi
	rm -df ${D}/usr/share &>/dev/null
}
