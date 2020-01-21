# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="a performance-oriented fork of zlib"
HOMEPAGE="https://github.com/Dead2/zlib-ng/tree/develop"
EGIT_REPO_URI="https://github.com/Dead2/zlib-ng.git"
if [[ ${PV} == 9999* ]]; then
	SRC_URI=""
	KEYWORDS=""
	GIT_ECLASS="git-r3"
	EXPERIMENTAL="true"
fi

inherit cmake-utils ${GIT_ECLASS}

LICENSE="ZLIB"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#src_unpack() {
#	default
#	[[ $PV = 9999* ]] && git-r3_src_unpack
#}

