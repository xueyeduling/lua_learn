Account = {balance = 0}
function Account.withdraw (self, v)
    self.balance = self.balance - v
end

Account.withdraw(Account, 100.00)

print(Account.balance)

a = Account;
Account = nil
a.withdraw(a, 100.00)
print(a.balance)

Account = a
a2 = {balance = 0, withdraw = Account.withdraw}

a2.withdraw(a2, 260)
print(a2.balance)

