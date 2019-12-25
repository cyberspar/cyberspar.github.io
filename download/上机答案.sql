----------实验三 数据的基本操作---------------------------------------------------------------
--2．数据的简单查询
--查询学生的全部信息
select * from 学生

--查询全体学生的学号、姓名和年龄
select 学号,姓名,年龄 from 学生

--查询系部代码为“01”的学生的学号、姓名、年龄
select 学号,姓名,年龄 from 学生 where 系部代码='01'

--查询年龄高于18的学生的学号、姓名和性别。
select 学号,姓名,性别 from 学生 where 年龄>18

--创建选课成绩表，并添加学号，课程号和成绩属性
create table 选课成绩
(
	学号 char(20) not null ,
	课程号  char(10) not null,
	成绩 int
)
--创建主键
alter table 选课成绩
add constraint pk
primary key clustered(学号,课程号)


--为选课成绩表中插入数据
insert 选课成绩 values('010101000000','c1',78)
insert 选课成绩 values('010101000000','c2',88)
insert 选课成绩 values('010101000000','c3',72)
insert 选课成绩 values('010101000000','c5',68)
insert 选课成绩 values('010101000001','c1',68)
insert 选课成绩 values('010101000001','c2',98)
insert 选课成绩 values('010101000001','c3',78)
insert 选课成绩 values('010101000001','c4',88)

insert 选课成绩 values('010101000002','c1',68)
insert 选课成绩 values('010101000002','c2',78)
insert 选课成绩 values('010101000002','c3',92)
insert 选课成绩 values('010101000003','c5',63)
insert 选课成绩 values('010101000004','c1',69)
insert 选课成绩 values('010101000004','c2',78)
insert 选课成绩 values('010101000005','c3',70)
insert 选课成绩 values('010101000005','c4',48)

--查询选修C1或C2课程且分数大于等于85分学生的的学号、课程号和成绩。（需先为创建选课成绩表，并添加学号，课程号和成绩）
select 学号,课程号,成绩 from 选课成绩 where (课程号='C1' or 课程号='C2') and 成绩>85

--查询选修C1课程并且成绩在80至90之间的学生的学号、姓名及年龄。
select 学生.学号,姓名,年龄,成绩 from 学生,选课成绩 where 学生.学号=选课成绩.学号 and  课程号='C1' and 成绩 between 70 and 90

--查询选修C1或C2的学生的学号、课程号和成绩。
select 学号,课程号,成绩 from 选课成绩 where 课程号='C1' or 课程号='C2'

--查询没有选修C1，也没有选修C2的学生的学号、课程号和成绩。
select 学号,课程号,成绩 from 选课成绩 where (课程号!='C1' and 课程号!='C2' )
select 学号,课程号,成绩 from 选课成绩 where 学号 not in 
(select 学号 from 选课成绩 where (课程号='C1' or 课程号='C2' ))


--查询所有姓张的学生的学号和姓名。
select 学号,姓名 from 学生 where 姓名 like '张%'

--查询姓名中第二个汉字是“力”的学号和姓名。（如果没有该项请添加后在查询）
select 学号,姓名 from 学生 where 姓名 like '_力%'

--查询没有考试成绩的学生的学号和相应的课程号。（如果没有该项请添加空值后在查询）
select 学号, 课程号 from 选课成绩 where 成绩 is null


--3．数据的统计和分组
--求所有学生的高考分数总分和平均分。
select sum(高考分数) as 总分,avg(高考分数) as 平均分 from 学生

--求选修C1号课程的最高分、最低分及之间相差的分数。
select max(成绩) as 最高分,min(成绩) as 最低分, max(成绩)-min(成绩)as 相差 from 选课成绩
where 课程号='c1'

--求“01”系学生的总数、高考平均分、高考总分。（要求显示时标出列名）
select count(学号) as 人数,sum(高考分数) as 总分,avg(高考分数) as 平均分 from 学生
where 系部代码='01'



--显示所有系部代码，并求共有多少个系。（要求系部代码不能重复，并且使用compute命令）
select distinct 系部代码 from 学生
compute count(系部代码)

select 系部代码 from 系部
compute count(系部代码)

--求各个课程号及相应的选课人数。
select 课程号, count(学号) as 人数 from 选课成绩
group by 课程号

