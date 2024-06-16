tbl = {a = 1, b = 10, c = 3, d = 4, e = 5,}
s = "This is a string"

for w in string.gfind(s, "[%w_]+") do
    print(w)
end
