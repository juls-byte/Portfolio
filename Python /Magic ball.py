from tkinter import *
import random
from tkinter import messagebox

root = Tk()
root.title("Магический шар")
root.geometry("600x450")
root.configure(bg="#4b10ec")
root.resizable(width=False, height=False)

# варианты ответов шара
answers = ['Бесспорно', 'Мне кажется - да', 'Пока неясно, попробуй снова', 'Даже не думай', 'Предрешено',
           'Вероятнее всего','Спроси позже', 'Мой ответ - нет', 'Никаких сомнений', 'Хорошие перспективы',
           'Лучше не рассказывать', 'По моим данным - нет', 'Определённо да', 'Знаки говорят - да',
           'Сейчас нельзя предсказать', 'Перспективы не очень хорошие', 'Можешь быть уверен в этом',
           'Да', 'Сконцентрируйся и спроси опять', 'Весьма сомнительно']

# случайное число для выбора предсказания по индексу
def show_message():
    messagebox.showinfo("Ответ", answers[random.randint(0, 20)])
    question_entry.delete("0", END)

# заголовок
label_text = Label(root, text='Задай вопрос', font=("Helvetica", 25, 'bold'))
label_text.pack()
label_text.config(bg="#f3ec90")

# ячейка для вопроса
question = StringVar()
question_entry = Entry(textvariable=question, width=60)
question_entry.place(relx=.5, rely=.25, anchor="c")

# кнопка для вывода ответа
message_button = Button(text="Узнать ответ", font=("Helvetica", 13, "bold"), command=show_message)
message_button.place(relx=.5, rely=.5, anchor="c")
message_button.config(padx=10, pady=5)
message_button.config(bg="#4CAF50", fg="white")


root.mainloop()
