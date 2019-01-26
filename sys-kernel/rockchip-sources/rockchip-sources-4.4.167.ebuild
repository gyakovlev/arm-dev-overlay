# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_NOSETEXTRAVERSION=1
K_SECURITY_UNSUPPORTED=1

inherit kernel-2
detect_version
detect_arch

inherit git-r3

EGIT_REPO_URI="https://github.com/rockchip-linux/kernel.git"
EGIT_BRANCH="release-$(ver_cut 1-2)"
EGIT_CHECKOUT_DIR="${WORKDIR}/linux-${PV}-${PN%%-*}"

DESCRIPTION="Rockchip BSP kernel source"
HOMEPAGE="https://github.com/rockchip-linux/kernel"

if [[ ${PV} != *"9999" ]] ; then
	EGIT_COMMIT="5f783fd0a840588ca62b9f658d306277c7127229"
	KEYWORDS="arm64"
fi

src_unpack() {
	git-r3_src_unpack
	unpack_set_extraversion
}
