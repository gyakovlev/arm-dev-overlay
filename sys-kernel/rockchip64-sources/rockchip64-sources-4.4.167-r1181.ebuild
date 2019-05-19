# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_DEFCONFIG="rockchip_linux_defconfig"
K_SECURITY_UNSUPPORTED=1

inherit kernel-2
detect_version
detect_arch

inherit git-r3

EGIT_REPO_URI="https://github.com/ayufan-rock64/linux-kernel.git"
EGIT_BRANCH="release-$(ver_cut 1-2)"
MY_PR="${PR/r0/}"
EGIT_CHECKOUT_DIR="${WORKDIR}/linux-${PV}-${PN%%-*}${MY_PR:+-${PR}}"

DESCRIPTION="Ayufan's fork of Rockchip BSP kernel source"
HOMEPAGE="https://github.com/ayufan-rock64/linux-kernel"

if [[ ${PV} != *"9999" ]] ; then
	EGIT_COMMIT="${PV}-${PR/r/}-rockchip-ayufan"
	KEYWORDS="~arm64"
fi

src_unpack() {
	git-r3_src_unpack
	unpack_set_extraversion
}
