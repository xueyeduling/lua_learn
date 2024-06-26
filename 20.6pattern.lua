s = "Deadline is 30/05/1999, firm"
date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))

print(string.gsub("hello, up-down!", "%A", ".")) 

text = "Whenever I look at the sky, I don't like to talk again, and whenever I talk, I dare not look at the sky again."

_, nvow = string.gsub(text, "[AEIOUaeiou]", "") 

print(nvow)

print(string.gsub("one, and two; and three", "%a+", "word"))

i, j = string.find("the number 1298 is even", "%d+")
print(i,j)


test = "int x; /* x */ int y; /* y */"
print(string.gsub(test, "/%*.*%*/", "<COMMENT>")) 


test = "int x; /* x */ int y; /* y */"
print(string.gsub(test, "/%*.-%*/", "<COMMENT>")) 

--检查字符串 s 是否以数字开头
--if string.find(s, "^%d") then ...

--检查字符串 s 是否是一个整数
--if string.find(s, "^[+-]?%d+$") then ... 

print(string.gsub("a (enclosed (in) parentheses) line", "%b()", ""))


