-- ~/.config/nvim/lua/plugins/wolfram.lua

return {
  -- Configuração direta do nvim-treesitter
  "nvim-treesitter/nvim-treesitter",

  -- A função config é executada após o plugin ser carregado
  config = function()
    -- 1. Cria a configuração principal do treesitter
    require("nvim-treesitter.configs").setup {
      
      -- Define o nome do parser e sua localização externa (NECESSÁRIO para ser reconhecido)
      parser_install_info = {
        wolframlanguage = {
          -- Usamos as informações do repositório original para referência.
          url = "https://github.com/LumaKernel/tree-sitter-wolfram",
          files = {"src/parser.c"},
          branch = "main",
        }
      },
      
      -- 2. Módulos de ativação
      highlight = {
        enable = true,
        additional_languages = { "wolframlanguage" },
      },
      indent = {
        enable = true,
        additional_languages = { "wolframlanguage" },
      },
      
      -- 3. Força a instalação: Diz ao treesitter para procurar o parser.
      -- Ele vai encontrar o wolframlanguage.so no diretório de parsers.
      ensure_installed = { "wolframlanguage" },
    }

    -- 4. Define o tipo de arquivo (.wl, .wls) - CRUCIAL
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "*.wl", "*.wls" },
      callback = function()
        vim.bo.filetype = "wolframlanguage"
      end,
      group = vim.api.nvim_create_augroup("WolframFinalConfig", { clear = true })
    })
    
    -- Tenta recarregar o buffer. Se o treesitter estiver carregado, ele vai ligar o highlight.
    vim.cmd("e!")
  end
}
