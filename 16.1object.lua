Account = {balance = 0}
function Account.withdraw (v)
    Account.balance = Account.balance - v
end

Account.withdraw(100.00)

print(Account.balance)

a = Account;
Account = nil
--a.withdraw(100.00)
