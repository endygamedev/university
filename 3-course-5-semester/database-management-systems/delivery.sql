create table customer(IDcust int primary key, NameCus tinytext, login char(20));
create table point_ (IDpoint int primary key, adress text);
create table order_ (IDorder int primary key, IDcust int, IDpoint int, DateOrder date, deadline date, completed char(1), summa int,
	constraint fr1 foreign key (IDcust) references customer(IDcust),
    constraint fr2 foreign key (IDpoint) references point_(IDpoint));
create table goods (IDgood int primary key, NameGoods char(10), description_ text, price int);
create table SpecOrder (IDorder int, IDgood int, PriceSal int, QuntityOrder int, primary key(IDorder,IDgood),
	constraint fr3 foreign key (IDgood) references goods(IDgood),
    constraint fr4 foreign key (IDorder) references order_(IDorder));
create table store (IDstore int primary key, square int, descrip text);
create table deliv (IDdev int primary key, IDpoint int);
alter table deliv add constraint fr5 foreign key (IDpoint) references point_(IDpoint);
alter table deliv add column IDstore int;
alter table deliv add constraint fr6 foreign key (IDstore) references store(IDstore);
create table supply (IDpoint int, IDgood int, DateSup date, QuantitySupply int, primary key(IDpoint, IDgood, DateSup),
	constraint fr7 foreign key (IDpoint) references point_(IDpoint),
	constraint fr8 foreign key (IDgood) references goods(IDgood));
create table SpecDev (IDdev int, IDorder int, IDgood int, QuantityDev int, primary key(IDdev, IDorder, IDgood),
	constraint fr9 foreign key (IDorder) references order_(IDorder),
	constraint fr10 foreign key (IDgood) references goods(IDgood));
alter table SpecDev add constraint fr11 foreign key (IDdev) references deliv(IDdev);
