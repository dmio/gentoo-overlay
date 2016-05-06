# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1

DESCRIPTION="The binstruct library allows you to access binary data using a predefined structure."
HOMEPAGE="https://pypi.python.org/pypi/binstruct"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
