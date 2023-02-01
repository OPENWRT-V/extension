include $(TOPDIR)/rules.mk

PKG_NAME:=preinstall-vlmcsd
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/preinstall-vlmcsd
  SECTION:=preinstall
  CATEGORY:=Preinstall
  TITLE:=Preinstall Vlmcsd
  PKGARCH:=all
  DEPENDS:=+bash
endef

define Package/preinstall-vlmcsd/description
  Preinstall Vlmcsd.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/preinstall-vlmcsd/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./preinstall.sh $(1)/etc/uci-defaults/preinstall-vlmcsd.sh

	$(INSTALL_DIR) $(1)/usr/preinstall/vlmcsd
	$(INSTALL_DATA) ./files/vlmcsd_svn1113-1_x86_64.ipk $(1)/usr/preinstall/vlmcsd/vlmcsd.ipk
	$(INSTALL_DATA) ./files/luci-app-vlmcsd_1.0.2-1_all.ipk $(1)/usr/preinstall/vlmcsd/luci-app-vlmcsd.ipk
endef

$(eval $(call BuildPackage,preinstall-vlmcsd))
