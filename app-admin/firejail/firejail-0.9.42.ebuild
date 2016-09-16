# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils versionator

DESCRIPTION="Firejail is a SUID security sandbox program that reduces the risk of security breaches by restricting the running environment of untrusted applications using Linux namespaces and seccomp-bpf."
HOMEPAGE="https://firejail.wordpress.com"
if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/netblue30/firejail.git"
	SRC_URI=""
	KEYWORDS=""
	GIT_ECLASS="git-r3"
	EXPERIMENTAL="true"
else
	MY_PV=$(replace_version_separator 3 '~')
	MY_P="${PN}-${MY_PV}"
	S="${WORKDIR}/${PN}-${MY_PV}"
	SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.xz"
	KEYWORDS="~x86 ~amd64"
fi

inherit ${GIT_ECLASS}

LICENSE="GPL-2"
SLOT="0"
IUSE="+bash-completion +man +doc apparmor +bind busybox-workaround +chroot +file-transfer +globalcfg +network network-restricted +overlayfs +private-home +seccomp +userns +whitelist X"

DEPEND=""
RDEPEND="X? ( x11-wm/xpra[client,server] )
		${DEPEND}"

src_configure() {
	local myargs=(
		$(use_enable apparmor)
		$(use_enable bind)
		$(use_enable busybox-workaround)
		$(use_enable chroot)
		$(use_enable file-transfer)
		$(use_enable globalcfg)
		$(use_enable network)
		$(use_enable overlayfs)
		$(use_enable private-home)
		$(use_enable seccomp)
		$(use_enable userns)
		$(use_enable whitelist)
		$(use x11 && echo --enable-x11)
		$(use network-restricted && echo --enable-network=restricted)
		)
	econf "${myargs[@]}"
}

src_install() {
	emake DESTDIR="${D}" install
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
