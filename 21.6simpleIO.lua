local size = 2 ^ 13
while true do
    local block = io.read(size)
    if not block then break end
    io.write(block)
end
