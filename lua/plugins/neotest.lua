return {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
        "Issafalcon/neotest-dotnet",
    },
    config = function(_, _)
        require("neotest").setup({
            adapters = {
                require("neotest-dotnet")
            }
        })
    end
}
