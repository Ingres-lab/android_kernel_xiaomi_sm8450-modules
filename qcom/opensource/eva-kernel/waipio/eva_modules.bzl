load(":eva_module_build.bzl", "create_module_registry")

EVA_KERNEL_ROOT = "eva-kernel"

eva_modules = create_module_registry([":eva_drivers_headers"])
register_eva_module = eva_modules.register

register_eva_module(
    name = "msm-eva",
    path = "msm",
    srcs = [
        "eva/cvp.c",
        "eva/cvp_core_hfi.c",
        "eva/cvp_dump.c",
        "eva/cvp_fw_load.c",
        "eva/cvp_hfi.c",
        "eva/hfi_packetization.c",
        "eva/hfi_response_handler.c",
        "eva/msm_cvp.c",
        "eva/msm_cvp_buf.c",
        "eva/msm_cvp_clocks.c",
        "eva/msm_cvp_common.c",
        "eva/msm_cvp_core.c",
        "eva/msm_cvp_debug.c",
        "eva/msm_cvp_dsp.c",
        "eva/msm_cvp_ioctl.c",
        "eva/msm_cvp_platform.c",
        "eva/msm_cvp_res_parse.c",
        "eva/msm_cvp_synx.c",
        "eva/msm_smem.c",
    ],
    config_deps = {
        "TARGET_SYNX_ENABLE": [
            "//vendor/xiaomi/sm8450-modules/qcom/opensource/synx-kernel/waipio:synx_headers",
            "//vendor/xiaomi/sm8450-modules/qcom/opensource/synx-kernel/waipio:%b_synx-driver",
        ],
        "TARGET_MMRM_ENABLE": [
            "//vendor/xiaomi/sm8450-modules/qcom/opensource/mmrm-driver:%b_mmrm_driver",
            "//vendor/xiaomi/sm8450-modules/qcom/opensource/mmrm-driver:mmrm_driver_headers",
        ],
        "TARGET_DSP_ENABLE": [
            "//vendor/xiaomi/sm8450-modules/qcom/opensource/dsp-kernel/waipio:fastrpc_headers",
            "//vendor/xiaomi/sm8450-modules/qcom/opensource/dsp-kernel/waipio:%b_frpc-adsprpc",
        ],
    },
)
