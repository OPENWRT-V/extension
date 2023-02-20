include $(TOPDIR)/rules.mk

PKG_NAME:=extension-preinstall-vlmcsd
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/extension-preinstall-vlmcsd
  SECTION:=extension
  CATEGORY:=Extension
  TITLE:=Preinstall Vlmcsd
  PKGARCH:=all
  DEPENDS:=+extension-base
endef

define Package/extension-preinstall-vlmcsd/description
  Extension Preinstall Vlmcsd.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/extension-preinstall-vlmcsd/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/script/uci-defaults.sh $(1)/etc/uci-defaults/zzzzzzzzzz_extension_202.sh

	$(INSTALL_DIR) $(1)/usr/extension/preinstall-vlmcsd
	$(INSTALL_DATA) ./files/script/setup.sh $(1)/usr/extension/preinstall-vlmcsd/setup.sh
	$(INSTALL_DATA) ./files/ipk/vlmcsd_svn1113-1_x86_64.ipk $(1)/usr/extension/preinstall-vlmcsd/vlmcsd.ipk
	$(INSTALL_DATA) ./files/ipk/luci-app-vlmcsd_1.0.2-1_all.ipk $(1)/usr/extension/preinstall-vlmcsd/luci-app-vlmcsd.ipk
endef

$(eval $(call BuildPackage,extension-preinstall-vlmcsd))
