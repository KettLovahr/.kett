-- The DevKitPro environment requires some specific
-- settings of its own for rust_analyzer to work
if vim.env.CONTAINER_ID == "dkp-arch" then

    print("Setting up rust_analyzer to recognize the DevKitPro environment")

    local settings = {
        ["rust-analyzer"] = {
            cargo = {
                target = "armv6k-nintendo-3ds"
            },
            check = {
                overrideCommand = { "cargo", "3ds", "check", "--message-format=json-diagnostic-rendered-ansi" },
            },
            server = {
                extraEnv = {
                    ["DEVKITPRO"] = "/opt/devkitpro",
                    ["DEVKITARM"] = "/opt/devkitpro/devkitARM",
                },
            }
        },
    }

    local config = require 'lspconfig'
    config.rust_analyzer.setup {
        settings = settings
    }


end
