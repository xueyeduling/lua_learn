network = {
    {name = "grauna", IP = "210.26.30.34"},
    {name = "arraial", IP = "210.26.30.23"},
    {name = "lua", IP = "210.26.23.12"},
    {name = "derain", IP = "210.26.23.20"},
   } 

table.sort(network, function (a,b)
return (a.name > b.name)
end)

for i, v in ipairs(network) do
    print(i)
    for k, v2 in pairs(v) do
        print(k, v2)
    end
end
