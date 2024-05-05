require('lualine').setup {
    options = {
        icons_enabled = false,
        section_separators = '',
        component_separators = ''
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { 'filename', 'location' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {},
        lualine_z = { 'progress' }
    },
}
