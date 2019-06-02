# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_DEFCONFIG="rockchip_linux_defconfig"
K_SECURITY_UNSUPPORTED=1

inherit kernel-2 unpacker
detect_version
detect_arch

BASE_URI="https://github.com/ayufan-rock64/linux-mainline-kernel"
MY_PR="${PR/r0/}"
MY_PV="${PV}-${MY_PR/r/}"
MY_SRCDIR="linux-${PV}-${PN%%-*}${MY_PR:+-${PR}}"

DESCRIPTION="Mainline kernel plus Ayufan's patches"
HOMEPAGE="https://github.com/ayufan-rock64/linux-mainline-kernel"
SRC_URI="${BASE_URI}/archive/${MY_PV}-ayufan.tar.gz -> ${PF}.tar.gz"
KEYWORDS="arm64"

S="${WORKDIR}/${MY_SRCDIR}"

src_unpack() {
	pushd "${WORKDIR}" >/dev/null || die
	default
	mv linux-mainline-kernel-"${MY_PV}"-ayufan "${MY_SRCDIR}"
	popd >/dev/null || die
	unpack_set_extraversion
}
