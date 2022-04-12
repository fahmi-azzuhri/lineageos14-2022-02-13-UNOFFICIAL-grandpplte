#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13645824 7d803cd963dee23e4656891379ea4dc8146d016b 10065920 47a843cd8ad8e9fd7a8e8e49a55ab4c4d3caa38b
fi
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:13645824:7d803cd963dee23e4656891379ea4dc8146d016b; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:10065920:47a843cd8ad8e9fd7a8e8e49a55ab4c4d3caa38b EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 7d803cd963dee23e4656891379ea4dc8146d016b 13645824 47a843cd8ad8e9fd7a8e8e49a55ab4c4d3caa38b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
