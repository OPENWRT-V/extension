include $(TOPDIR)/rules.mk

PKG_NAME:=extension-preinstall-argon
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/extension-preinstall-argon
  SECTION:=extension
  CATEGORY:=Extension
  TITLE:=Preinstall Argon
  PKGARCH:=all
  DEPENDS:=+curl +jsonfilter \
+luci +luci-compat +luci-lib-ipkg
endef

define Package/extension-preinstall-argon/description
  Extension Preinstall Argon.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/extension-preinstall-argon/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/script/uci-defaults.sh $(1)/etc/uci-defaults/zzzzzzzzzz_extension_200.sh

	$(INSTALL_DIR) $(1)/usr/extension/preinstall-argon
	$(INSTALL_DATA) ./files/script/setup.sh $(1)/usr/extension/preinstall-argon/setup.sh
	$(INSTALL_DATA) ./files/ipk/luci-theme-argon-master_2.2.9.4_all.ipk $(1)/usr/extension/preinstall-argon/luci-theme-argon.ipk
	$(INSTALL_DATA) ./files/ipk/luci-app-argon-config_0.9-20210309_all.ipk $(1)/usr/extension/preinstall-argon/luci-app-argon-config.ipk
endef

$(eval $(call BuildPackage,extension-preinstall-argon))
