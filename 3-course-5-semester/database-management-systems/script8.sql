# Практика №8
# Необходимо по каким-то признакам классифицировать клиентов по их дисциплинированности
# Делают заказы, есть заказы, которые забирают все заказы, есть клиенты, которые забирают часть заказов, есть клиенты, которые не забирают заказы
# По каждому клиенту сколько заказов забирал completed = 1, и дальше сколько заказывал вообще

select IDcust, count(IDcust), sum(completed) from order_ group by IDcust;
# select IDcust, count(IDcust) from order_ where completed=1 group by IDcust;
# получили/заказали

# Задание
# добавляются новые пользователи INSERT
# вводим почту и если у нас уже есть эта почта, то мы должны выдовать ошибку
# сколько до вставки 
# дата обновления время обновления какой клиент itog_last (старое-новое значение) проценты, новые старые

# create table proba2 (dateUp date, timeUp time, ID int, old_itog int, new_itog int, old_per float, new_per float);