--求选课人数超过3人的各个课程号及人数。
select 课程号, count(学号) as 人数 from 选课成绩
group by 课程号
having count(*)>3


--查询选修了3门以上课程的学生学号。
select 学号 from 选课成绩
group by 学号
having count(*)>3


--求每个系各有多少人，并按照人数递增顺序显示各系代码，系部名称。（要求使用group by 和order by 命令）
select 系部代码,count(学号) as 人数 from 学生
group by 系部代码 
order by count(学号) 

select 系部代码,系部名称,count(学号) as 人数 from 学生,系部
where 学生.系部代码=系部.系部代码
group by 系部代码,系部名称
order by count(学号) 


--求各系学生的平均高考分数，并把结果存入系部平均高考成绩表中。
--首先建表：
create  table  系部平均高考分数
(
	系部代码  CHAR(6) ,
	平均成绩 SMALLINT
)
--然后插入数据（查询结果插入）
    
  insert  into  系部平均高考分数(系部代码,平均成绩 )
  select  系部代码,AVG(高考分数)  FROM  学生
  GROUP BY 系部代码



--求每个专业方向各有多少人，并按照人数递减顺序显示各专业代码，并计算专业总人数。
select 专业代码,count(学号) as 人数 from 学生 
group by 专业代码 
order by count(学号) desc
compute sum(count(学号)) 

--显示专业人数大于5人的各个专业代码。（要求使用having命令）
select 专业代码 from 学生表 
group by 专业代码 having count(学号)>=5


--查询选修C2、C3、C4或C5课程的学号、课程号和成绩，查询结果按学号升序排列，学号相同再按成绩降序排列。（请自己创建选课成绩表）
select 学号,课程号,成绩 from 选课成绩
where 课程号 in('C2','C3','C4','C5')
order by 学号, 成绩 desc

--求选课在三门以上且各门课程均及格的学生的学号及其总成绩，查询结果按总成绩降序列出。

select 学号, sum(成绩)as 总成绩 from 选课成绩
where 成绩>=60
group by 学号 having count(学号)>=3
order by 总成绩 desc

select 学号,sum(成绩)as 总成绩 from 选课表
where 成绩>=60
group by 学号
having count(学号)>=1 
order by sum(成绩) desc

--"010101000001"和"010101000005"学生有一门课程低于60分
select 学号,sum(成绩)as 总成绩 from 选课表
where 学号 not in
(select  学号 from 选课表
where 成绩<60)
group by 学号
having count(学号)>=1 
order by sum(成绩) desc


--4．数据的连接查询

--对学生表和班级表作交叉连接。
select * from 学生 cross join 班级

--把同一个班级的学生表和班级表连接起来。（要求使用等值连接）
select 学生.姓名,学生.性别,班级.班级名称 from 学生 cross join 班级
where 学生.班级代码=班级.班级代码

select 学生.姓名,学生.性别,班级.班级名称 from 学生,班级
where 学生.班级代码=班级.班级代码

select 学生.姓名,学生.性别,班级.班级名称 from 学生 inner join 班级
on 学生.班级代码=班级.班级代码

--查询所有比刘德华高考分数高的学生姓名、性别、高考分数和刘德华的高考分数。

select X.姓名,X.性别,X.高考分数,Y.高考分数
from 学生 as X join 学生 as Y
on X.高考分数> Y.高考分数 and Y.姓名='刘德华'

select x.姓名,x.性别,x.高考成绩 from 学生 as x,学生 as y
where x.高考成绩 >= y.高考成绩 and y.姓名='刘德华'

--查询所有学生的学号、姓名、选课名称及成绩的左连接、右连接、完整外部连接。

select 学生.学号,学生.姓名,选课成绩.课程号,选课成绩.成绩
from 学生 left join 选课成绩
on 学生.学号=选课成绩.学号 

select 学生.学号,学生.姓名,选课成绩.课程号,选课成绩.成绩
from 学生 right join 选课成绩
on 学生.学号= 选课成绩.学号

select 学生.学号,学生.姓名,选课成绩.课程号,选课成绩.成绩
from 学生 full join 选课成绩 on 学生.学号= 选课成绩.学号

