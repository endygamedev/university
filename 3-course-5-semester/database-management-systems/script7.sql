# Занятие №7

# Создаём колонку
-- alter table goods add column status_good text;

# Тестовый запрос
-- select IDgood, sum(QuantityOrder) as itog from specorder group by IDgood;

# Есть заказ и человеку нужно понять доставлен заказ или нет и какой товар был доставлен в пункт доставки
# По тем заказам, которые не были забраны (completed = 0) понять что уже доставлено
# Какие заказы полностью или частично доставлены и их можно забрать
# order_ добавляется поле которое отражает готовность заказов
# заказ может быть доставлен полностью (Full), - частично (Part),
# specdev 
# Обновляется поле в заказе - полность или частично

-- alter table order_ add column deliv_order text;

select IDorder, count(IDorder) as count_order from specorder group by IDorder;
select IDorder, count(IDorder) as count_dev from specdev group by IDorder;

-- select q1.IDorder, count_order, if(count_dev is null, 0, count_dev) as smart_count_dev from
-- (select IDorder, count(IDorder) as count_order from specorder group by IDorder) as q1 left join
-- (select IDorder, count(IDorder) as count_dev from specdev group by IDorder) as q2
-- on q1.IDorder=q2.IDorder;

-- select IDorder, if(count_order-smart_count_dev < 0, 0, count_order-smart_count_dev) as itog from dev_order1;

-- order_alter table order_ add column deliv_order text;