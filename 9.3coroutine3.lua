co = coroutine.create(function (a,b,c)
    print("co", a, b, c)
end)

coroutine.resume(co, 1, 2, 3)