--查询所有学生学号,姓名,性别,班级名称,专业名称和系部名称。（要求使用复合连接条件查询）
select  学生.学号,学生.姓名, 学生.性别,班级名称,专业名称,系部名称
from 学生 join 班级 on 学生.班级代码=班级.班级代码
		  join 专业 on 学生.专业代码=专业.专业代码
		  join 系部 on 学生.系部代码=系部.系部代码

--------------------------集合查询--------------------------------------------

--查询“软件工程1班”和“软件工程2班”的所有学生的生学号,姓名,性别，
--并分别把结果集制成表class1和class2；使用union语句把class1和class2合并为一个结果集。
select 学生.学号,学生.姓名, 学生.性别 into class1  from 学生 where 班级代码='010101'

select 学生.学号,学生.姓名, 学生.性别 into class2 from 学生  where 班级代码='010102'

select 学号,姓名, 性别 from class1
union
select 学号,姓名, 性别 from class2


select 学生.学号,姓名,性别 
from 学生, 班级
where 学生.班级代码=班级.班级代码 and 班级.班级名称='软件工程1班'
union
select 学生.学号,姓名,性别 
from 学生, 班级
where 学生. 班级代码=班级.班级代码 and 班级.班级名称='软件工程2班'


--查询01系的学生及年龄不大于20岁的学生（集合的并集操作）。

SELECT *  FROM 学生  WHERE 系部代码= '01' 
UNION
SELECT *  FROM 学生 WHERE 年龄<=20


SELECT  DISTINCT  *  FROM 学生   
WHERE 系部代码= '01'  OR  年龄<=20


--查询01系的学生与年龄不大于20岁的学生的交集(实际上就是查询计算机系中年龄不大于19岁的学生，集合的交集操作)。
SELECT *  FROM 学生  WHERE 系部代码= '01'  AND  年龄<=20

--查询01系的学生与年龄不大于20岁的学生的差集(实际上就是查询计算机科学系中年龄大于19岁的学生，集合的差集操作)。
SELECT * FROM 学生  WHERE 系部代码= '01'  AND  年龄>20


--查询01系的学生及年龄不大于20岁的学生,并按照1属性排序（集合排序只用于对最终查询结果排序，不能对中间结果排序）。
SELECT *  FROM 学生  WHERE 系部代码= '01' 
UNION
SELECT *  FROM 学生 WHERE 年龄<=20  order by 1

--外连接查询表--------------------------------------------------------
create table 产品
(
	产品编号 char(9) not null ,
	产品名称 varchar(20)  not null ,
)
go
create table 产品销售
(
	产品编号 char(9) not null ,
	销量 int 
)
go
insert 产品 values('001','显视器')
 insert 产品 values('002','键盘')
 insert 产品 values('003','鼠标')
insert 产品销售 values('001','25')
insert 产品销售 values('003','35')
insert 产品销售 values('005','30')

select 产品.产品编号,产品.产品名称,产品销售.销量
from 产品 left join 产品销售
on 产品.产品编号=产品销售.产品编号

select 产品销售.产品编号,产品.产品名称,产品销售.销量 
from 产品 right join 产品销售
on 产品.产品编号=产品销售.产品编号

select 产品.产品编号,产品.产品名称,产品销售.销量 
from 产品 full join 产品销售
on 产品.产品编号=产品销售.产品编号

--同上，注意结果的区别。
select 产品销售.产品编号, 产品名称, 销量
from 产品 left join 产品销售
on 产品.产品编号 = 产品销售.产品编号 


select 产品销售.产品编号, 产品名称, 销量
from 产品 right join 产品销售
on 产品.产品编号 = 产品销售.产品编号 

select 产品销售.产品编号, 产品名称, 销量
from 产品 full join 产品销售
on 产品.产品编号 = 产品销售.产品编号


--5.数据的多表查询和子查询

--查询出生日期大于刘德华的学生的学号、姓名。
select 学号,姓名,出生日期 from 学生 where 出生日期 >
	(select 出生日期 from 学生 where 姓名='刘德华' )

--查询课程号为c1的所有学生的学号、姓名。
--（要求使用子查询和连接查询两种方法。注意：这里的选课信息和学生信息分别在学生和选课成绩两个表中。）

select 学号,姓名 from 学生 where 学号=any
	(select 学号 from 选课成绩 where 课程号='c1' )

