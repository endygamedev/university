# 1, 49, 478
select * from order_ where IDsession = 242;


select distinct num_seats into num from hall join
(select order_.IDorder, session_.IDsession, IDhall from order_ join session_ on order_.IDsession=session_.IDsession) as q1
on q1.IDhall=hall.IDhall where q1.IDorder=IDord;


select order_.IDorder, session_.IDsession, IDhall from order_ join session_ on order_.IDsession=session_.IDsession