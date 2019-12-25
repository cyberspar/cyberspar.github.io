--实验一 创建数据库
CREATE  DATABASE  db_student
 ON PRIMARY
(
	NAME= 'db_student.mdf',
	FILENAME= 'D:\Works\Database Samples\db_student.mdf',
	SIZE=3mb,
	MAXSIZE=50mb,
	FILEGROWTH=10%
);

--实验二 表的基本操作
--1．	定义基本表和结构

--创建数据库中的各个表
Create Table 系部
(
	系部代码 char(6) not null primary key,
	系部名称 varchar(30) not null,
	系主任	 char(8) 
)

Create Table 专业
(
	专业代码 char(4) not null primary key,
	专业名称 varchar(20) not null,
	系部代码 char(6) constraint con_dep foreign key references 系部(系部代码)
)

Create Table 班级
(
	班级代码 char(9) not null primary key,
	班级名称 varchar(20), 
	专业代码 char(4) constraint con_maj foreign key references 专业(专业代码),
	系部代码 char(6) constraint con_dep_class foreign key references 系部(系部代码),
	备注	 varchar(50) 
)

Create Table 学生
(
	学号 char(12) not null primary key ,
	姓名 char(8),
	性别 char(2),
	出生日期 datetime,
	入学时间 datetime,
	班级代码 char(9) constraint con_class_stu foreign key references 班级(班级代码),
	系部代码 char(6) constraint con_dep_stu foreign key references 系部(系部代码),
	专业代码 char(4) constraint con_maj_stu foreign key references 专业(专业代码)
)

--修改学生表，增加一个家庭住址列；
alter table 学生 add 地址 char(20)

--更改列的数据类型：把学生表中的姓名列加宽到10位字符宽度；
alter table 学生
alter column 姓名 char(10)

--添加一个新列
alter table 学生 add 备注 char(20)

--删除一个列
alter table 学生 drop column 地址 

--删除学生表中的专业代码的约束；
alter table 学生 drop constraint wz5

--重命名表：将学生表的名字更改为STUDENT；（再改回来）
sp_rename '学生','STUDENT'
sp_rename 'STUDENT','学生'

--重命名列：将班级表的备注更改为其它；
sp_rename '班级.备注','其它'

--删除一个表；（删除后不可恢复）
 drop table 选课成绩

--删除表的所有数据；
truncate table 班级

--创建主键约束；
 alter table 学生 add constraint pk_stu
	primary key clustered (学号)

--创建外建约束；
 alter table 学生 add constraint wz5
	foreign key (专业代码) references 专业(专业代码)

--创建CHECK约束,限制性别只能是男女.
alter table 学生
add constraint css
check(性别 in ('男','女')) --（约束表达式性别 in ('男','女')）

--创建CHECK约束，设置性别默认为男.
alter table 学生
add constraint cs default('男') for 性别 --（约束表达式性别=('男')）



--实验三 数据的基本操作
--1．	数据的添加.删除.修改


--为数据库中的各表插入数据
insert 系部(系部代码,系部名称,系主任) values('01','计算机系','老张') 
go
insert 系部(系部代码,系部名称,系主任) values('02','经济管理系','老陈') 
go
insert 系部(系部代码,系部名称,系主任) values('03','机械系','老李') 
go
insert 系部(系部代码,系部名称,系主任) values('04','数学系','老梁') 
go
 

insert 专业(专业代码,专业名称,系部代码) values('0101','软件工程','01')
go
insert 专业(专业代码,专业名称,系部代码) values('0102','网络工程','01')
go
insert 专业(专业代码,专业名称,系部代码) values('0103','信息工程','01')
go
insert 专业(专业代码,专业名称,系部代码) values('0201','工商管理','02')
go
insert 专业(专业代码,专业名称,系部代码) values('0202','物流管理','02')
go
insert 专业(专业代码,专业名称,系部代码) values('0301','模具加工','03')
go
insert 专业(专业代码,专业名称,系部代码) values('0302','机电一体化','03')
go
insert 专业(专业代码,专业名称,系部代码) values('0401','应用数学','04')
go
insert 专业(专业代码,专业名称,系部代码) values('0402','金融数学','04')
go

insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010101','软件工程1班','0101','01','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010102','软件工程2班','0101','01','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010103','网络工程1班','0102','01','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010104','网络工程2班','0102','01','暂无')
go 
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010105','信息工程1班','0103','01','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010106','工商管理1班','0201','02','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010107','物流管理1班','0202','02','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010108','模具加工1班','0301','03','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('010109','应用数学1班','0401','04','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('0101010','金融数学1班','0402','04','暂无')
go
insert 班级(班级代码,班级名称,专业代码,系部代码,备注)
values('0101011','金融数学2班','0402','04','暂无')

insert 学生 values('010101000000','刘德华','男','1988-5-5','2010-9-1','010101','01','0101',356)
go
insert 学生 values('010101000001','张学友','男','1988-1-4','2010-9-1','010101','01','0101',354)
go
insert 学生 values('010101000002','梁静茹','女','1988-2-1','2010-9-1','010101','01','0101',342)
go
insert 学生 values('010101000003','陈奕迅','男','1983-5-3','2010-9-1','010102','01','0101',441)
go
insert 学生 values('010101000004','张韶涵','女','1987-8-6','2010-9-1','010102','01','0101',354)
go
insert 学生 values('010101000005','林俊杰','男','1988-6-6','2010-9-1','010102','01','0101',498)
go
insert 学生 values('010101000006','孙燕姿','女','1984-5-3','2010-9-1','010106','02','0201',522)
go
insert 学生 values('010101000007','周华健','男','1986-8-6','2010-9-1','010106','02','0201',378)
go
insert 学生 values('010101000008','尚雯婕','女','1988-6-6','2010-9-1','010106','02','0201',365)
go 
insert 学生 values('010101000009','任贤齐','男','1984-5-3','2010-9-1','010108','03','0301',421)
go
insert 学生 values('010101000010','魏晨','男','1986-8-6','2010-9-1','010108','03','0301',574)
go
insert 学生 values('010101000011','庞龙','男','1988-6-6','2010-9-1','010108','03','0301',452)
go 
insert 学生 values('010101000012','刘若英','女','1988-5-3','2010-9-1','0101011','04','0402',354)
go
insert 学生 values('010101000013','李圣杰','男','1989-8-6','2010-9-1','0101011','04','0402',324)
go
insert 学生 values('010101000014','李克群','男','1989-2-9','2010-9-1','0101011','04','0402',321)
go 


--创建选课成绩表，添加学号，课程号和成绩属性列。用多行插入语句将学生表中的学号复制到选课成绩表。
create table 选课成绩
(
	学号 char(12) not null primary key ,
	课程号 char(10),
	成绩   int
)

insert into 选课成绩 (学号)
select 学号 from 学生

--设置条件修改表中的各项记录；
update 学生 set 性别='男' where 姓名='尚雯婕'
update 学生 set 系部代码='01' where 姓名='尚雯婕'


--为学生表添加年龄项，分别输入各位学生的年龄；
alter table 学生 add 年龄 int

--修改年龄为18岁的学生年龄为20；（在可视化界面中手动添加学生年龄）
update 学生 set 年龄=18
update 学生 set 年龄=20 where 年龄=18

--修改所有学生的入学时间、班级代码等；
update 学生 set 入学时间='2010-9-1'
update 学生 set 班级代码='010108' where 专业代码='0402'


--设置条件删除表中的无用记录；
insert 学生(学号) values('010101000015')
 
delete 学生 where 姓名 is null

---清空表中数据
truncate table [表名]




create table st_table
(
	学号 int not null identity,
	姓名 char(8) not null,
	专业方向 varchar(50) not null,
	系部代码 char(2) not null,
	备注 varchar(50),
	高考分数 int 
)



insert st_table values('张学友','网络','01','没有','411')
insert st_table values('刘德华','计算机','02','没有','412')
insert st_table values('舒淇','计算机','01','没有','413')
insert st_table values('梁咏琪','动漫','02','没有','431')
insert st_table values('杨千嬅','计算机','01','没有','465')
insert st_table values('李宇春','动漫','02','没有','485')
insert st_table values('蔡依林','网络','01','没有','468')
insert st_table values('郑源','计算机','02','没有','510')
insert st_table values('陈楚生','动漫','01','没有','550')
insert st_table values('张韶涵','计算机','02','没有','421')
insert st_table values('猛非','动漫','01','没有','423')
insert st_table values('郑秀文','网络','02','没有','411')
insert st_table values('林俊杰','计算机','01','没有','511')
insert st_table values('羽泉','计算机','01','没有','500')
insert st_table values('郭富城','网络','02','没有','400')
insert st_table values('黄品源','动漫','02','没有','589')
insert st_table values('梁朝伟','计算机','02','没有','530')
insert st_table values('李克勤','网络','01','没有','520')
insert st_table values('陈小春','国际金融','02','没有','512')
insert st_table values('刘若英','证券期货','02','没有','421')
insert st_table values('刘嘉玲','房地产金融','01','没有','428')
insert st_table values('谭咏麟','房地产金融','02','没有','498')
insert st_table values('张学友','证券期货','01','没有','454')
insert st_table values('张卫健','证券期货','02','没有','515')
insert st_table values('周传雄','房地产金融','01','没有','532')
insert st_table values('周星驰','国际金融','02','没有','423')
insert st_table values('游鸿明','房地产金融','02','没有','477')
insert st_table values('言承旭','国际金融','02','没有','488')
insert st_table values('许志安','国际金融','01','没有','582')
insert st_table values('叶倩文','房地产金融','01','没有','495')
insert st_table values('叶世荣','房地产金融','02','没有','499')
insert st_table values('张雨生','证券期货','02','没有','531')
insert st_table values('周润发','国际金融','01','没有','531')
insert st_table values('张信哲','证券期货','01','没有','424')
insert st_table values('周渝民','证券期货','02','没有','412')
insert st_table values('太极乐队','证券期货','02','没有','423')