select 学生.学号,姓名,课程号 from 学生 inner join 选课成绩 
on 课程号='c1' and 学生.学号=选课成绩.学号

select 学生.学号,学生.姓名,选课成绩.课程号 from 学生,选课成绩
where 课程号='c1' and 学生.学号= 选课成绩.学号

--可以使用IN代替“=ANY”。
select 学号,姓名 from 学生 where 学号 in
	(select 学号 from 选课成绩 where 课程号='c1' )

--查询其他系中比02系所有学生高考分数都高的学生的姓名和高考分数。
select 姓名,高考分数,系部代码 from 学生 where 高考分数>all
	(select 高考分数 from 学生 where 系部代码='02')

select 姓名,高考分数,系部代码 from 学生 where 高考分数>
	(select max(高考分数)from 学生 where 系部代码='02')
AND 系部代码!= '02'

--查询其他系中比02系某一学生高考分数高的学生的姓名、系部代码和高考分数。
select  姓名,高考分数,系部代码 from 学生 where 高考分数>any
	(select 高考分数 from 学生 where 系部代码='02')

--查询高考分数大于学号为01,04中任意一个的学生的学号、姓名、高考分数

select 学号,姓名,高考分数 from 学生 where 高考分数>any
	(select 高考分数 from 学生 where 学号 in('010101000001','010101000004'))

--查询高考分数大于学号为01和04的学生的学号、姓名、高考分数
select 学号,姓名,高考分数 from 学生 where 高考分数>all
	(select 高考分数 from 学生 where 学号 in('010101000001','010101000004'))

--查询高考分数大于等于学号为01,04中任意一个的学生的学号、姓名、高考分数

select 学号,姓名,高考分数 from 学生 where 高考分数>=any
	(select 高考分数 from 学生 where 学号 in('010101000001','010101000004'))
	
	
	--	查询高考分数大于等于学号为13,14中任意一个的学生的学号、姓名、高考分数。
select 学号,姓名, 高考分数 from 学生
where 高考分数 >any
(select 高考分数 from 学生 where 学号 like '%13' or 学号 like '%14')

--查询高考分数大于等于学号为01和04的学生的学号、姓名、高考分数。
select 学号,姓名,高考分数 from 学生 where 高考分数>=all
	(select 高考分数 from 学生 where 学号 in('010101000001','010101000004'))

--使用exist语句查询课程号为c1的所有学生的学号、姓名。
--注意：exist语句中的子查询只返回真假，为真时，则执行where exists前的语句，即select 学号,姓名 from 学生的全部内容，除非有更多限制条件：学号=学生.学号。
select 学号,姓名 from 学生 where exists
	(select *from 选课成绩 where 课程号='c1'and 学号=学生.学号)

select 学号,姓名 from 学生 where not exists
	(select *from 选课成绩 where 课程号='c1'and 学号=学生.学号)

select 学号,姓名 from 学生 where 学号=any
	(select 学号 from 选课成绩 where 课程号='c1' )
	
--查询没有选修1号课程的学生姓名。(用连接运算难于实现) 

SELECT 姓名 FROM 学生表
     WHERE NOT EXISTS (SELECT * FROM 选课成绩
             WHERE 选课成绩.学号 = 学生表.学号 and 课程号='c1')
             
select 学号,姓名 from 学生表
where 学号 not in
(select 学号 from 选课成绩 where 课程号='c1')

--查询选课表和学生表中每位学生的学号，姓名，平均成绩
select 选课成绩.学号,姓名, AVG(成绩) as 平均成绩 from 学生表,选课成绩
where 学生表.学号=选课成绩.学号
group by 选课成绩.学号,姓名



--------------实验四 索引---------------------------------------------------

--1. 创建索引

--创建系部表的系部名称非聚集索引；
create nonclustered index id_xibu on 系部(系部名称)

--创建专业表的专业名称的唯一索引；
create unique index id_zhuanye on 专业(专业名称)

--创建学生表的学号和姓名的唯一聚集索引，并按照学号降序排列；
create unique clustered index id_xuesheng on 学生(学号 desc,姓名)

--2. 查看索引
exec sp_helpindex 系部

exec sp_helpindex 专业

exec sp_helpindex 学生

--3．索引的删除
drop index 系部.id_xibu

