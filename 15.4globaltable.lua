local P = {}

if _REQUIREDNAME == nil then
    complex = P
    else
    _G[_REQUIREDNAME] = P
end
complex = P
setmetatable(P, {__index = _G})
setfenv(1, P)

function add (c1, c2)
    return new(c1.r + c2.r, c1.i + c2.i)
end 

print(math.sin(math.pi/6))

