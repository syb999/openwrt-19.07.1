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
  DEPENDS:=@(TARGET_sunxi_cortexa7||TARGET_brcm2708_bcm2710||TARGET_armvirt||TARGET_ar71xx||TARGET_ramips||TARGET_x86_64)
endef

define Package/$(PKG_NAME)/description
Caddy is an extensible server platform that uses TLS by default.
endef

ifeq ($(ARCH),x86_64)
	caddy_ARCH:=x86_64
	PKG_HASH:=c5c78bdf05ca468ee0fd0dfc49df676a697063fc16d5506eb3f73720dcacb07c
endif

ifeq ($(ARCH),mipsel)
	caddy_ARCH:=ramips
	PKG_HASH:=88c1dcf2b810ace9a34a60b2cc789bcbaaf05d12a25572f753ba9468505d34c1
endif

ifeq ($(ARCH),mips)
	caddy_ARCH:=ar71xx
	PKG_HASH:=67efb2b3a4131b7876885f94951cb930540ea057741647cac4df199050e224e5
endif

ifeq ($(ARCH),arm)
	caddy_ARCH:=orangepi
	PKG_HASH:=ef1bfed65baf95fdc4726d173618cb1393cc9aea53e7549eef8d1bf18fbc4735
endif

ifeq ($(ARCH),aarch64)
	caddy_ARCH:=rp3b
	PKG_HASH:=d8a92b1099ac280cb21cfad221c1e46dc5be1eb19f633f7a6f3df41193ed72ec
endif

PKG_SOURCE_URL:=https://raw.githubusercontent.com/syb999/1907-upx/master/caddy/$(caddy_ARCH)
PKG_SOURCE:=caddy

define Build/Prepare
	mv $(DL_DIR)/$(PKG_SOURCE) $(PKG_BUILD_DIR)
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
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/caddy $(1)/usr/bin/caddy
	ln -s /usr/bin/caddy/caddy $(1)/bin/caddy
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