drop index 专业.id_zhuanye

drop index 学生.id_xuesheng


--实验五 视图---------------------------------------------------


--1．视图的创建

--创建学生的学号、姓名、班级名称、专业名称、系部名称视图
create view view_3
as
select 学生.学号,学生.姓名,系部.系部名称,专业.专业名称,班级.班级名称
from 系部,专业,班级,学生
where  学生.系部代码=系部.系部代码 and 学生.专业代码=专业.专业代码 and 学生.班级代码=班级.班级代码

--创建一个软件工程1班系学生情况的视图

create view 软件工程1班
as
select 学生.学号,学生.姓名,班级.班级名称
from 班级,学生
where 学生.班级代码=班级.班级代码 and 班级.班级名称='软件工程1班'

--创建各个系部高考分数的平均分的视图，要求显示系部名称和系部平均分。	
	create view v_DepGrade3(系部名称,系部平均分)
	as
	select top(20) 系部名称, AVG(高考分数) from 学生表,系部表
	where 学生表.系部代码=系部表.系部代码
	group by 学生表.系部代码,系部名称
	order by AVG(高考分数)


--2.查看视图
exec sp_helptext View_3

--3.删除视图

drop view View_4


--实验六	数据控制---------------------------------------------------

--1．定义、修改和撤消数据库的用户

--创建一个登录名为“Andrew”的数据库用户

CREATE LOGIN Andrew123
    WITH PASSWORD = '123'
    
grant create table 
to Andrew123

USE db_students
CREATE USER Andrew123 FOR LOGIN Andrew123


--修改Andrew123的用户名和密码

ALTER LOGIN Andrew123 WITH PASSWORD = 'abc12345'  OLD_PASSWORD = '123'

ALTER LOGIN Andrew123 WITH NAME = AndrewAndrew

ALTER USER Andrew123  WITH NAME = AndrewAndrew ;


--删除Andrew用户和登录名
DROP LOGIN AndrewAndrew

drop user AndrewAndrew


 Grant CREATE table 
 to AndrewAndrew
/*  
 Create Table AndrewAndrew.系部1
(
	系部代码 char(6) not null primary key,
	系部名称 varchar(30) not null,
	系主任	 char(8) 
)


CREATE TABLE [dbo].[产品销售](
	[产品编号] [char](9) NOT NULL,
	[销量] [int] NULL
) ON [PRIMARY]
*/

--2.权限与角色的授予与收回

--将对学生表的修改学号和查询权限授予用户AndrewAndrew
grant update (学号),select on 学生表 to AndrewAndrew

--将创建表的系统权限授予所有用户
grant create table to public

--将查询学生表和修改高考分数的权限授予AndrewAndrew,并允许将此权限授予其他用户。
GRANT SELECT,UPDATE(高考分数)
ON 学生
TO AndrewAndrew
WITH GRANT OPTION

GRANT SELECT,UPDATE(高考分数)
ON 学生
TO test

--撤销用户AndrewAndrew的修改学号权限
revoke update(学号) on 学生 from AndrewAndrew

--撤销所有用户的创建表的系统权限
revoke create table from public

--实验七	存储过程与触发器---------------------------------------------------

--1.	创建、执行、修改、删除简单的存储过程

--在SQL Server 中使用查询分析器执行SQL语句，为学生表创建一个存储过程
create proc student_name
as
select 姓名 from  学生表

exec student_name

--创建一个查询存储过程，该存储过程返回选修c1课程的学生的学号和姓名、成绩。
create procedure student_name_score
as
select 学生.学号,姓名, 成绩
from 学生, 选课成绩
where 学生.学号=选课成绩.学号 and 课程号='c1'

exec student_name_score

--为学生表创建一个存储过程，其参数为学生的性别和系部代码
create proc student_sex_dep
@sex varchar(10),
@id varchar(10)
as
select 姓名,性别,系部代码 from  学生 where 性别=@sex and 系部代码=@id

execute student_sex_dep '男','02'


-- 建立一个存储过程，他带有一个参数，用于接受学号，显示该学生的姓名、课程号和成绩。

create procedure student_cno_score
@学号 char(12)
as
select 学生.学号,姓名, 课程号,成绩
from 学生, 选课成绩
where 学生.学号=选课成绩.学号 and 学生.学号=@学号

