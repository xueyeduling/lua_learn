local function search (k, plist)
    for i = 1, #plist do
        local v = plist[i][k]
        if v then return v end
    end
end

function createClass (...)
    local c = {}

    setmetatable(c, {__index = function(t, k)
        local v = search(k, arg)
        t[k] = v        -- save for next access 
        return v
    end})

    c.__index = c

    function c:new (o)
        o = o or {}
        setmetatable(o, c)
        return o
    end

    return c
end

Account = {balance = 0}

function Account:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Account:deposit (v)
    self.balance = self.balance + v
end

function Account:withdraw (v)
    if v > self.balance then error "insufficient funds" end
    self.balance = self.balance - v
end

Named = {}
function Named:getname ()
    return self.name
end

function Named:setname (n)
    self.name = n
end

NamedAccount = createClass(Account, Named)

account = NamedAccount:new{name = "hewei"}
print(account:getname())
