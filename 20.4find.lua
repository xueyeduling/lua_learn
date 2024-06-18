local t = {} -- table to store the indices
local i = 0
while true do
 i = string.find(s, "\n", i+1) -- find 'next' newline
if i == nil then break end
 table.insert(t, i)
end 