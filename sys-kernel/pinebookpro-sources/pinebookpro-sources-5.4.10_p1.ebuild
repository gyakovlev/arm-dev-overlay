# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_DEFCONFIG="pinebook_pro_defconfig"
K_SECURITY_UNSUPPORTED=1

inherit kernel-2
detect_version
detect_arch

MY_PV="${PV/_p/.}"
MY_SRCDIR="linux-${PV}-pinebookpro"

DESCRIPTION="LTS pinebookpro kernel plus Ayufan and Manjaro patches"
HOMEPAGE="https://github.com/gyakovlev/linux-pinebook-pro"
SRC_URI="https://github.com/gyakovlev/linux-pinebook-pro/archive/${MY_PV}.tar.gz -> ${PF}.tar.gz"
KEYWORDS="-* arm64"

S="${WORKDIR}/${MY_SRCDIR}"

src_unpack() {
	pushd "${WORKDIR}" >/dev/null || die
	default
	mv linux-pinebook-pro-"${MY_PV}" "${MY_SRCDIR}"
	popd >/dev/null || die
	unpack_set_extraversion
}
