include $(TOPDIR)/rules.mk

PKG_NAME:=arping
PKG_VERSION:=2.22
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ThomasHabets/arping
PKG_REV:=9647d8ed7b9f9f3c5fb7dd12ddbadf7c7623e6c1
PKG_HASH:=35f92659e97f610016a28ed69f9711ee0e097c1572e609367da4c2f8cc4a3a74
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/arping
  SECTION:=net
  CATEGORY:=Network
  TITLE:=arping By Thomas Habets
  DEPENDS+= +libnet-1.2.x +libpcap +libcap
endef

define Package/arping/description
Arping is a util to find out if a specific IP address on the LAN is 'taken'
and what MAC address owns it.
endef

TARGET_CFLAGS += -D_GNU_SOURCE

ifdef CONFIG_USE_UCLIBC
  TARGET_CFLAGS += -std=gnu99
endif

define Package/arping/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/arping $(1)/usr/bin/
endef

$(eval $(call BuildPackage,arping))
