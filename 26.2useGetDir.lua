function f (x)
    dirCont = myl_dir(x)
    for i, v in ipairs(dirCont) do
        print(v)
    end
    return 1;
end