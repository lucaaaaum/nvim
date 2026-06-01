return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
        virt_texts = {
            priority = 9999
        },
        options = {
            add_messages = {
                display_count = true
            },
            multilines = {
                enabled = true
            },
            show_source = {
                enabled = true
            }
        }
    }
}
