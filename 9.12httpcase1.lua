local socket = require("luasocket")

host = "www.w3.org"
file = "/TR/REC-html32.html"

c = assert(socket.connect(host, 80))
c:send("GET" .. file .. " HTTP/1.0\r\n\r\n")

c:close()