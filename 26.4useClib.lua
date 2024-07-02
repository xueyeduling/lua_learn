local path_to_lib = "./26.4.so"  -- 路径需要根据实际情况调整
local funcname = "myfunction"

-- 加载库并获取函数
local func, err = package.loadlib(path_to_lib, funcname)

if func then
    -- 成功加载，调用函数
    func()
else
    -- 输出错误信息
    print("Error loading library:", err)
end