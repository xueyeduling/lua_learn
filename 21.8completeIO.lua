local filename = "test.lua"
local f = assert(io.open(filename, r))
local t = f:read("*all")
print(t)
f:close()


io.stderr:write("this is a error\n")