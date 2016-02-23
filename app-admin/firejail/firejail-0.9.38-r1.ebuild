# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base

DESCRIPTION="Firejail is a SUID security sandbox program that reduces the risk of security breaches by restricting the running environment of untrusted applications using Linux namespaces and seccomp-bpf."
HOMEPAGE="https://firejail.wordpress.com"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+seccomp +bash-completion +man +doc"

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
