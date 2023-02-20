include $(TOPDIR)/rules.mk

PKG_NAME:=extension-base
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/extension-base
  SECTION:=extension
  CATEGORY:=Extension
  TITLE:=Base
  PKGARCH:=all
  DEPENDS:=+bash +luci-i18n-base-zh-cn +luci-i18n-firewall-zh-cn +luci-i18n-opkg-zh-cn
endef

define Package/extension-base/description
  Extension Base.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/extension-base/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/script/uci-defaults.sh $(1)/etc/uci-defaults/zzzzzzzzzz_extension_100.sh

	$(INSTALL_DIR) $(1)/usr/extension/lib
	$(INSTALL_DATA) ./files/script/common.sh $(1)/usr/extension/lib/common.sh

	$(INSTALL_DIR) $(1)/usr/extension/base
	$(INSTALL_DATA) ./files/script/setup.sh $(1)/usr/extension/base/setup.sh
endef

$(eval $(call BuildPackage,extension-base))
