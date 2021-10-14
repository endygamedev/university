# Практика №4

# Переименовываем поле в таблице
-- set foreign_key_checks=0;
-- alter table supply change IDpoint IDstore int;
-- set foreign_key_checks=1;


# Добавляем поля
-- alter table customer add column sum_last int, add per_s float;

# Создаём таблицу
-- create table per_cust(Num int primary key, Summa_cust int, Per_red float);

# Сумма всех заказов клиента
-- select order_.IDcust, SUM(SpecOrder.PriceSal * SpecOrder.QuantityOrder) as summma from SpecOrder join order_ on order_.IDorder=SpecOrder.IDorder group by order_.IDcust;

# Процент который мы даём клиенту по сумме
select IDcust, sum_last, MAX(per_red) as perr from customer, per_cust where per_cust.Summa_cust <= customer.sum_last group by IDcust, sum_last;