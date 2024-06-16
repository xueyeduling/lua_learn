local declaredNames = {}
function declare (name, initval)
    rawset (_G, name, initval)
    declaredNames[name] = true
end

setmetatable(_G, {
    __newindex = function (t, n, v)
        if not declaredNames[n] then
            error("attempt to write to undeclared var."..n, 2)
        else
            rawset(t, n, v)
        end
    end,

    __index = function (_, n)
        if not declaredNames[n] then
            error("attempt to read unceclared var. "..n, 2)
        else
            return nil
        end
    end,
})

declare(1, "1")
print(1)
