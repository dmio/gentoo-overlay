# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python3_3 python3_4 python3_5 )

inherit distutils-r1 git-r3

DESCRIPTION="Evic is a USB programmer for devices based on the Joyetech Evic VTC Mini"
HOMEPAGE="https://github.com/Ban3/python-evic"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Ban3/python-evic.git"
EGIT_COMMIT="d94dbed"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/bitarray
		dev-python/binstruct
		dev-python/hidapi
		dev-python/click
		dev-python/pytest-runner"
RDEPEND="${DEPEND}"


