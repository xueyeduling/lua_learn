w = {x=0, y=0, label="console"}
x = {math.sin(0), math.sin(1), math.sin(2)}
w[1] = "another field"
x.f = w
print(w["x"]) --> 0
print(w[1]) --> another field
print(x.f[1]) --> another field
w.x = nil -- remove field "x"