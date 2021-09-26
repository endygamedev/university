# Практика №2. Базовые запросы.

-- alter table deliv add column date_ date; # добавление колонки
-- alter table deliv drop column dateqqq; # удаление колонки

-- select IDorder, IDcust, deadline from order_ where completed=1 # выполненные заказы
-- select IDorder, IDcust, deadline from order_ where completed=0 and deadline>'2021-09-01'; # невыполненные заказы с 1 сентября
-- select IDcust from order_; # выводим все записи по полю IDcust
-- select distinct IDcust from order_; # смотрим все IDcust из order_
-- select distinct IDcust, IDpoint from order_; # выводим только уникальные записи (уникальность из двух значений)
-- select distinct IDgood from SpecOrder; # товары которые заказывали

-- select distinct goods.IDgood, NameGoods from goods inner join SpecOrder on goods.IDgood=SpecOrder.IDgood; # вывели имена товаров, которые когда-либо заказывали (1 вариант)
-- select distinct IDgood, NameGoods from goods where IDgood in (select IDgood from SpecOrder); # интересуют имя товара и id которые заказывали (2 вариант)

-- select goods.IDgood, NameGoods, SpecOrder.IDgood from goods left join SpecOrder on goods.IDgood=SpecOrder.IDgood where SpecOrder.IDgood is null; # вывели имена товаров, которые когда-либо заказывали (1 вариант)
-- select distinct  IDgood, NameGoods from goods where IDgood not in (select IDgood from SpecOrder); # интересуют имя товара и id который не заказывали (2 вариант)
-- select IDorder, SUM(PriceSal*QuantityOrder) as itog from SpecOrder group by IDorder; # сумма заказа (цена 1 товара * кол-во товара)
-- select IDorder, SUM(PriceSal*QuantityOrder) as itog from SpecOrder group by IDorder; # сумма заказа (цена 1 товара * кол-во товара)
-- select IDorder, SUM(PriceSal*QuantityOrder) as itog from SpecOrder group by IDorder order by itog desc; # сумма заказа (цена 1 товара * кол-во товара) + сортировка по убыванию
-- select IDorder, SUM(PriceSal*QuantityOrder) as itog from SpecOrder group by IDorder order by itog desc limit 1; # сумма заказа (цена 1 товара * кол-во товара) + смотрим на 1 элемент


# Задание 1.
# Посмотрим одного клиента, который нам делает заказ на самую большую сумму.
-- select IDcust, SUM(PriceSal*QuantityOrder) as itog from order_ inner join SpecOrder on order_.IDorder=SpecOrder.IDorder group by IDcust order by itog desc limit 1;


# Обновляем	 таблицу
-- update order_ t1, (select IDorder, SUM(PriceSal*QuantityOrder) as itog from SpecOrder group by IDorder order by itog) t2 set t1.summa=t2.itog where t1.IDorder=t2.IDorder; 

-- select IDorder, IDcust from order_ where completed = 0; # список недоставленных заказлв
-- select IDorder, IDcust from order_ where completed = 0 and IDorder not in (select IDorder from SpecDev); # заказы, которые не были получены и по ним не было доставки
-- select IDorder, IDcust, deadline from order_ where completed = 0 and IDorder not in (select IDorder from SpecDev); # заказы, которые не были получены и по ним не было доставки c указанием дэдлайна для "оживляжа"
-- select order_.IDorder, IDcust, deadline, SpecDev.IDdev from order_ left join SpecDev on order_.IDorder=SpecDev.IDorder where completed = 0; # left join потому что нас интересует то, что слева; получили незабранные заказы, но для каких-то заказов появляется номер доставки, бывает так, что заказ 1, а доставок несколько 
-- select distinct order_.IDorder, IDcust, deadline, SpecDev.IDdev from order_ left join SpecDev on order_.IDorder=SpecDev.IDorder where completed = 0; # здесь без повторений 
-- select distinct order_.IDorder, IDcust, deadline, SpecDev.IDdev, if (SpecDev.IDdev is null, "no", "yes") as delivered from order_ left join SpecDev on order_.IDorder=SpecDev.IDorder where completed = 0; # здесь проверяем условие, удовлетворяется, пишем 'no', а иначе 'yes'
-- select distinct order_.IDorder, IDcust, deadline, if (SpecDev.IDdev is null, "no", "yes") as delivered from order_ left join SpecDev on order_.IDorder=SpecDev.IDorder where completed = 0;
-- select distinct order_.IDorder, IDcust, deadline, SpecDev.IDdev, if (SpecDev.IDdev is null, "no", "yes") as delivered from order_ left join SpecDev on order_.IDorder=SpecDev.IDorder where completed = 0 order by deadline; # отсортировали по дэдлайну 


# Отклонение между количеством заказов и количеством доставок товара
# orderSum общее кол-во закзазов товара
# delivSum общее кол-во доставок товара
-- select q1.IDgood,  orderSum, delivSum, (orderSum-delivSum) as otk1
-- 	from (select IDgood, Sum(QuantityOrder) as orderSum from SpecOrder group by IDgood) as q1 
-- 	inner join 
--  (select IDgood, Sum(QuantityDev) as delivSum from SpecDev group by IDgood) as q2 
-- 	on q1.IDgood=q2.IDgood;

# Подсчёт отклонения общей поставки к общей доставке товара
-- select q1.IDgood,  orderSum, delivSum, (orderSum-delivSum) as otk1 from
-- 	(select IDgood, Sum(QuantityOrder) as orderSum from SpecOrder group by IDgood) as q1 
-- 	left join 
-- 	(select IDgood, Sum(QuantityDev) as delivSum from SpecDev group by IDgood) as q2 
-- 	on q1.IDgood=q2.IDgood;
    
-- select q1.IDgood,  orderSum, delivSum, (orderSum-delivSum) as otk1 from
-- 	(select IDgood, Sum(QuantityOrder) as orderSum from SpecOrder group by IDgood) as q1 
-- 	right join 
-- 	(select IDgood, Sum(QuantityDev) as delivSum from SpecDev group by IDgood) as q2 
-- 	on q1.IDgood=q2.IDgood;

-- select goods.IDgood, NameGoods, orderSum, delivSum, (if (orderSum is null, 0, orderSum) - if (delivSum is null, 0, delivSum)) as otkl from
-- 	(select IDgood, sum(QuantityOrder) as orderSum from SpecOrder group by IDgood) as q1
-- 	right join
-- 	(goods left join (select IDgood, sum(QuantityDev) as delivSum from SpecDev group by IDgood) as q2 on goods.IDgood=q2.IDgood)
-- 	on goods.IDgood=q1.IDgood;
