return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Snippet engine
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping(function(fallback)
    		    if cmp.visible() then
    		        if luasnip.expandable() then
    		            luasnip.expand()
    		        else
    		            cmp.confirm({
    		                select = true,
    		            })
    		        end
    		    else
    		        fallback()
    		    end
    		end),
    		["<Tab>"] = cmp.mapping(function(fallback)
    		  if cmp.visible() then
    		    cmp.select_next_item()
    		  elseif luasnip.locally_jumpable(1) then
    		    luasnip.jump(1)
    		  else
    		    fallback()
    		  end
    		end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions
        { name = "luasnip" }, -- Snippet completion
        { name = "copilot" }, -- Copilot completions
        { name = 'nvim_lsp_signature_help' },
      }, {
        { name = "buffer" }, -- Buffer completions
        { name = "path" }, -- Path completions
      }),
    })

    -- Use completion in command-line mode
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
