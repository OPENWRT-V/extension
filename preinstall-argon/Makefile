include $(TOPDIR)/rules.mk

PKG_NAME:=preinstall-argon
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/preinstall-argon
  SECTION:=preinstall
  CATEGORY:=Preinstall
  TITLE:=Preinstall Argon
  PKGARCH:=all
  DEPENDS:=+curl +jsonfilter \
+luci +luci-compat +luci-lib-ipkg +luci-i18n-base-zh-cn
endef

define Package/preinstall-argon/description
  Preinstall Argon.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/preinstall-argon/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./preinstall.sh $(1)/etc/uci-defaults/xxxxxx_01_preinstall-argon.sh

	$(INSTALL_DIR) $(1)/usr/preinstall/argon
	$(INSTALL_DATA) ./files/luci-theme-argon-master_2.2.9.4_all.ipk $(1)/usr/preinstall/argon/luci-theme-argon.ipk
	$(INSTALL_DATA) ./files/luci-app-argon-config_0.9-20210309_all.ipk $(1)/usr/preinstall/argon/luci-app-argon-config.ipk
endef

$(eval $(call BuildPackage,preinstall-argon))
