print(os.getenv("HOME"))

dirname = arg[1]

print(dirname)

function createDir(dirname)
    print(os.execute("mkdir " .. dirname))
end

createDir(dirname)