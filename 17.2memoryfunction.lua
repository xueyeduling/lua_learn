local results = {}
function mem_loadstring (s)
    if results[s] then
        return results[s]
    else
        local res = loadstring(s)
        results[s] = res
        return res
    end
end
