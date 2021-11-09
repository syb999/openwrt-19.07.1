# Copyright (C) 2010-2021 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node8
PKG_VERSION:=1
PKG_RELEASE:=

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Node.js-v8
  TITLE:=Node.js is a platform built on Chrome's JavaScript runtime
  URL:=https://nodejs.org/
  DEPENDS:=@(HAS_FPU||KERNEL_MIPS_FPU_EMULATOR)
endef

define Package/$(PKG_NAME)/description
node8 for ramips and ar71xx
endef

ifeq ($(ARCH),mipsel)
	node_ARCH:=ramips
	PKG_HASH:=332d7a2ad5bdab16fb478ad3018862691a85242a520b6fcd5c41c520d56c83e9
endif

ifeq ($(ARCH),mips)
	node_ARCH:=ar71xx
	PKG_HASH:=c3f121bad1943f36512e658851c88694b05808326ea8697473622bf95210deec
endif

PKG_SOURCE_URL:=https://raw.githubusercontent.com/syb999/1907-upx/master/node/$(node_ARCH)
PKG_SOURCE:=node

define Build/Prepare
	mv $(DL_DIR)/$(PKG_SOURCE) $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/node $(1)/usr/bin/node
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
