# Copyright 2016 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/kodi-game/game.libretro.bsnes-mercury-balanced.git"
EGIT_BRANCH="master"

inherit git-r3 cmake-utils kodi-addon

DESCRIPTION="bsnes-mercury SNES emulator with balanced profile"
HOMEPAGE="https://kodi.tv"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_configure() {
       local mycmakeargs=(
		"-Dlibretro-bsnes-mercury-balanced_DIR=${WORKDIR}"
		"-DCMAKE_INSTALL_LIBDIR=/usr/lib64/kodi"
       )
        echo "set(BSNES-MERCURY-BALANCED_LIB /usr/games/lib64/libretro/bsnes_balanced_libretro.so)" > "${WORKDIR}/libretro-bsnes-mercury-balancedConfig.cmake"

	CMAKE_USE_DIR="${S}"
	cmake-utils_src_configure
}

src_compile() {
        cmake-utils_src_compile
}

DEPEND="
        media-tv/kodi
        media-libs/kodi-platform
        media-plugins/kodi-game-libretro
        media-plugins/kodi-peripheral-joystick
        dev-libs/libplatform
        dev-libs/libpcre
	games-emulation/bsnes-libretro
	"

