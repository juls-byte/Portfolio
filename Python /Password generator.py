import random
# создание констант
digits = '0123456789'
lowercase_letters = 'abcdefghijklmnopqrstuvwxyz'
uppercase_letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
punctuation = '!#$%&*+-=?@^_'
# создание переменной
chars = ''
# определение вида символов в пароле
sum = int(input('Введите количество паролей для генерации: '))
length = int(input('Введите длину пароля: '))
num = input('Включать ли в пароль цифры 0123456789? y - да, n - нет: ')
uppercase = input('Включать ли прописные буквы ABCDEFGHIJKLMNOPQRSTUVWXYZ? y - да, n - нет: ')
lowercase = input('Включать ли строчные буквы abcdefghijklmnopqrstuvwxyz? y - да, n - нет: ')
symbols = input('Включать ли символы !#$%&*+-=?@^_? y - да, n - нет: ')
ambiguous = input('Исключать ли неоднозначные символы il1Lo0O? y - да, n - нет: ')
if num == 'y':
    chars += digits
if uppercase == 'y':
    chars += uppercase_letters
if lowercase == 'y':
    chars += lowercase_letters
if symbols == 'y':
    chars += punctuation
if ambiguous == 'y':
    for c in 'il1Lo0O':
        chars = chars.replace(c,'')
# функция генерации пароля
def generate_password(length, chars):
    password = ''
    for _ in range(length):
        password += random.choice(chars)
    print(password)
for _ in range(sum):
    generate_password(length, chars)
