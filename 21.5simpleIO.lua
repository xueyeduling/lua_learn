while true do
    local n1, n2, n3 = io.read("*number", "*number", "*number")
    if not n1 then break end
    print(math.max(n1, n2, n3))
end


-- test case
-- 6.0 -3.23 15e12 
-- 4.3 234 1000001


local pat = "(%S+)%s+(%S+)%s+(%S+)%s+"
for n1, n2, n3 in string.gfind(io.read("*all"), pat) do
    print(math.max(n1, n2, n3))
end

-- test case
-- 6.0 -3.23 15e12 
-- 4.3 234 1000001