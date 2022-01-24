languages = {
    'Python': 'Guido van Rossum',
    'Ruby': 'Yukihiro Matsumoto',
    'PHP': 'Rasmus Lerdorf',
}

result = ''
for key, val in languages.items():
    result += key + ' was created by ' + val + '\n'
if result[-1:] == '\n':
    result = result[0:-1]
print(result)
