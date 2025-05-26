--   Вывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра, цену и количество экземпляров книг), написанных в самых популярных жанрах, в отсортированном в алфавитном порядке по названию книг виде. Самым популярным считать жанр, общее количество экземпляров книг которого на складе максимально.
SELECT title, name_author, name_genre, price, amount
FROM
    author 
    INNER JOIN book ON author.author_id = book.author_id
    INNER JOIN genre ON book.genre_id = genre.genre_id
WHERE genre.genre_id IN
         (
          SELECT query_in_1.genre_id
          FROM 
              ( 
                SELECT genre_id, SUM(amount) AS sum_amount
                FROM book
                GROUP BY genre_id
               )query_in_1
          INNER JOIN 
              ( 
                SELECT genre_id, SUM(amount) AS sum_amount
                FROM book
                GROUP BY genre_id
                ORDER BY sum_amount DESC
                LIMIT 1
               ) query_in_2
          ON query_in_1.sum_amount= query_in_2.sum_amount
         )
         GROUP BY title, name_author, name_genre, price, amount
         ORDER BY title ASC

-- Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить название книг, их автора, цену, количество заказанных книг и  стоимость. Последний столбец назвать Стоимость. Информацию в таблицу занести в отсортированном по названиям книг виде.
CREATE TABLE buy_pay AS
SELECT title, name_author, price, buy_book.amount, (price * buy_book.amount) AS Стоимость
FROM
author 
INNER JOIN book USING(author_id)
INNER JOIN buy_book USING(book_id)
WHERE buy_book.buy_id = 5
GROUP BY title, name_author, price, buy_book.amount, Стоимость
ORDER BY title;
SELECT * FROM buy_pay;

-- Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров и их стоимости за 2020 и 2019 год . За 2020 год проданными считать те экземпляры, которые уже оплачены. Вычисляемые столбцы назвать Количество и Сумма. Информацию отсортировать по убыванию стоимости.
SELECT title, SUM(query_in.Количество) AS 'Количество', SUM(query_in.Сумма) AS 'Сумма'
FROM
(SELECT book.title, SUM(buy_book.amount) AS 'Количество', SUM(buy_book.amount * book.price) AS 'Сумма'
FROM
buy_book
         INNER JOIN book USING (book_id)
         INNER JOIN buy USING(buy_id)
         INNER JOIN buy_step USING(buy_id)
         INNER JOIN step USING(step_id)
 WHERE name_step = 'Оплата' AND date_step_end IS NOT NULL 
GROUP BY book.title, buy_book.amount, buy_book.amount * book.price
UNION ALL
SELECT book.title, SUM(buy_archive.amount) AS 'Количество', SUM(buy_archive.amount * buy_archive.price) AS 'Сумма'
FROM
buy_archive
INNER JOIN book USING(book_id)
GROUP BY book.title, buy_archive.amount, buy_archive.amount * buy_archive.price) query_in
GROUP BY query_in.title
ORDER BY Сумма DESC
