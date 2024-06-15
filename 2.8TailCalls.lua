function foo(n)
    if n == 0 then
        return 1
    else
        return n * foo(n - 1)
    end
end

print(foo(10))