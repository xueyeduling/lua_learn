setmetatable(_G, {
    __newindex = function (_, n)
        error("attempt to write to undeclared variable " .. n, 2)
    end,

    __index = function (_, n)
        error("attempt to read undeclared variable " .. n, 2)
    end,
})

--a = 1

if rawget(_G, var) == nil then
    error("'var' is undeclared ")-- 'var' is undeclared
end

a = 1