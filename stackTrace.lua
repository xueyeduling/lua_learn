
function printStackTrace()
    local level = 1
    while true do
        local info = debug.getinfo(level, "nS")
        if not info then break end
        if info.what == "C" then
            print(level, "C function")
        else
            print(level, info.name or "anonymous", info.short_src, info.currentline)
        end
        level = level + 1
    end
end

function printStackTrace2()
    local level = 1
    while true do
        local info = debug.getinfo(level, "nS")
        if not info then break end
        if info.what == "C" then
            print(level, "C function")
        else
            print("file "..info.short_src.." line "..info.linedefined.." "..info.namewhat.." "..(info.name or "anonymous").." ".."level "..level)
        end
        level = level + 1
    end
end
 
function a()
    b()
end
 
function b()
    c()
end
 
function c()
    printStackTrace()
    printStackTrace2()
    print(debug.traceback())
end
 
a()