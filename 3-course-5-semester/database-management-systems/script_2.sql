Select IDorder,IDcust, deadline from order_ where completed=0 and deadline>'2021-09-01';
select distinct IDcust, IDpoint from order_; #distinct - чтобы избежать повторений
select distinct goods.IDgood, NameGood from goods inner join specorder on goods.IDgood =specorder.IDgood; #join - классика 
select distinct IDgood, NameGood from goods where IDgood in  (1,2); #in - хочу вывести значаение, которое находится в списке
select distinct IDgood, NameGood from goods where IDgood in (select IDgood from specorder); # вывести таблицу в которой IDgood из specorder
select distinct IDgood, NameGood from goods where IDgood not in (select IDgood from specorder); # здесь наоборот, волшебная частичка не
select distinct goods.IDgood, NameGood,specorder.IDgood from goods left join specorder on goods.IDgood =specorder.IDgood;#вырезает заданное вторым аргументом число символов слева из строки, являющейся первым аргументом
select distinct IDgood, NameGood from goods where IDgood not in (select IDgood from specorder);
select Idorder, IDgood, (PriceSal*QuantityOrder)as itog from specorder; # Рассчитываем сумму заказа и записываем значения в отдельный солбец
select Idorder, Sum(PriceSal*QuantityOrder)as itog from specorder; # просто считается общая сумма и выводится 1й ордер
select Idorder, Sum(PriceSal*QuantityOrder)as itog from specorder group by IDorder; # здесь уже сумма по каждому заказу
select Idorder, Sum(PriceSal*QuantityOrder)as itog from specorder group by IDorder order by itog desc; # Здесь сортировка по возрастанию суммы заказа
select Idorder, Sum(PriceSal*QuantityOrder)as itog from specorder group by IDorder order by itog desc limit 1; # выводим самого крупного заказчика
select IDcust from order_ where IDorder in (select IDorder from SpecOrder group by IDorder order by  SUM(PriceSal*QuantityOrder) desc) limit 1;
select IDcust, SUM(PriceSal*QuantityOrder) as itog from order_ inner join specorder on order_.IDorder=specorder.IDorder group by IDcust order by itog desc limit 1; # выводим ID покупателя с самой большой суммой заказа
