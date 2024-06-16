a = 1
setfenv(1, {_G = _G})
_G.print(a)
_G.print(_G.a)