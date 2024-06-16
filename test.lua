local t = {}
local mt = {
  __newindex = function(table, key, value)
    print("Attempt to update table")
  end
}

print(t[1])
setmetatable(t, mt)
t[1] = "Hello"  -- 这会触发 __newindex 输出 "Attempt to update table"
print(t[1])
rawset(t, 1, "Hello")  -- 这不会触发 __newindex，直接在表t中设置t[1] = "Hello"
print(t[1])