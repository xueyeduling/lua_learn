local numDate = os.time()

local tblDate = os.date("*t", numData)

for k, v in pairs(tblDate) do
    print(k, v)
end

print(os.date("today is %A, in %B", numData))

print(os.date("%x", numData))


local x = os.clock()
local s = 0
for i = 1, 100000000 do s = s + i end
print(string.format("elapsed time: %.2f\n", os.clock() - x))