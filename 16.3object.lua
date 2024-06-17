Account = {balance = 0}

function Account:withdraw (v)
    self.balance = self.balance - v
end

a = Account;
Account = nil
a:withdraw(100.00)
print(a.balance)

