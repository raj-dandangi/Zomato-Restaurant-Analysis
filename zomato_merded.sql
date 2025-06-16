-- Restaurant-level data
CREATE TABLE zomato_restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255) NOT NULL,
    country_code INT,
    city VARCHAR(100),
    address TEXT,
    locality VARCHAR(255),
    locality_verbose TEXT,
    cuisines TEXT,
    currency VARCHAR(50),
    has_table_booking BOOLEAN,
    has_online_delivery BOOLEAN,
    is_delivering_now BOOLEAN,
    switch_to_order_menu BOOLEAN,
    price_range INT,
    votes INT,
    average_cost_for_two NUMERIC(10, 2),
    rating NUMERIC(3, 1)
);

-- Menu-level data
CREATE TABLE zomato_menu (
    URL TEXT,
    Restaurant_Name TEXT,
    Category TEXT,
    Item_Name TEXT,
    Price TEXT
);




select * from zomato_restaurants;
select * from zomato_menu;

-- showing resturent_name in both tables 
create table zomato_combined_data as
select restaurant_name
from zomato_restaurants

INTERSECT

select restaurant_name
from zomato_menu

order by restaurant_name;

-- left jointing 

select 
 r.restaurant_id,
 r.restaurant_name,
 r.city,
 r.cuisines,
 r.average_cost_for_two,
 r.rating,
 mi.category,mi.item_name,mi.price
from
 zomato_restaurants r
LEFT JOIN
 zomato_menu mi on r.restaurant_name = mi.restaurant_name


CREATE TABLE zomato_combined_data AS
SELECT
    r.restaurant_id,
    r.restaurant_name,
    r.country_code,
    r.city,
    r.address,
    r.locality,
    r.locality_verbose,
    r.cuisines,
    r.currency,
    r.has_table_booking,
    r.has_online_delivery,
    r.is_delivering_now,
    r.switch_to_order_menu,
    r.price_range,
    r.votes,
    r.average_cost_for_two,
    r.rating,
    mi.url AS menu_url,         -- Renamed to avoid confusion if URL is also in restaurant data
    mi.category AS menu_category, -- Renamed for clarity
    mi.item_name,
    mi.price AS menu_price      -- Renamed for clarity
from 
 zomato_restaurants r
left join
 zomato_menu mi on r.restaurant_name = mi.restaurant_name;


select * from zomato_combined_data


select * from zomato_combined_data
where cuisines is null;





