oldSin = math.sin

math.sin = function (x)
    return oldSin(x*math.pi/180)
end

a = io.read()
print(math.sin(a))