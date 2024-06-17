function complex.div (c1, c2)
    return complex.mul(c1, complex.inv(c2))
end

local add, i = complex.add, complex.i
c1 = add(complex.new(10, 20), C.i)

