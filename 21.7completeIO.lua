print(io.open("non-existent file", "r"))

print(io.open("/etc/password", "w"))

local f = assert(io.open(filename, mode))