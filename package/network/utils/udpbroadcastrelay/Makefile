#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=udpbroadcastrelay
PKG_SOURCE_DATE:=2020-03-03
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/marjohn56/udpbroadcastrelay
PKG_SOURCE_VERSION:=2cfba2bc933e9c3ff6f6889808551face8960a58
PKG_HASH:=4f846148e0273039df0daad353c1c2b43a8583f361028d31d0a105fec66b9d80

include $(INCLUDE_DIR)/package.mk

define Package/udpbroadcastrelay
  SECTION:=net
  CATEGORY:=Network
  TITLE:=UDP Broadcast Relay for Linux / FreeBSD / pfSense / OPNsense
  URL:=https://github.com/marjohn56/udpbroadcastrelay
endef

define Package/udpbroadcastrelay/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/udpbroadcastrelay $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,udpbroadcastrelay))
