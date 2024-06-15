co = coroutine.create(function (a,b)
    return 6, 7
end)

print(coroutine.resume(co))