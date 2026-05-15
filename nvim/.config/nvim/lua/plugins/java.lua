return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    enabled = false,
    config = function()
      local jdtls = require "jdtls"
      local mason_path = vim.fn.stdpath "data" .. "/mason/packages"

      local function get_config()
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace = vim.fn.stdpath "data" .. "/jdtls-workspace/" .. project_name

        local bundles = {
          vim.fn.glob(mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
        }
        vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "/java-test/extension/server/*.jar", true), "\n"))

        return {
          cmd = {
            "java",
            "-javaagent:" .. vim.fn.expand "~/.local/share/lombok/lombok.jar",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.level=ALL",
            "-Xmx2g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",
            "-jar",
            vim.fn.glob(mason_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", true),
            "-configuration",
            mason_path .. "/jdtls/config_mac",
            "-data",
            workspace,
          },
          root_dir = jdtls.setup.find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
          settings = {
            java = {
              signatureHelp = { enabled = true },
              contentProvider = { preferred = "fernflower" },
              completion = {
                favoriteStaticMembers = {
                  "org.junit.Assert.*",
                  "org.mockito.Mockito.*",
                  "java.util.Objects.requireNonNull",
                },
                filteredTypes = { "com.sun.*", "io.micrometer.shaded.*" },
              },
              sources = {
                organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
              },
              codeGeneration = {
                toString = { template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}" },
                useBlocks = true,
              },
              configuration = {
                runtimes = {
                  {
                    name = "JavaSE-25",
                    path = vim.fn.expand "~/.local/share/mise/installs/java/corretto-25.0.2.10.1",
                  },
                  {
                    name = "JavaSE-21",
                    path = vim.fn.expand "~/.local/share/mise/installs/java/corretto-21.0.10.7.1",
                  },
                },
              },
            },
          },
          init_options = { bundles = bundles },
          on_attach = function(_, bufnr)
            jdtls.setup_dap { hotcodereplace = "auto" }
            jdtls.setup.add_commands()

            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "<leader>ji", jdtls.organize_imports, "Java: organize imports")
            map("n", "<leader>je", jdtls.extract_variable, "Java: extract variable")
            map("v", "<leader>je", function()
              jdtls.extract_variable(true)
            end, "Java: extract variable")
            map("n", "<leader>jm", jdtls.extract_method, "Java: extract method")
            map("v", "<leader>jm", function()
              jdtls.extract_method(true)
            end, "Java: extract method")
            map("n", "<leader>jc", jdtls.extract_constant, "Java: extract constant")
            map("n", "<leader>jt", jdtls.test_nearest_method, "Java: test method")
            map("n", "<leader>jT", jdtls.test_class, "Java: test class")
            map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", "DAP: toggle breakpoint")
            map("n", "<leader>dc", "<cmd>DapContinue<cr>", "DAP: continue")
            map("n", "<leader>du", function()
              require("dapui").toggle()
            end, "DAP: toggle UI")
          end,
        }
      end

      -- For every Java buffer after the first
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          jdtls.start_or_attach(get_config())
        end,
      })

      -- For the first buffer (already open when config runs)
      jdtls.start_or_attach(get_config())
    end,
  },
}
