local found = nil
for i=1,a.n do
if a[i] == value then
 found = i -- save value of 'i'
 break
end
end
print(found) 