select * from dataset_olympics;


---1. Write a sql query to find in which sport or event india has won the highest medals?


select Event, count(Medal) as medal_cnt
from dataset_olympics
where Team = 'India' and Medal is not null
group by Event
order by medal_cnt desc;


---2. Identify the sport or event which was played most consecutively in the summer olympics games.


select Sport,Event, count(Event) as event_cnt
from dataset_olympics
where Season = 'Summer'
group by Sport,Event
order by event_cnt desc;


---3. Write a sql query to fetch the details of all the countries which 
---   have won most number of silver and bronze medals and at least one gold medal.

select Team, 
count(case when Medal = 'Silver' then 1 end) as silver_cnt,
count(case when Medal = 'Bronze' then 1 end) as bronze_cnt,
count(case when Medal = 'Gold' then 1 end) as gold_cnt
from dataset_olympics
group by Team
having count(case when Medal = 'Gold' then 1 end) > 0
order by silver_cnt desc,bronze_cnt desc;


--- 4. Which player has won maximum number of gold.


select Name, 
count(case when Medal = 'Gold' then 1 else 0 end) as gold_cnt
from dataset_olympics
group by Name
order by gold_cnt desc;



---5. Which sport has maximum events.

select Sport, count(Event) as event_cnt 
from dataset_olympics
group by Sport
order by event_cnt desc;


--- 6. Which Year has maximum event.

select Year, count(Event) as Event_cnt
from dataset_olympics
group by Year
order by Event_cnt desc;




