#
# Copyright (C) 2015 OpenWrt.org
# Copyright (C) 2015 Cesnet, z.s.p.o.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-gui
PKG_VERSION:=2.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/syb999/asterisk-gui2.0.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=ef69f635332adbad32affdb60784cad33ac8d4cb
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_HASH:=342c6ba50b8b8aa38d59f02264ef53ea9561415d15ae3d8f6b71cc869eeda445

include $(INCLUDE_DIR)/package.mk

define Package/asterisk-gui
	SUBMENU:=Telephony
	CATEGORY:=Network
	TITLE:=Asterisk GUI for Asterisk x.x
	VERSION:=$(PKG_VERSION)
	DEPENDS:=+asterisk18 +asterisk18-app-exec +asterisk18-app-system \
	+asterisk18-chan-local +asterisk18-res-crypto +asterisk18-res-musiconhold
endef

define Package/asterisk-gui/description
	Asterisk-x.x GUI is a framework for the creation of graphical interfaces
	for configuring Asterisk-x.x package.
endef

EXTRA_CFLAGS:=$(TARGET_CPPFLAGS)
EXTRA_LDFLAGS:=$(TARGET_LDFLAGS)

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)/
	mkdir -p $(PKG_BUILD_DIR)/
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR) --strip 1
	$(Build/Patch)
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./bootstrap.sh )
	$(call Build/Configure/Default, \
	--build=$(GNU_HOST_NAME) \
	--host=$(GNU_TARGET_NAME) \
	--target=$(GNU_TARGET_NAME) \
	--prefix=/usr \
	--disable-nls \
	--disable-static \
	--localstatedir="/usr" \
	--sysconfdir="/etc" \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)"
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" install
endef

define Package/asterisk-gui/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/static-http
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/static-http/* $(1)/usr/lib/asterisk/static-http
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/scripts
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/asterisk/scripts/* $(1)/usr/lib/asterisk/scripts
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/gui_backups
endef

$(eval $(call BuildPackage,asterisk-gui))
