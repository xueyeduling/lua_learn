function basicSerialize(o)
    if type(o) == "number" then
        return tostring(o)
    else
        return string.format("%q", o)
    end
end
local t = {}
function save (name, value, saved)
    saved = saved or {}
    io.write(name, " = ")
    if type(value) == "number" or type(value) == "string" then
        io.write(basicSerialize(value), "\n")
    elseif type(value) == "table" then
        if saved[value] then
            io.write(saved[value], "\n")
        else
            saved[value] = name
            io.write("{}\n")
            for k, v in pairs(value) do
                local fieldname = string.format("%s[%s]", name, basicSerialize(k))
                save(fieldname, v, saved)
            end
        end
    else
        error("cannot save a " .. type(value))
    end
end

a = {{"one", "two"}, 3}
b = {k = a[1]}

save('a', a, t)
save('b', b, t)