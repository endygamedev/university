# Практика №5

# Создаём регистр
-- create table registr (Nom int auto_increment primary key, date_oper date, IDpoint int, IDorder int, IDgood int, Quantity int, sign1 char(1));

# Обновляем регистр, потому что нельзя добавить 2 собвытие на `AFTER_INSERT`, но на самом деле можно
-- update registr t1, reg_del t2 set t1.Quantity=t2.QuantityDev where t1.IDorder=t2.IDorder and t1.IDpoint=t2.IDpoint and t1.IDgood=t2.IDgood and t1.date_oper=t2.date_;