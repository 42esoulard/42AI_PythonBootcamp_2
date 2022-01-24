from the_bank import Account, Bank


bank = Bank()

print('--- Adding an invalid account (has attr starting with \'b\' ---')
# invalid account (has attr starting with 'b')
bank.add(Account(
'Youyou Plapla',
zip='100-064',
bli="bla",
value=12000.0,
hehe='haa'
))
print(str(bank.get_account('Youyou Plapla')))

print('--- After fix account: ---')
print(str(bank.fix_account('Youyou Plapla')))
print(str(bank.get_account('Youyou Plapla')))

print('--- Adding an invalid account (has an even number of attributes) ---')
# invalid account (has an even number of attributes)
bank.add(Account(
'Lilalou',
zip='123456',
value=5000,
lala='lala',
loulou="loulou"
))
print(str(bank.get_account('Lilalou')))

print('--- After fix account: ---')
print(str(bank.fix_account('Lilalou')))
print(str(bank.get_account('Lilalou')))

print('--- Adding an invalid account (has no \'value\' attribute) ---')
# invalid account (has no value attribute)
bank.add(Account(
'H4ck3r',
zip='1337',
pwd='supasecret'
))
print(str(bank.get_account('H4ck3r')))

print('--- Valid Transfer of 500: ---')
print('--- BEFORE: ---')
print(str(bank.get_account('Lilalou')))
print(str(bank.get_account('Youyou Plapla')))
bank.transfer("Lilalou", "Youyou Plapla", 500)
print('--- AFTER: ---')
print(str(bank.get_account('Lilalou')))
print(str(bank.get_account('Youyou Plapla')))

print('--- Invalid Transfer (not enough money): ---')
bank.transfer("Lilalou", "Youyou Plapla", 500000)
print(str(bank.get_account('Lilalou')))
print(str(bank.get_account('Youyou Plapla')))

print('--- Invalid Transfer (bad amount): ---')
bank.transfer("Lilalou", "Youyou Plapla", -1)
print(str(bank.get_account('Lilalou')))
print(str(bank.get_account('Youyou Plapla')))

print('--- Invalid Transfer (lacks value attribute): ---')
bank.transfer("Lilalou", "H4ck3r", 120)
print(str(bank.get_account('Lilalou')))
print(str(bank.get_account('H4ck3r')))

print('--- After fix account: ---')
print(str(bank.fix_account('H4ck3r')))
print(str(bank.get_account('H4ck3r')))

print('--- Valid Transfer: ---')
print('--- BEFORE: ---')
print(str(bank.get_account('Lilalou')))
print(str(bank.get_account('H4ck3r')))
print(bank.transfer("Lilalou", "H4ck3r", 1200))
print('--- AFTER: ---')
print(str(bank.get_account('Lilalou')))
print(str(bank.get_account('H4ck3r')))
