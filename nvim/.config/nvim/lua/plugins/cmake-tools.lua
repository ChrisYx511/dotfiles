return {
    "Civitasv/cmake-tools.nvim",
    cond = function() return not vim.g.vscode end,
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
        "CMakeGenerate",
        "CMakeBuild",
        "CMakeRun",
        "CMakeDebug",
        "CMakeSelectBuildType",
        "CMakeSelectBuildTarget",
        "CMakeSelectLaunchTarget",
        "CMakeSelectKit",
        "CMakeSelectConfigurePreset",
        "CMakeSelectBuildPreset",
        "CMakeOpen",
        "CMakeClose",
        "CMakeInstall",
        "CMakeClean",
        "CMakeStop",
        "CMakeQuickStart",
    },
    init = function()
        -- Only load when CMakeLists.txt is detected
        local loaded = false
        vim.api.nvim_create_autocmd("BufReadPre", {
            pattern = "CMakeLists.txt",
            once = true,
            callback = function()
                if not loaded then
                    loaded = true
                    require("lazy").load({ plugins = { "cmake-tools.nvim" } })
                end
            end,
        })
    end,
    opts = {},
}
