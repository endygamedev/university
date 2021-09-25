update order_ t1,(select IDorder, Sum(PriceSal*QuantityOrder) as itog from specorder group by IDorder) t2 set t1.summa=t2.itog where t1.IDorder=t2.IDorder; # обновляем таблицу
select IDorder, IDcust from order_ where completed = 0; # список недоставленных заказлв
select IDorder, IDcust from order_ where completed = 0 and IDorder not in (select IDorder from specdev); # те заказы, которые были не получены и по ним не было доставки
select IDorder, IDcust, deadline from order_ where completed = 0 and IDorder not in (select IDorder from specdev); # c указанием дэдлайна для "оживляжа"
select IDorder, IDcust, deadline from order_ where completed = 0 and IDorder in (select IDorder from specdev);# те заказы, которые были не получены и по ним была доставка 
select order_.IDorder, IDcust, deadline, specdev.IDdev from order_ left join specdev on order_.IDorder=specdev.IDorder where completed = 0;# left join потому что нас интересует то, что слева; получили незабранные заказы, но для каких-то заказов появляется номер доставки, бывает так, что заказ 1, а доставок несколько 
select distinct order_.IDorder, IDcust, deadline, specdev.IDdev from order_ left join specdev on order_.IDorder=specdev.IDorder where completed = 0; # здесь без повторений 
select distinct order_.IDorder, IDcust, deadline, specdev.IDdev, if (specdev.IDdev is null,"no","yes") as delivered from order_ left join specdev on order_.IDorder=specdev.IDorder where completed = 0; # здесь проверяем условие, удовлетворяется, пишем no, а иначе yes 
select distinct order_.IDorder, IDcust, deadline, if (specdev.IDdev is null,"no","yes") as delivered from order_ left join specdev on order_.IDorder=specdev.IDorder where completed = 0;
select distinct order_.IDorder, IDcust, deadline, specdev.IDdev, if (specdev.IDdev is null,"no","yes") as delivered from order_ left join specdev on order_.IDorder=specdev.IDorder where completed = 0 order by deadline; # отсортировали по дэдлайну 
# фраза пары: "это скрипт, но это не скрипт, но по сути это скрипт"
select q1.IDgood,  orderSum, delivSum, (orderSum-delivSum) as otk1 from
(select IDgood, Sum(QuantityOrder) as orderSum from specorder group by IDgood) as q1 
inner join 
(select IDgood, Sum(QuantityDev) as delivSum from specdev group by IDgood) as q2 
on q1.IDgood=q2.IDgood;
# orderSum общее кол-во закзазов
# delivSum общее кол-во доставок товара
select q1.IDgood,  orderSum, delivSum, (orderSum-delivSum) as otk1 from
(select IDgood, Sum(QuantityOrder) as orderSum from specorder group by IDgood) as q1 
left join 
(select IDgood, Sum(QuantityDev) as delivSum from specdev group by IDgood) as q2 
on q1.IDgood=q2.IDgood; # считаем отклонение общей поставки к общей доставке товара
select q1.IDgood,  orderSum, delivSum, (orderSum-delivSum) as otk1 from
(select IDgood, Sum(QuantityOrder) as orderSum from specorder group by IDgood) as q1 
right join 
(select IDgood, Sum(QuantityDev) as delivSum from specdev group by IDgood) as q2 
on q1.IDgood=q2.IDgood;
select goods.IDgood, NameGood, orderSum, delivSum, (if(orderSum is null,0,orderSum)-if(delivSum is null,0,delivSum)) as otkl from
(select IDgood, sum(QuantityOrder) as orderSum from specorder group by IDgood) as q1
right join
(goods left join (select IDgood, sum(QuantityDev) as delivSum from specdev group by IDgood) as q2 on goods.IDgood=q2.IDgood)
on goods.IDgood=q1.IDgood;
