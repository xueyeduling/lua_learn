
function unpack(t, i)
    i = i or 1
    if t[i] then
        return t[i], unpack(t, i+1)
    end
end


f = string.find
a = {"hello", "ll"}
print(f(unpack(a)))
