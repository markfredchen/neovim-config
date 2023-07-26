return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        edge.keymap('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
        edge.keymap('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
        edge.keymap('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
        edge.keymap('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
        edge.keymap('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
        edge.keymap('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
        edge.keymap('n', 'v',     api.node.open.vertical,                opts('Open: Vertical Split'))
        edge.keymap('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
        edge.keymap('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
        edge.keymap('n', 'h',     api.node.navigate.parent_close,        opts('Close Directory'))
        edge.keymap('n', '<CR>',  api.node.open.edit,                    opts('Open'))
        edge.keymap('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
        edge.keymap('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
        edge.keymap('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
        edge.keymap('n', '.',     api.node.run.cmd,                      opts('Run Command'))
        edge.keymap('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
        edge.keymap('n', 'a',     api.fs.create,                         opts('Create'))
        edge.keymap('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
        edge.keymap('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
        edge.keymap('n', 'c',     api.fs.copy.node,                      opts('Copy'))
        edge.keymap('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
        edge.keymap('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
        edge.keymap('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
        edge.keymap('n', 'd',     api.fs.remove,                         opts('Delete'))
        edge.keymap('n', 'D',     api.fs.trash,                          opts('Trash'))
        edge.keymap('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
        edge.keymap('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
        edge.keymap('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
        edge.keymap('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
        edge.keymap('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
        edge.keymap('n', 'f',     api.live_filter.start,                 opts('Filter'))
        edge.keymap('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
        edge.keymap('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
        edge.keymap('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
        edge.keymap('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
        edge.keymap('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
        edge.keymap('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
        edge.keymap('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
        edge.keymap('n', 'o',     api.node.open.edit,                    opts('Open'))
        edge.keymap('n', 'l',     api.node.open.edit,                    opts('Open'))
        edge.keymap('n', '<CR>',  api.node.open.edit,                    opts('Open'))
        edge.keymap('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
        edge.keymap('n', 'p',     api.fs.paste,                          opts('Paste'))
        edge.keymap('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
        edge.keymap('n', 'q',     api.tree.close,                        opts('Close'))
        edge.keymap('n', 'r',     api.fs.rename,                         opts('Rename'))
        edge.keymap('n', 'R',     api.tree.reload,                       opts('Refresh'))
        edge.keymap('n', 's',     api.node.run.system,                   opts('Run System'))
        edge.keymap('n', 'S',     api.tree.search_node,                  opts('Search'))
        edge.keymap('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
        edge.keymap('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
        edge.keymap('n', 'x',     api.fs.cut,                            opts('Cut'))
        edge.keymap('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
        edge.keymap('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
        edge.keymap('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
        edge.keymap('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
        edge.keymap("n", "<leader>o", ":NvimTreeFocus<CR>")
        edge.keymap("n", "<leader>e", ":NvimTreeToggle<CR>")
      end

      local opt = {
        auto_reload_on_write = false,
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
          ignore_list = {},
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 200,
        },
        renderer = {
          indent_markers = {
            enable = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              none = " ",
            },
          },
        },
        filters = {
          dotfiles = true,
        },
        actions = {
          use_system_clipboard = true,
          change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
          },
          open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
              enable = true,
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
        },
        on_attach = on_attach,
      }
      return opt
    end,
  },
}
