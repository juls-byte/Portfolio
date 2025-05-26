-- Создать таблицу fine
CREATE TABLE fine (
  fine_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30),
  number_plate VARCHAR(6),
  violation VARCHAR(50),
  sum_fine DECIMAL(8, 2),
  date_violation DATE,
  date_payment DATE  
);

 -- Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, в соответствии с данными из таблицы traffic_violation. При этом суммы заносить только в пустые поля столбца  sum_fine.
UPDATE fine AS f, traffic_violation AS tv
SET f.sum_fine = tv.sum_fine
WHERE f.sum_fine IS NULL AND f.violation = tv.violation;
SELECT * FROM fine;    

-- Вывести фамилию, номер машины и нарушение только для тех водителей, которые на одной машине нарушили одно и то же правило   два и более раз. При этом учитывать все нарушения, независимо от того оплачены они или нет. Информацию отсортировать в алфавитном порядке, сначала по фамилии водителя, потом по номеру машины и, наконец, по нарушению.
SELECT name, number_plate, violation
FROM fine
GROUP BY name, number_plate, violation
HAVING count(*) >= 2
ORDER BY name ASC, number_plate ASC, violation ASC;

-- Удалить из таблицы supply книги тех авторов, общее количество экземпляров книг которых в таблице book превышает 10
DELETE FROM supply
WHERE author IN (
    SELECT author
    FROM book
    GROUP BY author 
    HAVING SUM(amount) > 10
    );
