#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=darkice
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/darkice/
PKG_MD5SUM:=de541ea95a73a50f2f5e700434c22329

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/darkice
SECTION:=multimedia
CATEGORY:=Multimedia
SUBMENU:=Streaming
TITLE:=DarkIce is a live audio streamer
DEPENDS:=+lame-lib +librt +libpthread +libstdcpp +alsa-utils
MAINTAINER:=Artur Wronowski <arteqw@gmail.com>
endef

define Package/darkice/description
DarkIce is a live audio streamer. It records audio from an audio interface (e.g. sound card), encodes it and sends it to a streaming server.
endef

CONFIGURE_ARGS += \
		--with-lame \
		--without-aacplus \
		--with-alsa \
		--without-pulseaudio \
		--without-faac \
		--without-jack \
		--without-samplerate \
		--without-twolame \
		--without-vorbis \
		--with-lame-prefix="$(STAGING_DIR)/usr" \
		--with-alsa-prefix="$(STAGING_DIR)/usr" \

define Package/darkice/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/darkice $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/darkice.cfg $(1)/etc/
endef

define Package/darkice/conffiles
  /etc/darkice.cfg
endef

$(eval $(call BuildPackage,darkice))
