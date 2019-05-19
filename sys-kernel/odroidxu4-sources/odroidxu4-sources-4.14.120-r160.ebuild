# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_HW="${PN%%-*}"
K_DEFCONFIG="${K_HW}_defconfig"
K_SECURITY_UNSUPPORTED=1

inherit kernel-2
detect_version
detect_arch

inherit git-r3

EGIT_REPO_URI="https://github.com/hardkernel/linux.git"
EGIT_BRANCH="${K_HW}-$(ver_cut 1-2).y"
MY_PR="${PR/r0/}"
EGIT_CHECKOUT_DIR="${WORKDIR}/linux-${PV}-${K_HW}${MY_PR:+-${PR}}"

DESCRIPTION="Hardkernel Odroid XU4 kernel sources"
HOMEPAGE="https://github.com/hardkernel/linux"

if [[ ${PV} != *"9999" ]] ; then
	EGIT_COMMIT="${PV}${MY_PR:+-${PR/r/}}"
	KEYWORDS="~arm"
fi

src_unpack() {
	git-r3_src_unpack
	unpack_set_extraversion
}
