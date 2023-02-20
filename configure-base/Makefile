include $(TOPDIR)/rules.mk

PKG_NAME:=configure-base
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/configure-base
  SECTION:=configure
  CATEGORY:=Configure
  TITLE:=Configure Base
  PKGARCH:=all
  DEPENDS:=+luci-i18n-base-zh-cn +luci-i18n-firewall-zh-cn +luci-i18n-opkg-zh-cn
endef

define Package/configure-base/description
  Configure Base.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/configure-base/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./configure.sh $(1)/etc/uci-defaults/xxxxxx_80_configure-base.sh
endef

$(eval $(call BuildPackage,configure-base))
