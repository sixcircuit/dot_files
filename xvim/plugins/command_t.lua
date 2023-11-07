
commandt = require('wincent.commandt')

find_ignore_dir = {".git", "node_modules"}
find_ignore_file = {"*.o", "*.obj"}
find_max_files = 20000
-- find_max_files = 2

head = "head"

if jit.os == "OSX" then
   head = "ghead"
end

-- find_ignore_dir = {}
-- find_ignore_file = {}

open = function(buffer, command)
   vim.cmd(command .. ' ' .. buffer)
   -- vim.cmd("call LayoutWindows()")

   -- this is the try to be smart function that fucks everything up.

   -- local open = function(buffer, command)
      --   buffer = vim.fn.fnameescape(buffer)
      --   local is_visible = require('wincent.commandt.private.buffer_visible')(buffer)
      --   if is_visible then
      --     -- In order to be useful, `:sbuffer` needs `vim.o.switchbuf = 'usetab'`.
      --     vim.cmd('sbuffer ' .. buffer)
      --   else
      --     vim.cmd(command .. ' ' .. buffer)
      --   end
      -- end
      --
      -- commandt.open(item, kind)
      -- vim.cmd.normal('call LayoutWindows()<CR>')
      -- end 
end

commandt.setup({
   -- height = 10000,
   -- position = top,
   -- order = "reverse"
   ignore_case = true,
   -- always_show_dot_files = true,
   open = open,
   finders = {
      find = {
         open = open,
         command = function(directory)
            if vim.startswith(directory, './') then
               directory = directory:sub(3, -1)
            end
            if directory ~= '' and directory ~= '.' then
               directory = vim.fn.shellescape(directory)
            end
            local drop = 0
            if directory == '' or directory == '.' then
               -- Drop 2 characters because `find` will prefix every result with "./",
               -- making it look like a dotfile.
               directory = '.'
               drop = 2
               -- TODO: decide what to do if somebody passes '..' or similar, because that
               -- will also make the results get filtered out as though they were dotfiles.
               -- I may end up needing to do some fancy, separate micromanagement of
               -- prefixes and let the matcher operate on paths without prefixes.
            end
            -- TODO: support max depth, dot directory filter etc

            -- local command = 'find -L ' .. directory .. ' -type f -print0 2> /dev/null'
            -- local command = find -L . -not \( -path "*/node_modules/*" -prune \) -not \( -path "*/.git/*" -prune \) -type f

            local command = 'find -L ' .. directory

            for _, dir_name in ipairs(find_ignore_dir) do
               command = command .. ' -not \\( -path "*/' .. dir_name .. '/*" -prune \\)'
            end

            for _, file_name in ipairs(find_ignore_file) do
               command = command .. ' -not \\( -path "*/' .. file_name .. '" -prune \\)'
            end

            command = command .. ' -type f -print0 2> /dev/null' 
            -- command = command .. ' -type f -print0' 
            if find_max_files > 0 then
               command = command .. " | " .. head .. " -z -n " .. find_max_files
               command = command .. ' 2> /dev/null'
            end

            -- print("command: " .. command)

            return command, drop
         end,
         fallback = true,
      },
      rg = {
         open = open,
         command = function(directory)
            if vim.startswith(directory, './') then
               directory = directory:sub(3, -1)
            end
            if directory ~= '' and directory ~= '.' then
               directory = vim.fn.shellescape(directory)
            end
            local drop = 0
            if directory == '.' then
               drop = 2
            end
            local command = 'rg --files --hidden --null'
            if #directory > 0 then
               command = command .. ' ' .. directory
            end
            command = command .. ' 2> /dev/null'
            return command, drop
         end,
         fallback = false,
      }
   }
})

