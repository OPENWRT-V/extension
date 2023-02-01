include $(TOPDIR)/rules.mk

PKG_NAME:=preinstall-clash
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/preinstall-clash
  SECTION:=preinstall
  CATEGORY:=Preinstall
  TITLE:=Preinstall Clash
  PKGARCH:=all
  DEPENDS:=+coreutils +coreutils-nohup +bash +unzip \
+dnsmasq-full +curl +ca-certificates +ipset +ip-full \
+libcap +libcap-bin \
+ruby +ruby-yaml \
+kmod-tun +kmod-inet-diag +kmod-nft-tproxy \
+luci +luci-compat
endef

define Package/preinstall-clash/description
  Preinstall Clash.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/preinstall-clash/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) ./preinstall.sh $(1)/etc/uci-defaults/preinstall-clash.sh
	$(INSTALL_DIR) $(1)/usr/preinstall/clash
	$(CP) ./files/luci-app-openclash_0.45.78-beta_all.ipk $(1)/usr/preinstall/clash/luci-app-openclash.ipk
	$(INSTALL_DIR) $(1)/etc/openclash/core
	$(CP) ./files/clash_dev_v1.12.0-8-ga5d5488 $(1)/etc/openclash/core/clash
	$(CP) ./files/clash_tun_2022.11.25-8-g25028e7 $(1)/etc/openclash/core/clash_tun
	$(CP) ./files/clash_meta_alpha-g7a64c432 $(1)/etc/openclash/core/clash_meta
endef

$(eval $(call BuildPackage,preinstall-clash))
