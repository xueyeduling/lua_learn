t = {}

local _t = t

t = {}

local mt = {
    __index = function (t, k)
        print("access to element " .. tostring(k))
        return _t[k]
    end,

    __newindex = function (t, k, v)
        print("*update of element " .. tostring(k) .. " to " .. tostring(v))
        _t[k] = v
    end
}

setmetatable(t, mt)

t[2] = 'hello'
print(t[2])