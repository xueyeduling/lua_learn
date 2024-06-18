s = string.gsub("Lua is cute", "cute", "great")
print(s) --> Lua is great
s = string.gsub("all lii", "l", "x")
print(s) --> axx xii
s = string.gsub("Lua is great", "perl", "tcl")
print(s) --> Lua is great 


s = string.gsub("all lii", "l", "x", 1)
print(s) --> axl lii
s = string.gsub("all lii", "l", "x", 2)
print(s) --> axx lii 

str = "Lua is cute"
_, count = string.gsub(str, " ", " ")
print(count)