local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"
local command = require "core.command"

command.add(nil, {
    ["shell:compile-run-cpp"] = function()
      local doc = core.active_view.doc
      local filename = doc and system.absolute_path(doc.filename)
      if(doc) then
        doc:save()
        os.execute(
            "g++ -std=c++17 -Wall -Wextra -Wshadow -fsanitize=undefined '" .. filename
            .. "' -o '" .. filename .. "'.o && '" .. filename .. "'.o < input.txt > output.txt"
        )
      end
    end,
})

-- key binding:
keymap.add {
    ["ctrl+shift+j"] = "root:split-left",
    ["ctrl+shift+l"] = "root:split-right",
    ["ctrl+shift+i"] = "root:split-up",
    ["ctrl+shift+k"] = "root:split-down",
    ["ctrl+b"] = "shell:compile-run-cpp",
}
