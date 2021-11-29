# Создание таблиц


## Таблица клиентов
CREATE TABLE client_ (	IDclient int primary key,
						lastname varchar(60),
                        firstname varchar(60),
                        middlename varchar(60),
                        phone varchar(15),
                        email varchar(40),
                        password_ varchar(100));


## Таблица фильмов
CREATE TABLE film (	IDfilm int primary key,
					name_ varchar(100),
					duration int,
                    age_rating varchar(10),
                    description_ longtext,
                    film_rating float,
                    start_distribution date,
                    end_distribution date);
                    
                    
## Таблица жанров
CREATE TABLE genre (	IDgenre int primary key,
						name_ varchar(50));

                        
## Таблица кинотеатров
CREATE TABLE cinema (	IDcinema int primary key,
						name_ varchar(100),
                        address varchar(255));


## Таблица залов
CREATE TABLE hall (	IDhall int primary key,
					number_ float,
					num_seats int,
                    type_ varchar(15));


## Таблица кинотеатр-зал
CREATE TABLE cinema_hall (	IDcinema int,
							IDhall int,
                            primary key(IDcinema, IDhall),
                            constraint fr1 foreign key (IDcinema) references cinema(IDcinema),
                            constraint fr2 foreign key (IDhall) references hall(IDhall));


## Таблица фильм-жанр
CREATE TABLE film_genre (	IDfilm int,
							IDgenre int,
                            primary key(IDfilm, IDgenre),
                            constraint fr3 foreign key (IDfilm) references film(IDfilm),
                            constraint fr4 foreign key (IDgenre) references genre(IDgenre));


## Таблица сеансов
CREATE TABLE session_ (		IDsession int primary key,
							IDfilm int,
                            IDhall int,
                            price int,
                            date_ date,
                            time_ time,
                            constraint fr5 foreign key (IDfilm) references film(IDfilm),
                            constraint fr6 foreign key (IDhall) references hall(IDhall));


## Таблица заказаgenre
CREATE TABLE order_ (	IDorder int primary key,
						IDclient int,
                        IDsession int,
						constraint fr7 foreign key (IDclient) references client_(IDclient),
						constraint fr8 foreign key (IDsession) references session_(IDsession));


## Таблица спецификация заказа
CREATE TABLE specorder (	IDorder int,
							seat int,
                            primary key(IDorder, seat),
							constraint fr9 foreign key (IDorder) references order_(IDorder));