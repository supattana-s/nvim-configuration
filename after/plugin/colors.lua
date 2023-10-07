function ColorMyPencils(color)
	color = color or 'dracula-soft'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#87CEFA', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FFC0CB', bold=true })
end

ColorMyPencils()
LineNumberColors()
