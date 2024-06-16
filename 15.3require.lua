local P = {} -- package
if _REQUIREDNAME == nil then
    complex = P
    print("yes")
else
    _G[_REQUIREDNAME] = P
    print("no")
end


