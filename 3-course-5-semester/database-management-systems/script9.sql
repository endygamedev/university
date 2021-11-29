# Практика №9

# какие-то пункты доставки нужно закрыть
# количество заказов в каждом пункте и сумма заказов по кажому пункту
# в каком классе она находится
# min на 15% и по кол-во заказов и сумме заказов на каждом пункте

# create table pointStatus (DateAn date, IDpoint int, CountPoint int, SumPoint int, status1 char(7));
select q1.IDpoint, q1.countPoint, q2.sumPoint from 
((select IDpoint, COUNT(IDpoint) as countPoint from order_ group by IDpoint) as q1
join (select IDpoint, SUM(IDpoint) as sumPoint from order_ group by IDpoint) as q2
on q1.IDpoint=q2.IDpoint);


select IDpoint, COUNT(IDpoint) as countPoint, SUM(IDpoint) as sumPoint from order_ group by IDpoint;

# 10% от среднего, если ниже -- bad