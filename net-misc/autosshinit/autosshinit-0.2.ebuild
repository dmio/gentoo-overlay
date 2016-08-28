# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Gentoo init script for autossh"
HOMEPAGE="https://github.com/dmio/autosshinit"
SRC_URI=""
EGIT_REPO_URI="https://github.com/dmio/autosshinit.git"
EGIT_COMMIT="b8a32f2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install () {
	doinitd	init.d/autossh
	dodoc conf.d/autossh.sample
}

pkg_postinst () {
	elog "The autossh init script expects to find the configuration file /etc/conf.d/autossh"
	elog ""
	elog "To run more instances, simply create a new autossh.foo file for it and"
	elog "then create a symlink to the autossh init script from a link called"
	elog "autossh.foo - like so"
	elog "   cd /etc/conf.d"
	elog "   ${EDITOR##*/} /etc/conf.d/autossh.foo"
	elog "   cd /etc/init.d"
	elog "   ln -s autossh autossh.foo"
	elog ""
	elog "You can then treat autossh.foo as any other service, so you can"
	elog "stop one autossh and start another if you need to."

}
