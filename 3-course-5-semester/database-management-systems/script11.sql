# select min(DateOrder) from order_ where IDcust=3;
select IDcust, NameCus, Date_f(IDcust) from customer;


# есть регистр цен, обновляем цены с датой: дата, товар, цена


# сколько клиентов прошло через заданный пункт
# select count(IDOrder) from order_ where IDpoint=2;
select IDpoint, adress, Point_order_count(IDpoint) as order_count from point_;


# Регистр учёта цен
# create table PriceDate (IDgood int,
#						DatePrice date,
#						Price int,
#						primary key (IDgood, DatePrice),
#						constraint fk123 foreign key (IDgood) references goods(IDgood));
                        


select order_.IDorder, IDgood, price_date(IDgood, DateOrder) from order_ join specorder on order_.IDorder=specorder.IDorder;
select IDgood, NameGood, price_date(IDgood, current_date()) from goods;