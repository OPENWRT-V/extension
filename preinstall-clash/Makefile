include $(TOPDIR)/rules.mk

PKG_NAME:=extension-preinstall-clash
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/extension-preinstall-clash
  SECTION:=extension
  CATEGORY:=Extension
  TITLE:=Preinstall Clash
  PKGARCH:=all
  DEPENDS:=+coreutils +coreutils-nohup +bash +unzip \
+dnsmasq-full +curl +ca-certificates +ipset +ip-full \
+libcap +libcap-bin \
+ruby +ruby-yaml \
+kmod-tun +kmod-inet-diag +kmod-nft-tproxy \
+luci +luci-compat \
+extension-base
endef

define Package/extension-preinstall-clash/description
  Extension Preinstall Clash.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/extension-preinstall-clash/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/script/uci-defaults.sh $(1)/etc/uci-defaults/zzzzzzzzzz_extension_201.sh

	$(INSTALL_DIR) $(1)/usr/extension/preinstall-clash
	$(INSTALL_DATA) ./files/script/setup.sh $(1)/usr/extension/preinstall-clash/setup.sh
	$(INSTALL_DATA) ./files/ipk/luci-app-openclash_0.45.141-beta_all.ipk $(1)/usr/extension/preinstall-clash/luci-app-openclash.ipk
	
	$(INSTALL_DIR) $(1)/etc/openclash/core
	$(INSTALL_BIN) ./files/bin/clash_dev_v1.17.0-20-ga19a9fe $(1)/etc/openclash/core/clash
	$(INSTALL_BIN) ./files/bin/clash_tun_2023.08.17 $(1)/etc/openclash/core/clash_tun
	$(INSTALL_BIN) ./files/bin/clash_meta_alpha-g3a9fc39 $(1)/etc/openclash/core/clash_meta
endef

$(eval $(call BuildPackage,extension-preinstall-clash))
