function newStack ()
    return {""} -- starts with an empty string 
end

function addString (stack, s)
    table.insert(stack, s) -- push 's' into the the stack
    for i=table.getn(stack)-1, 1, -1 do
        if string.len(stack[i]) > string.len(stack[i+1]) then
            break
        end
        stack[i] = stack[i] .. table.remove(stack)
    end
end

local s = newStack()
for line in io.lines() do
    addString(s, line .. "\n")
end
s = toString(s) 

