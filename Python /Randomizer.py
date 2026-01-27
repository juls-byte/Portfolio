def is_valid(s):
    return s.isdigit() and 1 <= int(s) <= 100
import random
a = random.randint(1, 101)
print('Добро пожаловать в числовую угадайку')
while True:
    s = input('Угадай число:')
    if not is_valid(s):
        print('А может быть все-таки введем целое число от 1 до 100?')
        continue
    s = int(s)
    if s < a:
            print('Ваше число меньше загаданного, попробуйте еще разок')
    elif s > a:
            print('Ваше число больше загаданного, попробуйте еще разок')
    elif s == a:
            print('Вы угадали, поздравляем!')
            break
print('Спасибо, что играли в числовую угадайку. Еще увидимся...')
