local mt = {__index = function (t) return t.___ end}

function setDefault (t, d)
    t.___ = d
    setmetatable(t, mt)
end


local key = {}
local mt = {__index = function (t) return t[key] end}
function setDefault (t, d)
    t[key] = d
    setmetatable(t, mt)
end
