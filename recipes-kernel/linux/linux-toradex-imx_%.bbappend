LINUX_VERSION = "6.12"
LINUX_VERSION_EXTENSION = "-sieltre"

KBRANCH = "toradex_6.12-2.0.x-imx"
SRC_URI = "git://git.toradex.com/linux-toradex.git;protocol=https;branch=${KBRANCH}"

SRCREV = "${AUTOREV}"

# 1. Dichiara dove si trovano i tuoi file aggiuntivi (come il .cfg)
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
KBUILD_DEFCONFIG = "defconfig"
CUSTOM_DEVICETREE = "sieltre-vhf-box-1dac.dts"

# 2. Rimuovi la feature che fallisce (che è definita nel layer torizon)
KERNEL_FEATURES:remove = "bsp/${MACHINE}-${LINUX_KERNEL_TYPE}-torizon.scc"

SRC_URI += "\
        file://${CUSTOM_DEVICETREE} \
        file://sieltre-audio.cfg \
        file://walnascar-devs.cfg \
        "

do_configure:append() {
        ### For arm32 bit devices
        ### cp ${WORKDIR}/${CUSTOM_DEVICETREE} ${S}/arch/arm/boot/dts
        # For arm64 bit freescale/NXP devices
        cp ${WORKDIR}/${CUSTOM_DEVICETREE} ${S}/arch/arm64/boot/dts/freescale
}

