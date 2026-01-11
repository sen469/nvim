-- nvim/lua/plugins/lualine.lua
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local function clock()
            return os.date("%H:%M")
        end

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',

                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },

                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            
            -- バッファーライン（上部）
            tabline = {
                lualine_a = {
                    {
                        'buffers',
                        mode = 2,
                        filetype_names = {
                            TelescopePrompt = 'Telescope',
                            dashboard = 'Dashboard',
                            packer = 'Packer',
                            fzf = 'FZF',
                            alpha = 'Alpha'
                        },
                        use_mode_colors = false,
                        symbols = {
                            modified = ' ●',
                            alternate_file = '#',
                            directory =  '',
                        },

                        filter = function(buf)
                            local bufnr = buf.bufnr
                            if vim.api.nvim_buf_get_name(bufnr) == "" and bufnr ~= vim.api.nvim_get_current_buf() then
                                return false
                            end
                            return true
                        end,
                    }
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        'filename',
                        path = 1,
                        color = { fg = '#ffffff', bg = '#E06C75' },
                    }
                }
            },

            sections = {
                lualine_a = {
                    { 'mode', separator = { right = '' } },
                },
                lualine_b = {
                    'branch',
                    'diff',
                    { 'diagnostics', separator = { right = '' } },
                },
                lualine_c = {
                    'filename'
                },
                lualine_x = {
                    { 'encoding', separator = { left = '' } },
                    'fileformat',
                    'filetype',
                },
                lualine_y = 
                {
                    { 'progress', separator = { left = '' } },
                    {
                        clock,
                        color = { fg = '#1E1E1E', bg = '#F5A9B8' },
                        separator = { left = '', right = '' },
                    },
                },
                lualine_z = {
                    { 'location', separator = { left = '' } }
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
