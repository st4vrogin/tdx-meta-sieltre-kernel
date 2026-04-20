# 1. Dichiara dove si trovano i tuoi file aggiuntivi (come il .cfg)
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# 2. Rimuovi la feature che fallisce (che è definita nel layer torizon)
KERNEL_FEATURES:remove = "bsp/${MACHINE}-${LINUX_KERNEL_TYPE}-torizon.scc"

# 3. Aggiungi il tuo frammento di configurazione minimale
#SRC_URI:append = " file://torizon-minimal.cfg"
