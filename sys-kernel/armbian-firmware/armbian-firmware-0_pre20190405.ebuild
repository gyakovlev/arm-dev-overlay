# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Armbian specific firmware"
HOMEPAGE="https://github.com/armbian/firmware"

if [ ${PV} == "9999" ] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN/-//}.git"
else
	EGIT_COMMIT="fe584970a1f8e718540a3cec4838e7a4cad5f263"
	SRC_URI="https://github.com/armbian/firmware/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm ~arm64"
	S="${WORKDIR}/firmware-${EGIT_COMMIT}"
fi

LICENSE="GPL-2 GPL-2+ GPL-3 BSD MIT || ( MPL-1.1 GPL-2 ) BSD-2 BSD BSD-4 ISC MIT no-source-code all-rights-reserved"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="!sys-kernel/linux-firmware"
BDEPEND=""

RESTRICT="binchecks bindist mirror strip"

src_install() {
	insinto /lib/firmware
	doins -r .
}
