function receive ()
    local status, value = coroutine.resume(producer)
    return value
end

function send (x)
    coroutine.yield(x)
end

producer = coroutine.create( function ()
    while true do
        local x = io.read()
        send(x)
    end
end)

print(receive().." done!")