# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="The webcam-tools package "
HOMEPAGE="http://sourceforge.net/projects/libwebcam/"
SRC_URI="mirror://sourceforge/${PN}/source/${PN}-src-${PV}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="man doc"

DEPEND="dev-libs/libxml2"
RDEPEND="${DEPEND}"

