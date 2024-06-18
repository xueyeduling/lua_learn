PI = 3.14159265358979323846
print(string.format("pi = %.4f", PI))

d = 5; m = 11; y = 1990
print(string.format("%02d/%02d/%04d", d, m, y))

tag, title = "h1", "a title"
print(string.format("<%s>%s</%s>", tag, title, tag)) 
