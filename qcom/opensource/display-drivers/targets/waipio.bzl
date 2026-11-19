load(":display_modules.bzl", "display_driver_modules")
load(":display_driver_build.bzl", "define_target_variant_modules")
load(":target_variants.bzl", "get_all_variants")

# waipio (SM8450, ingres): the 6.6 gki_waipiodisp.conf feature set.
# HFI code is built (non-HFI builds are broken upstream) but only runs when the
# DT selects HFI display operation; waipio uses the direct SDE path.
# No HW fence / spec sync (not on waipio), no SDE VM (no TUI VM on ingres).
def define_waipio():
    for (t, v) in get_all_variants():
        if t == "waipio":
            define_target_variant_modules(
                target = t,
                variant = v,
                registry = display_driver_modules,
                modules = [
                    "msm_drm",
                ],
                config_options = [
                    "CONFIG_DRM_MSM_SDE",
                    "CONFIG_SYNC_FILE",
                    "CONFIG_DRM_MSM_DSI",
                    "CONFIG_DRM_MSM_DP",
                    "CONFIG_DRM_MSM_DP_MST",
                    "CONFIG_MDSS_HFI_ADAPTER",
                    "CONFIG_MDSS_HFI",
                    "CONFIG_DSI_PARSER",
                    "CONFIG_DRM_SDE_WB",
                    "CONFIG_DRM_SDE_RSC",
                    "CONFIG_DRM_MSM_REGISTER_LOGGING",
                    "CONFIG_QCOM_MDSS_PLL",
                    "CONFIG_HDCP_QSEECOM",
                    "CONFIG_QCOM_FSA4480_I2C",
                    "CONFIG_THERMAL_OF",
                    "CONFIG_MSM_MMRM",
                    "CONFIG_MSM_EXT_DISPLAY",
                ],
            )
