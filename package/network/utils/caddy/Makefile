# Copyright (C) 2010-2021 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=caddy
PKG_VERSION:=1
PKG_RELEASE:=3

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  TITLE:=Caddy is an open source web server
  URL:=https://caddyserver.com
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  DEPENDS:=@(TARGET_sunxi_cortexa7||TARGET_brcm2708_bcm2710||TARGET_ramips||TARGET_x86_64)
endef

define Package/$(PKG_NAME)/description
Caddy is an extensible server platform that uses TLS by default.
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/caddy
	$(INSTALL_CONF) ./files/Caddyfile $(1)/etc/caddy/Caddyfile
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/caddy.init $(1)/etc/init.d/caddy
	$(INSTALL_DIR) $(1)/usr/bin/caddy
	$(INSTALL_DIR) $(1)/bin
ifdef CONFIG_TARGET_sunxi_cortexa7
	$(INSTALL_BIN) ./files/orangepi/caddy $(1)/usr/bin/caddy
	ln -s /usr/bin/caddy/caddy $(1)/bin/caddy
endif
ifdef TARGET_brcm2708_bcm2710
	$(INSTALL_BIN) ./files/rp3b/caddy $(1)/usr/bin/caddy
	ln -s /usr/bin/caddy/caddy $(1)/bin/caddy
endif
ifdef TARGET_ramips
	$(INSTALL_BIN) ./files/ramips/caddy $(1)/usr/bin/caddy
	ln -s /usr/bin/caddy/caddy $(1)/bin/caddy
endif
ifdef TARGET_x86_64
	$(INSTALL_BIN) ./files/x86_64/caddy $(1)/usr/bin/caddy
	ln -s /usr/bin/caddy/caddy $(1)/bin/caddy
endif
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
