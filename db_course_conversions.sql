– Calculating Free-to-Paid Conversion Rate with SQL Project
--
-- Dumping events for database 'db_course_conversions'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-30 16:46:38

-- Getting names of all tables 
show tables;

select * from student_purchases;

-- Conversion Rate Calculation
 
select count(*)/(
select count(distinct student_id) from student_engagement)*100 as conversion_rate from
(select *,datediff(first_watch,reg_date) as reg_watch_diff,
	datediff(first_watch,first_purchase) as first_watch_purchase_diff 
from
(select e.student_id as id,i.date_registered as reg_date,
	min(e.date_watched) as first_watch,min(p.date_purchased) as first_purchase
from student_engagement e
join student_info i
on i.student_id=e.student_id
left join student_purchases p
on p.student_id=e.student_id
group by 1,2) t) t2
where first_watch_purchase_diff is not null;

select count(distinct student_id) from student_purchases;


select count(distinct student_id) from student_engagement;

Conversion Rate - 13.5%

____________________________________________________________________________

-- Average Duration from Registration to First Engagement in Days Calculation

select sum(reg_watch_diff)/(select count(distinct student_id) from student_engagement) as av_reg_watch from
(select *,datediff(first_watch,reg_date) as reg_watch_diff,
	datediff(first_watch,first_purchase) as first_watch_purchase_diff 
from
(select e.student_id as id,i.date_registered as reg_date,
	min(e.date_watched) as first_watch,min(p.date_purchased) as first_purchase
from student_engagement e
join student_info i
on i.student_id=e.student_id
left join student_purchases p
on p.student_id=e.student_id
group by 1,2) t) t2;


select count(distinct student_id) from student_purchases;

Answer- 3.9 Days
____________________________________________________________________________

-- Average Duration to First Watch to First Purchase in Days Calculation
 
select sum(first_watch_purchase_diff)/(select count(distinct student_id) from student_purchases) as av_watch_purch from
(select *,datediff(first_watch,reg_date) as reg_watch_diff,
	datediff(first_purchase,first_watch) as first_watch_purchase_diff 
from
(select e.student_id as id,i.date_registered as reg_date,
	min(e.date_watched) as first_watch,min(p.date_purchased) as first_purchase
from student_engagement e
join student_info i
on i.student_id=e.student_id
left join student_purchases p
on p.student_id=e.student_id
group by 1,2) t) t2;

Answer-16.2 Days


Thank You
