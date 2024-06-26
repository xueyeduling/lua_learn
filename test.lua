os.setlocale("C")  -- 设置时区为 UTC
while true do
    local timestamp = io.read()
    local date_table = os.date("*t", timestamp)
    print(os.date("%Y-%m-%d %H:%M:%S", timestamp))  -- 输出格式化的日期和时间
end