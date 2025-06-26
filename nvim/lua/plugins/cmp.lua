return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip", -- Make sure this is here for LuaSnip integration
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      table.insert(opts.sources, { name = "emoji" })
      local cmp = require("cmp")
      local luasnip = require("luasnip") -- Get LuaSnip
      local defaults = require("cmp.config.default")()

      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = cmp.mapping.preset.insert({
          -- CHANGED: Use cmp.SelectBehavior.Select for navigation consistency
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<C-e>"] = cmp.mapping.abort(), -- Keep abort for C-e
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select }) -- Select next completion item
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- Expand or jump to next snippet placeholder
            else
              fallback() -- Fallback to default tab behavior (e.g., insert a tab character)
            end
          end, { "i", "s" }), -- Apply in insert and select mode

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select }) -- Select previous completion item
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) -- Jump to previous snippet placeholder
            else
              fallback() -- Fallback to default shift-tab behavior
            end
          end, { "i", "s" }), -- Apply in insert and select mode
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
          { name = "luasnip" }, -- Ensure LuaSnip is a source for cmp
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
    ---@param opts cmp.ConfigSchema | {auto_brackets?: string[]}
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      local cmp = require("cmp")
      local Kind = cmp.lsp.CompletionItemKind
      cmp.setup(opts)
      cmp.event:on("confirm_done", function(event)
        if not vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
          return
        end
        local entry = event.entry
        local item = entry:get_completion_item()
        if vim.tbl_contains({ Kind.Function, Kind.Method }, item.kind) then
          local keys = vim.api.nvim_replace_termcodes("()<left>", false, false, true)
          vim.api.nvim_feedkeys(keys, "i", true)
        end
      end)
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          }
          table.insert(opts.sources, { name = "luasnip" })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {},
  },
}