exec student_cno_score '010101000001'

-- 修改上面的存储过程,把参数"学号"改为"课程号"
alter proc student_cno_score
@课程号 char(12)
as
select 学生.学号,姓名, 课程号,成绩
from 学生, 选课成绩
where 学生.学号=选课成绩.学号 and 选课成绩.课程号=@课程号

exec student_cno_score 'c1'

--执行上面新创建的存储过程，如参数为：性别＝男，和系部代码＝02；

execute student
execute student_sex_dep '男','02'


--查看上面新创建的存储过程
execute sp_helptext student_name
execute sp_depends student_name
execute sp_help student_name

exec student_name


--删除上面创建的一个存储过程

drop procedure student_name,student_name_score,student_cno_score

--2. 创建、执行、修改、删除触发器

--为专业表创建一个触发器。要求当要删除专业表记录时，如果该专业已经被其他表引用，用Print语句给出提示信息，并恢复原来的数据。
Create  trigger  delete_zhye    on  专业
   for   delete
   As
  If(select count(*)from  班级 join  deleted  On  班级.专业代码=deleted.专业代码)>0 
    begin
      Print ('该专业已被班级表所引用，你不可以删除此记录，删除将终止')
      Rollback  transaction
    end
 else
    print '记录已删除'     


create trigger update_zhuanye on 专业
for update
as
if(select count(*) from 学生 join 专业 on 学生.专业代码=专业.专业代码)>0
	begin 
		print('该专业已被学生表所引用，不能修改')
		Rollback  transaction
	end
else
	print('记录已修改') 

--为专业表创建一个触发器。要求当修改专业名称时，用Print语句给出提示信息，并恢复原来的数据。

Create  trigger  update_zymc  On 专业
  For  update 
  As
  If update(专业名称)
   Begin
    Print '不能修改专业名称'
    rollback  transaction
   End


--使用SQL 为产品表创建一个inserted表触发，并给触发器插入数据，执行观察结果。
create trigger t1
ON 产品
FOR  insert
as
declare @a char(10)
select @a=产品编号 from inserted
insert into 产品销售 values(@a, 0)

--为上面创建的触发器插入数据，执行观察结果。
select * from 产品
select * from 产品销售

insert 产品 values('04','主机')
insert 产品 values('06','摄像头')

--为产品表创建一个deleteed表触发器，并给触发器删除数据，执行观察结果
create trigger t2
on 产品
for delete
as
declare @a char(10)
select @a=产品编号 from deleted
delete 产品销售 where 产品编号=@a

delete 产品 where 产品编号='004'

--查看触发器信息
exec sp_helptrigger 产品

--删除触发器
drop trigger t1,t2


--实验八 函数---------------------------------------------------

--2、数学函数
--返回绝对值
select ABS (-8)

--返回大于或等于所给数字的最小整数
select CEILING(5.6)
select CEILING(-5.6)

--pi值
select	PI ()

--返回x的y次方
select   POWER (2,3)

--返回~1之间的随机数
select   RAND ()

--3、 配置函数

--获取当前数据库版本
SELECT @@VERSION 

--当前语言	
SELECT @@LANGUAGE 

--4、时间函数
select getdate()   --当前时间
select day(getdate())   --取出天
select month(getdate())   --取出月
select year(getdate())   --取出年
select dateadd(d,3,getdate()) as wawa_dateadd --加三天
select datename(d,'2010-07-15')   --取出时间的某一部分

--5、字符串函数
Select LEN('str1111')--返回字符串的字符个数
Select lower('ABC'),lower('Abc'),upper('Abc'),upper('abc') --转换大小写
select ltrim('           左边没有空格')   --去空格
select rtrim('右边没有空格    ') --去空格
select ltrim(rtrim('    左右都没有空格    ')) --去空格
select left('sql server',3),right('sql server',6) --取左或者取右
Select replace('原字符串','原','这是一个')--字符串替换
Select replicate('go',5)--指定的次数重复字符
select reverse('这是字符串') --将定字符串返序排列
select substring('这是一个原字符串',2,3)--指定截取指字字符串

--6、排名函数
select 姓名,rank() over (order by 高考分数 desc)as 名次,高考分数 from 学生
