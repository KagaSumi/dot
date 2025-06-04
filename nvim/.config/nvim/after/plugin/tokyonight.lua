require('tokyonight').setup({
    transparent = true, -- Use transparency settings in the theme
    style = "night",
    on_colors = function(colors)
        colors.comment = "#4a86cf"
    end
})

-- Define a function to apply the color scheme with additional transparency tweaks
function ColorMyPencils(color) 
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- Make background elements transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- Optional transparency for sign column
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- Optional: hides ~ at the end of buffers
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#8db1e1" })       -- Updated color for relative line numbers
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#4f8bd1" })
end

-- Apply the custom color scheme setup
ColorMyPencils()

