# 1, 49, 478
select * from order_ where IDsession = 242;


select distinct num_seats into num from hall join
(select order_.IDorder, session_.IDsession, IDhall from order_ join session_ on order_.IDsession=session_.IDsession) as q1
on q1.IDhall=hall.IDhall where q1.IDorder=IDord;


select order_.IDorder, session_.IDsession, IDhall from order_ join session_ on order_.IDsession=session_.IDsession;


select order_.IDsession, IDfilm from order_ join session_ on order_.IDsession=session_.IDsession;

select IDfilm, COUNT(order_.IDsession) as count_orders from order_ right join session_ on order_.IDsession=session_.IDsession where date_ between '2021-11-27' and '2021-11-27' group by IDfilm;


select order_.IDorder, order_.IDsession, COUNT(seat) as countSeats from order_ join specorder on order_.IDorder=specorder.IDorder group by IDorder, IDsession;


select order_.IDorder, IDsession, countSeats from order_ join order_countSeats on order_.IDorder=order_countSeats.IDorder;

select IDfilm, COUNT(order_countSeats.IDsession) as ordersCount from order_countSeats
right join session_ on order_countSeats.IDsession=session_.IDsession where date_ between '2021-11-28' and '2021-11-28' group by IDfilm;

select order_.IDorder, order_.IDsession, COUNT(seat) as countSeats from order_ join specorder on order_.IDorder=specorder.IDorder group by IDorder, IDsession;


select IDfilm, SUM(sessionSeats*price) as ticketsSold from session_ left join
(select IDsession, SUM(countSeats) as sessionSeats from order_countSeats group by IDsession) as q1
on q1.IDsession=session_.IDsession where date_ between '2021-11-28' and '2021-11-28' group by IDfilm;

select session_.IDsession, session_.IDfilm, price, date_, name_ from session_ join film on session_.IDfilm=film.IDfilm;


select IDfilm, name_, SUM(sessionSeats*price) as ticketsSold from 
(select session_.IDsession, session_.IDfilm, price, date_, name_ from session_ join film on session_.IDfilm=film.IDfilm) as q1 left join
(select IDsession, SUM(countSeats) as sessionSeats from order_countSeats group by IDsession) as q2
on q2.IDsession=q1.IDsession where date_ between '2021-11-28' and '2021-11-28' group by IDfilm order by ticketsSold desc limit 5;


alter table film add column gross int;

select IDfilm, SUM(sessionSeats*price) as ticketsSold from session_ left join
(select IDsession, SUM(countSeats) as sessionSeats from order_countSeats group by IDsession) as q2
on q2.IDsession=session_.IDsession group by IDfilm;


select IDhall, COUNT(IDhall) as countSession from session_ group by IDhall;

alter table hall add column workload float;


# количество того сколько раз занимался зал
select IDhall, COUNT(IDhall) as countSession from session_ group by IDhall;

# количество мест всего в залах
select session_.IDhall, COUNT(session_.IDhall)*num_seats as countSession from session_ join hall on session_.IDhall=hall.IDhall group by IDhall;

# занятые места
select IDhall, SUM(countSeats) as occupiedPlaces  from session_ join order_countSeats on session_.IDsession=order_countSeats.IDsession group by IDhall;


# загруженность зала за всё время
select q1.IDhall, occupiedPlaces/countSession*100 as workload from
(select session_.IDhall, COUNT(session_.IDhall)*num_seats as countSession from session_ join hall on session_.IDhall=hall.IDhall group by IDhall) as q1
join
(select IDhall, SUM(countSeats) as occupiedPlaces from session_ join order_countSeats on session_.IDsession=order_countSeats.IDsession group by IDhall) as q2
on q1.IDhall=q2.IDhall;


alter table hall modify workload float;


select film.IDfilm, name_, name_genre from film join
(select IDfilm, name_ as name_genre from genre join film_genre on genre.IDgenre=film_genre.IDgenre where name_='фэнтези') as q1
on film.IDfilm=q1.IDfilm;

select film.IDfilm, name_, name_genre from film join
(select IDfilm, name_ as name_genre from genre join film_genre on genre.IDgenre=film_genre.IDgenre where name_='фэнтези') as q1
on film.IDfilm=q1.IDfilm;


select IDsession, session_.IDfilm, name_, IDhall, price, date_, time_ from session_ join film on session_.IDfilm=film.IDfilm
where session_.IDfilm in (select film.IDfilm from film join
(select IDfilm, name_ as name_genre from genre join film_genre on genre.IDgenre=film_genre.IDgenre where name_='драма') as q1
on film.IDfilm=q1.IDfilm)
and date_ between '2021-11-27' and '2021-11-27';

# '2021-11-27'
select IDsession, IDfilm, IDcinema, session_.IDhall, price, date_, time_ from session_ join 
(select IDhall, cinema.IDcinema, name_ from cinema join cinema_hall on cinema.IDcinema=cinema_hall.IDcinema where cinema.IDcinema=1) as q1
on session_.IDhall=q1.IDhall where time_>'16:00';


select IDsession, IDcinema, IDgenre from (session_ join film_genre on session_.IDfilm=film_genre.IDgenre) join 
(select IDhall, cinema.IDcinema, name_ from cinema join cinema_hall on cinema.IDcinema=cinema_hall.IDcinema where cinema.IDcinema=1) as q1
on session_.IDhall=q1.IDhall where IDgenre=1;


call cinema.test(1, null, '15:00', 1);


select IDsession, SUM(countSeats) as sessionSeats from order_countSeats group by IDsession;


select IDfilm, SUM(q1.sessionSeats*price) as gross from session_ left join
(select IDsession, SUM(countSeats) as sessionSeats from order_countSeats group by IDsession) as q1
on q1.IDsession=session_.IDsession group by IDfilm;


select film.IDfilm from session_ right join film on session_.IDfilm=film.IDfilm;

select film.IDfilm, SUM(q1.sessionSeats*price) as gross from (session_ right join film on session_.IDfilm=film.IDfilm) right join
(select IDsession, SUM(countSeats) as sessionSeats from order_countSeats group by IDsession) as q1
on q1.IDsession=session_.IDsession group by film.IDfilm;




call cinema.sessions_by_categories(2, '2021-11-27', null, null);



