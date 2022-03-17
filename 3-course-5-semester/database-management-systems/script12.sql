set global event_scheduler = on;	# включаем глобальную переменную которая отвечает за события

create table event_mes (ID int primary key auto_increment, message text, Date_time datetime);	# создаём новую таблицу

show events from delivery;	# просмотр событий

# создаём новое событие
create event event_1
on schedule every 1 minute 	# интервал события
starts current_timestamp	# начало события
ends current_timestamp + interval 5 minute	# конец события
do	# что делам
insert into event_mes (message, Date_time)
values ("Проверяю", NOW());


# создаём новое событие (с процедурой и действием)
DELIMITER $$
use delivery $$
create event event_2
on schedule every 5 minute
starts current_timestamp
ends current_timestamp + interval 30 minute
do begin
call delivery.event_order_proc();
insert into event_mes (message, Date_time)
values ("обноляю тебе заказы", NOW());
end $$
DELIMITER ;

drop event event_1;	# удаление события