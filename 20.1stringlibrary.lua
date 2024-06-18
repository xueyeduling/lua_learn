print(string.upper("a??o"))
s = "abcdefghijklmnopqrstuvwxyz"
j = 10
print(string.sub(s, 1, j))
print(string.sub(s, j, -1))
print(string.sub(s, j))
print(string.sub(s, 2, -2))

print("\n----------------------------------------------------\n")

print(string.char(97)) --> a
i = 99; print(string.char(i, i+1, i+2)) --> cde
print(string.byte("abc")) --> 97
print(string.byte("abc", 2)) --> 98
print(string.byte("abc", -1)) --> 99 