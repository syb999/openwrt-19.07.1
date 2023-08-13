include $(TOPDIR)/rules.mk

PKG_NAME:=pyenv-deps
PKG_VERSION:=1

include $(INCLUDE_DIR)/package.mk

define Package/pyenv-deps
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:= \
	+git +gcc +zlib-dev +openssl-dev +libffi-dev \
	+liblzma-dev +libreadline-dev +libsqlite3-dev \
	+libbz2-dev +libjpeg-dev +libtiff-dev
  TITLE:=Pyenv environment dependency
endef

define Build/Compile
endef

define Package/pyenv-deps/install
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_BIN) ./files/3.9/pycore_byteswap.h $(1)/usr/include
	$(INSTALL_DIR) $(1)/root/pip_temp
	$(INSTALL_BIN) ./files/pyenv-profile $(1)/root/.profile
endef

$(eval $(call BuildPackage,pyenv-deps))
