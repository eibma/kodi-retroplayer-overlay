# Copyright 2016 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/kodi-game/game.libretro.pcsx-rearmed.git"
EGIT_BRANCH="master"

inherit git-r3 cmake-utils kodi-addon

DESCRIPTION="Kodi's Joystick peripheral addon"
HOMEPAGE="https://kodi.tv"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_configure() {
       local mycmakeargs=(
		"-Dlibretro-pcsx-rearmed_DIR=${WORKDIR}"
		"-DCMAKE_INSTALL_LIBDIR=/usr/lib64/kodi"
       )
	echo "set(PCSX_REARMED_LIB /usr/games/lib64/libretro/pcsx_rearmed_libretro.so)" > "${WORKDIR}/libretro-pcsx-rearmedConfig.cmake"

	CMAKE_USE_DIR="${S}"
	cmake-utils_src_configure
}

src_compile() {
        cmake-utils_src_compile
}



DEPEND="
	media-tv/kodi
	media-libs/kodi-game-libretro
	media-libs/kodiplatform
	dev-libs/libp8-platform
	dev-libs/libpcre
	games-emulation/pcsx-rearmed-libretro
	"

