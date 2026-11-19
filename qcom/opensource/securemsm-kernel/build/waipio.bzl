load(":securemsm_kernel.bzl", "define_consolidate_gki_modules")

def define_waipio():
    # ingres: the securemsm modules ingres loads on 6.6 (no test drivers, no smmu-proxy)
    define_consolidate_gki_modules(
        target = "waipio",
        modules = [
            "smcinvoke_dlkm",
            "tz_log_dlkm",
            "qseecom_dlkm",
            "hdcp_qseecom_dlkm",
            "qce50_dlkm",
            "qcedev-mod_dlkm",
            "qrng_dlkm",
            "qcrypto-msm_dlkm",
            "tmecom-intf_dlkm",
         ],
         # as 6.6 waipio and 6.12 monaco: compat smcinvoke + qseecom, no SI-core (older TZ)
         extra_options = [
             "CONFIG_QCOM_SMCINVOKE",
             "CONFIG_QSEECOM",
         ],
     )

