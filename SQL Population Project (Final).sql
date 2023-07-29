use population ;

select * from population;

select * from population_2;

 -- Count Number of Rows in Dataset --
 select count(*) from population;       #640
  select count(*) from population_2;    #640
  
  -- Get data from Jharkhand and Bihar --
  
  select * from population where State in ("Jharkhand" , "Bihar") ;
  
  
select * from population_1 ;
select * from population_2 ;


 -- Count Number of Rows in Dataset --
 
 select count(*) from population_1;       #640
 
 select count(*) from population_2;       #640
 
 
   -- Get data from Jharkhand and Bihar --
  
select * from population_2 where State in ("Jharkhand" , "Bihar") ;
  
#--Calculate population of India--
  
select * from population_2 ;
select sum(Population) from population_2 ;

select * from population_1 ;


-- Avg Growth --
select avg(Growth)*100 from population_1;


-- Avg Growth by State --
select State,avg(Growth)*100 from population_1 group by State ;



-- Avg Sex Ratio --
select avg(Sex_Ratio) from population_1;


-- create table for top and bottom 3 literacy states --

create table top_states
(state nvarchar (255),
top_states float) ;

insert into top_states
select State,round(avg(Literacy),0) literacy_ratio from population_1 
group by State order by literacy_ratio desc limit 3;

select * from top_states order by top_states desc ;

create table bottom_states
(state nvarchar (255),
bottom_states float) ;

insert into bottom_state 
select State,round(avg(Literacy),0) literacy_ratio from population_1 
group by State order by literacy_ratio asc limit 3;

select * from bottom_states order by bottom_states asc ;


-- Combine Output --
select * from (
select * from top_states order by top_states desc) a

union
select * from (
select  * from bottom_states order by bottom_states asc ) b;







use population ;
select * from population_1;

select * from population_2;

select a.District,a.State,a.Sex_Ratio,b.Population from population_1 a inner join population_2 b on a.District = b.District ;

-- Define Males and Females --

select c.district,c.state,round(c.population/(c.Sex_Ratio+1),0)males, round((c.population*c.Sex_Ratio)/(c.Sex_Ratio+1),0) females from
(select a.District,a.State,a.Sex_Ratio/1000 Sex_Ratio ,b.Population from population_1 a inner join population_2 b on a.District = b.District )c group by State;

-- Population Growth --

select a.district ,a.State, a.Growth  Growth , b.population from population_1 a inner join population_2 b on a.district = b.district

 
-- Population vs Area --->

select sum(Area_km2) from population_2
  
  
