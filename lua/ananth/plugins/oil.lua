return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      preview = {
        update_on_cursor_moved = true,
      },
      view_options = {
        show_hidden = true,
      },
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilEnter",
      callback = vim.schedule_wrap(function(args)
        local oil = require("oil")
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.open_preview()
        end
      end),
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    local function oil_dir_picker()
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local Previewer = require("telescope.previewers.previewer")

      local oil_previewer = Previewer:new({
        title = "Oil Preview",
        setup = function()
          return { bufnr = nil }
        end,
        teardown = function(self)
          if self.state and self.state.bufnr and vim.api.nvim_buf_is_valid(self.state.bufnr) then
            pcall(vim.api.nvim_buf_delete, self.state.bufnr, { force = true })
          end
        end,
        preview_fn = function(self, entry, status)
          local win = status.preview_win
          if not win or not vim.api.nvim_win_is_valid(win) then
            return
          end
          local path = vim.fn.fnamemodify(entry[1], ":p")
          if not path:match("/$") then
            path = path .. "/"
          end
          local url = "oil://" .. path

          local prev = self.state.bufnr
          local existing = vim.fn.bufnr(url)
          local buf
          local fresh = false
          if existing ~= -1 and vim.api.nvim_buf_is_valid(existing) then
            buf = existing
          else
            buf = vim.api.nvim_create_buf(false, false)
            vim.api.nvim_buf_set_name(buf, url)
            fresh = true
          end
          vim.api.nvim_win_set_buf(win, buf)
          if fresh then
            vim.api.nvim_buf_call(buf, function()
              vim.cmd("doautocmd BufReadCmd")
            end)
          end
          if prev and prev ~= buf and vim.api.nvim_buf_is_valid(prev) then
            pcall(vim.api.nvim_buf_set_name, prev, "")
            pcall(vim.api.nvim_buf_delete, prev, { force = true })
          end
          self.state.bufnr = buf
          self.state.winid = win
        end,
      })

      pickers
        .new({}, {
          prompt_title = "Directories (Oil)",
          finder = finders.new_oneshot_job(
            { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
            {}
          ),
          sorter = conf.generic_sorter({}),
          previewer = oil_previewer,
          attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
              local entry = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if entry then
                vim.cmd("Oil " .. vim.fn.fnameescape(entry[1]))
              end
            end)
            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<leader>fd", oil_dir_picker, { desc = "Find directory (Oil)" })
  end,
}
