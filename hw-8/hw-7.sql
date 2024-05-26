
-- Создать таблицу друзей с использованием механизма валидации данных в SQL

CREATE TABLE friendship (
	id int primary key auto_increment,
	created_at timestamp not null default current_timestamp,
 user_id int not null,
 friend_id int not null,
  
  foreign key(user_id) references users(id),
  foreign key(friend_id) references users(id)
 );

--  Добавить в таблицу друзей несколько записей

INSERT INTO friendship (user_id, friend_id)
VALUES
	(1, 2),
	(2, 1)

-- Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)

SELECT accounts.currency, 
SUM(txs.amount) AS total_amount
FROM txs
JOIN accounts on txs.sender_account_id = accounts.id
GROUP BY currency
ORDER BY currency