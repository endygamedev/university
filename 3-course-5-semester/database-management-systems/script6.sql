# Практика №6

-- create table proba (date_op date, IDpoint int, IDorder int, IDgood int, Quantity int, sign1 char(1));
-- insert into delivery1.proba (date_op, IDpoint, IDorder, IDgood, Quantity, sign1) select dateOrder, IDpoint1, IDorder1, IDgood1, QuantityOrder, '1' from reg_or_1;
-- update registr t1, proba t2 set t1.Quantity=t2.Quantity where t1.date_op=t2.date_op and t1.IDorder=t2.IDorder and t1.IDpoint=t2.IDpoint and t1.IDgood=t2.IDgood;
