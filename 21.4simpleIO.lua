local lines = {}
--read the lines in table 'lines'

for line in io.lines() do
    table.insert(lines, line)
end
--sort
table.sort(lines)
--write all the lines
for i, l in ipairs(lines) do io.write(l, "\n") end