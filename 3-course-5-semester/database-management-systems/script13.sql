create table basket (	IDcust int, IDgood int, DateDel date, Quantity int,
						primary key(IDcust, IDgood, DateDel),
						constraint fr211 foreign key (IDcust) references customer(IDcust),
                        constraint fr212 foreign key (IDgood) references goods(IDgood));
                        

select q1.IDgood, itog1-if(itog2 is NULL, 0, itog2) as InStock from
(select IDgood, SUM(QuantitySupply) as itog1 from supply group by IDgood) as q1
left join
(select IDgood, SUM(QuantityDev) as itog2 from specdev group by IDgood) as q2
on q1.IDgood=q2.IDgood;