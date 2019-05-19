# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Virtual for Linux kernel sources"
SLOT="0"
KEYWORDS="arm arm64"
IUSE="firmware"

RDEPEND="
	firmware? ( sys-kernel/armbian-firmware )
	|| (
		sys-kernel/odroidxu4-sources
		sys-kernel/rockchip64-sources
	)"
