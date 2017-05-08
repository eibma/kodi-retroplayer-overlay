# Copyright 2016 Markus 'eibma' Eibel
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/kodi-game/game.libretro.nestopia.git"
EGIT_BRANCH="master"

inherit git-r3 cmake-utils kodi-addon

DESCRIPTION="Kodi nestopia NES emulator addon addon"
HOMEPAGE="https://kodi.tv"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_configure() {
	local mycmakeargs=(
		"-Dlibretro-nestopia_DIR=${WORKDIR}"
		"-DCMAKE_INSTALL_LIBDIR=/usr/share/kodi"
	)
	echo "set(NESTOPIA_LIB /usr/lib64/libretro/nestopia_libretro.so)" > "${WORKDIR}/libretro-nestopiaConfig.cmake"

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
	games-emulation/nestopia-libretro
	"

