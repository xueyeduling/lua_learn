a = {}

for line in io.lines() do
    table.insert(a, line)
end

print(#a);

function printtbl (tbl)
    s = ""
    for i, v in ipairs(tbl) do
        s = s .. v .. " "
    end
    print(s)
end

a = {1,2,3,4,5,6}
x = 10
table.insert(a, x)
printtbl(a)
table.remove(a)
printtbl(a)
table.insert(a, 1, x)
printtbl(a)
table.remove(a, 1)
printtbl(a)