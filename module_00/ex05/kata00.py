t = (19, 42, 21)

result = 'The ' + str(len(t)) + ' numbers are: '
for num in t:
    result += str(num) + ', '
if result[-2:] == ', ':
    result = result[0:-2]
print(result)
