# Практика №3

# Задание №1
# Товары, которые вообще больше всего поставлялись
-- select IDgood, SUM(QuantityDev) as quantity from SpecDev group by IDgood order by quantity desc limit 2;
# Товары, которые не заказывали
-- select distinct IDgood from goods where IDgood not in (select IDgood from SpecDev);

# Товары, которые остались на пункте доставки
-- select IDgood, IDpoint, SUM(QuantityDev) as sup from deliv join SpecDev on SpecDev.IDdev=deliv.IDdev group by IDgood, IDpoint;
-- select IDgood, IDpoint, SUM(QuantityOrder) as itog from order_ join SpecOrder on order_.IDorder=SpecOrder.IDorder where completed='1' group by IDgood, IDpoint;

# select q1.IDgood, q1.IDpoint, (sup-if(itog is null, 0, itog)) as balance from
# 	(select IDgood, IDpoint, SUM(QuantityDev) as sup from deliv join SpecDev on SpecDev.IDdev=deliv.IDdev group by IDgood, IDpoint) as q1 left join
# 	(select IDgood, IDpoint, SUM(QuantityOrder) as itog from order_ join SpecOrder on order_.IDorder=SpecOrder.IDorder where completed='1' group by IDgood, IDpoint) as q2
# 	on (q1.IDgood=q2.IDgood and q1.IDpoint=q2.IDpoint);

# Добавляем дату (тут нет дат)
-- select IDgood, IDpoint, month(dateqqq) as monDev, SUM(QuantityDev) as sup from deliv join SpecDev on SpecDev.IDdev=deliv.IDdev group by IDgood, IDpoint;
-- create table month1 (IDmon int primary key)