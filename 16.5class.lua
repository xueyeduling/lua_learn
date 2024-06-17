Account = {
    balance = 0,
    withdraw = function (self, v)
        self.balance = self.balance - v
    end
}

function Account:deposit (v)
    self.balance = self.balance + v
end

function Account:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

a = Account:new{balance = 0}
a:deposit(100)  -- Account.deposit(a, 100.00)
print(a.balance)

b = Account:new()
print(b.balance)
b:deposit(100)  -- b.balance = b.balance + v  下一次我们访问这个值的时候，不会在涉及到 index metamethod，因为 b 已经存在他自己的 balance 域。
print(b.balance)
