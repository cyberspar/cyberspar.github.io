----------ʵ���� ���ݵĻ�������---------------------------------------------------------------
--2�����ݵļ򵥲�ѯ
--��ѯѧ����ȫ����Ϣ
select * from ѧ��

--��ѯȫ��ѧ����ѧ�š�����������
select ѧ��,����,���� from ѧ��

--��ѯϵ������Ϊ��01����ѧ����ѧ�š�����������
select ѧ��,����,���� from ѧ�� where ϵ������='01'

--��ѯ�������18��ѧ����ѧ�š��������Ա�
select ѧ��,����,�Ա� from ѧ�� where ����>18

--����ѡ�γɼ��������ѧ�ţ��γ̺źͳɼ�����
create table ѡ�γɼ�
(
	ѧ�� char(20) not null ,
	�γ̺�  char(10) not null,
	�ɼ� int
)
--��������
alter table ѡ�γɼ�
add constraint pk
primary key clustered(ѧ��,�γ̺�)


--Ϊѡ�γɼ����в�������
insert ѡ�γɼ� values('010101000000','c1',78)
insert ѡ�γɼ� values('010101000000','c2',88)
insert ѡ�γɼ� values('010101000000','c3',72)
insert ѡ�γɼ� values('010101000000','c5',68)
insert ѡ�γɼ� values('010101000001','c1',68)
insert ѡ�γɼ� values('010101000001','c2',98)
insert ѡ�γɼ� values('010101000001','c3',78)
insert ѡ�γɼ� values('010101000001','c4',88)

insert ѡ�γɼ� values('010101000002','c1',68)
insert ѡ�γɼ� values('010101000002','c2',78)
insert ѡ�γɼ� values('010101000002','c3',92)
insert ѡ�γɼ� values('010101000003','c5',63)
insert ѡ�γɼ� values('010101000004','c1',69)
insert ѡ�γɼ� values('010101000004','c2',78)
insert ѡ�γɼ� values('010101000005','c3',70)
insert ѡ�γɼ� values('010101000005','c4',48)

--��ѯѡ��C1��C2�γ��ҷ������ڵ���85��ѧ���ĵ�ѧ�š��γ̺źͳɼ���������Ϊ����ѡ�γɼ��������ѧ�ţ��γ̺źͳɼ���
select ѧ��,�γ̺�,�ɼ� from ѡ�γɼ� where (�γ̺�='C1' or �γ̺�='C2') and �ɼ�>85

--��ѯѡ��C1�γ̲��ҳɼ���80��90֮���ѧ����ѧ�š����������䡣
select ѧ��.ѧ��,����,����,�ɼ� from ѧ��,ѡ�γɼ� where ѧ��.ѧ��=ѡ�γɼ�.ѧ�� and  �γ̺�='C1' and �ɼ� between 70 and 90

--��ѯѡ��C1��C2��ѧ����ѧ�š��γ̺źͳɼ���
select ѧ��,�γ̺�,�ɼ� from ѡ�γɼ� where �γ̺�='C1' or �γ̺�='C2'

--��ѯû��ѡ��C1��Ҳû��ѡ��C2��ѧ����ѧ�š��γ̺źͳɼ���
select ѧ��,�γ̺�,�ɼ� from ѡ�γɼ� where (�γ̺�!='C1' and �γ̺�!='C2' )
select ѧ��,�γ̺�,�ɼ� from ѡ�γɼ� where ѧ�� not in 
(select ѧ�� from ѡ�γɼ� where (�γ̺�='C1' or �γ̺�='C2' ))


--��ѯ�������ŵ�ѧ����ѧ�ź�������
select ѧ��,���� from ѧ�� where ���� like '��%'

--��ѯ�����еڶ��������ǡ�������ѧ�ź������������û�и�������Ӻ��ڲ�ѯ��
select ѧ��,���� from ѧ�� where ���� like '_��%'

--��ѯû�п��Գɼ���ѧ����ѧ�ź���Ӧ�Ŀγ̺š������û�и�������ӿ�ֵ���ڲ�ѯ��
select ѧ��, �γ̺� from ѡ�γɼ� where �ɼ� is null


--3�����ݵ�ͳ�ƺͷ���
--������ѧ���ĸ߿������ֺܷ�ƽ���֡�
select sum(�߿�����) as �ܷ�,avg(�߿�����) as ƽ���� from ѧ��

--��ѡ��C1�ſγ̵���߷֡���ͷּ�֮�����ķ�����
select max(�ɼ�) as ��߷�,min(�ɼ�) as ��ͷ�, max(�ɼ�)-min(�ɼ�)as ��� from ѡ�γɼ�
where �γ̺�='c1'

--��01��ϵѧ�����������߿�ƽ���֡��߿��ܷ֡���Ҫ����ʾʱ���������
select count(ѧ��) as ����,sum(�߿�����) as �ܷ�,avg(�߿�����) as ƽ���� from ѧ��
where ϵ������='01'



--��ʾ����ϵ�����룬�����ж��ٸ�ϵ����Ҫ��ϵ�����벻���ظ�������ʹ��compute���
select distinct ϵ������ from ѧ��
compute count(ϵ������)

select ϵ������ from ϵ��
compute count(ϵ������)

--������γ̺ż���Ӧ��ѡ��������
select �γ̺�, count(ѧ��) as ���� from ѡ�γɼ�
group by �γ̺�

--��ѡ����������3�˵ĸ����γ̺ż�������
select �γ̺�, count(ѧ��) as ���� from ѡ�γɼ�
group by �γ̺�
having count(*)>3


--��ѯѡ����3�����Ͽγ̵�ѧ��ѧ�š�
select ѧ�� from ѡ�γɼ�
group by ѧ��
having count(*)>3


--��ÿ��ϵ���ж����ˣ���������������˳����ʾ��ϵ���룬ϵ�����ơ���Ҫ��ʹ��group by ��order by ���
select ϵ������,count(ѧ��) as ���� from ѧ��
group by ϵ������ 
order by count(ѧ��) 

select ϵ������,ϵ������,count(ѧ��) as ���� from ѧ��,ϵ��
where ѧ��.ϵ������=ϵ��.ϵ������
group by ϵ������,ϵ������
order by count(ѧ��) 


--���ϵѧ����ƽ���߿����������ѽ������ϵ��ƽ���߿��ɼ����С�
--���Ƚ���
create  table  ϵ��ƽ���߿�����
(
	ϵ������  CHAR(6) ,
	ƽ���ɼ� SMALLINT
)
--Ȼ��������ݣ���ѯ������룩
    
  insert  into  ϵ��ƽ���߿�����(ϵ������,ƽ���ɼ� )
  select  ϵ������,AVG(�߿�����)  FROM  ѧ��
  GROUP BY ϵ������



--��ÿ��רҵ������ж����ˣ������������ݼ�˳����ʾ��רҵ���룬������רҵ��������
select רҵ����,count(ѧ��) as ���� from ѧ�� 
group by רҵ���� 
order by count(ѧ��) desc
compute sum(count(ѧ��)) 

--��ʾרҵ��������5�˵ĸ���רҵ���롣��Ҫ��ʹ��having���
select רҵ���� from ѧ���� 
group by רҵ���� having count(ѧ��)>=5


--��ѯѡ��C2��C3��C4��C5�γ̵�ѧ�š��γ̺źͳɼ�����ѯ�����ѧ���������У�ѧ����ͬ�ٰ��ɼ��������С������Լ�����ѡ�γɼ���
select ѧ��,�γ̺�,�ɼ� from ѡ�γɼ�
where �γ̺� in('C2','C3','C4','C5')
order by ѧ��, �ɼ� desc

--��ѡ�������������Ҹ��ſγ̾������ѧ����ѧ�ż����ܳɼ�����ѯ������ܳɼ������г���

select ѧ��, sum(�ɼ�)as �ܳɼ� from ѡ�γɼ�
where �ɼ�>=60
group by ѧ�� having count(ѧ��)>=3
order by �ܳɼ� desc

select ѧ��,sum(�ɼ�)as �ܳɼ� from ѡ�α�
where �ɼ�>=60
group by ѧ��
having count(ѧ��)>=1 
order by sum(�ɼ�) desc

--"010101000001"��"010101000005"ѧ����һ�ſγ̵���60��
select ѧ��,sum(�ɼ�)as �ܳɼ� from ѡ�α�
where ѧ�� not in
(select  ѧ�� from ѡ�α�
where �ɼ�<60)
group by ѧ��
having count(ѧ��)>=1 
order by sum(�ɼ�) desc


--4�����ݵ����Ӳ�ѯ

--��ѧ����Ͱ༶�����������ӡ�
select * from ѧ�� cross join �༶

--��ͬһ���༶��ѧ����Ͱ༶��������������Ҫ��ʹ�õ�ֵ���ӣ�
select ѧ��.����,ѧ��.�Ա�,�༶.�༶���� from ѧ�� cross join �༶
where ѧ��.�༶����=�༶.�༶����

select ѧ��.����,ѧ��.�Ա�,�༶.�༶���� from ѧ��,�༶
where ѧ��.�༶����=�༶.�༶����

select ѧ��.����,ѧ��.�Ա�,�༶.�༶���� from ѧ�� inner join �༶
on ѧ��.�༶����=�༶.�༶����

--��ѯ���б����»��߿������ߵ�ѧ���������Ա𡢸߿����������»��ĸ߿�������

select X.����,X.�Ա�,X.�߿�����,Y.�߿�����
from ѧ�� as X join ѧ�� as Y
on X.�߿�����> Y.�߿����� and Y.����='���»�'

select x.����,x.�Ա�,x.�߿��ɼ� from ѧ�� as x,ѧ�� as y
where x.�߿��ɼ� >= y.�߿��ɼ� and y.����='���»�'

--��ѯ����ѧ����ѧ�š�������ѡ�����Ƽ��ɼ��������ӡ������ӡ������ⲿ���ӡ�

select ѧ��.ѧ��,ѧ��.����,ѡ�γɼ�.�γ̺�,ѡ�γɼ�.�ɼ�
from ѧ�� left join ѡ�γɼ�
on ѧ��.ѧ��=ѡ�γɼ�.ѧ�� 

select ѧ��.ѧ��,ѧ��.����,ѡ�γɼ�.�γ̺�,ѡ�γɼ�.�ɼ�
from ѧ�� right join ѡ�γɼ�
on ѧ��.ѧ��= ѡ�γɼ�.ѧ��

select ѧ��.ѧ��,ѧ��.����,ѡ�γɼ�.�γ̺�,ѡ�γɼ�.�ɼ�
from ѧ�� full join ѡ�γɼ� on ѧ��.ѧ��= ѡ�γɼ�.ѧ��

--��ѯ����ѧ��ѧ��,����,�Ա�,�༶����,רҵ���ƺ�ϵ�����ơ���Ҫ��ʹ�ø�������������ѯ��
select  ѧ��.ѧ��,ѧ��.����, ѧ��.�Ա�,�༶����,רҵ����,ϵ������
from ѧ�� join �༶ on ѧ��.�༶����=�༶.�༶����
		  join רҵ on ѧ��.רҵ����=רҵ.רҵ����
		  join ϵ�� on ѧ��.ϵ������=ϵ��.ϵ������

--------------------------���ϲ�ѯ--------------------------------------------

--��ѯ���������1�ࡱ�͡��������2�ࡱ������ѧ������ѧ��,����,�Ա�
--���ֱ�ѽ�����Ƴɱ�class1��class2��ʹ��union����class1��class2�ϲ�Ϊһ���������
select ѧ��.ѧ��,ѧ��.����, ѧ��.�Ա� into class1  from ѧ�� where �༶����='010101'

select ѧ��.ѧ��,ѧ��.����, ѧ��.�Ա� into class2 from ѧ��  where �༶����='010102'

select ѧ��,����, �Ա� from class1
union
select ѧ��,����, �Ա� from class2


select ѧ��.ѧ��,����,�Ա� 
from ѧ��, �༶
where ѧ��.�༶����=�༶.�༶���� and �༶.�༶����='�������1��'
union
select ѧ��.ѧ��,����,�Ա� 
from ѧ��, �༶
where ѧ��. �༶����=�༶.�༶���� and �༶.�༶����='�������2��'


--��ѯ01ϵ��ѧ�������䲻����20���ѧ�������ϵĲ�����������

SELECT *  FROM ѧ��  WHERE ϵ������= '01' 
UNION
SELECT *  FROM ѧ�� WHERE ����<=20


SELECT  DISTINCT  *  FROM ѧ��   
WHERE ϵ������= '01'  OR  ����<=20


--��ѯ01ϵ��ѧ�������䲻����20���ѧ���Ľ���(ʵ���Ͼ��ǲ�ѯ�����ϵ�����䲻����19���ѧ�������ϵĽ�������)��
SELECT *  FROM ѧ��  WHERE ϵ������= '01'  AND  ����<=20

--��ѯ01ϵ��ѧ�������䲻����20���ѧ���Ĳ(ʵ���Ͼ��ǲ�ѯ�������ѧϵ���������19���ѧ�������ϵĲ����)��
SELECT * FROM ѧ��  WHERE ϵ������= '01'  AND  ����>20


--��ѯ01ϵ��ѧ�������䲻����20���ѧ��,������1�������򣨼�������ֻ���ڶ����ղ�ѯ������򣬲��ܶ��м������򣩡�
SELECT *  FROM ѧ��  WHERE ϵ������= '01' 
UNION
SELECT *  FROM ѧ�� WHERE ����<=20  order by 1

--�����Ӳ�ѯ��--------------------------------------------------------
create table ��Ʒ
(
	��Ʒ��� char(9) not null ,
	��Ʒ���� varchar(20)  not null ,
)
go
create table ��Ʒ����
(
	��Ʒ��� char(9) not null ,
	���� int 
)
go
insert ��Ʒ values('001','������')
 insert ��Ʒ values('002','����')
 insert ��Ʒ values('003','���')
insert ��Ʒ���� values('001','25')
insert ��Ʒ���� values('003','35')
insert ��Ʒ���� values('005','30')

select ��Ʒ.��Ʒ���,��Ʒ.��Ʒ����,��Ʒ����.����
from ��Ʒ left join ��Ʒ����
on ��Ʒ.��Ʒ���=��Ʒ����.��Ʒ���

select ��Ʒ����.��Ʒ���,��Ʒ.��Ʒ����,��Ʒ����.���� 
from ��Ʒ right join ��Ʒ����
on ��Ʒ.��Ʒ���=��Ʒ����.��Ʒ���

select ��Ʒ.��Ʒ���,��Ʒ.��Ʒ����,��Ʒ����.���� 
from ��Ʒ full join ��Ʒ����
on ��Ʒ.��Ʒ���=��Ʒ����.��Ʒ���

--ͬ�ϣ�ע����������
select ��Ʒ����.��Ʒ���, ��Ʒ����, ����
from ��Ʒ left join ��Ʒ����
on ��Ʒ.��Ʒ��� = ��Ʒ����.��Ʒ��� 


select ��Ʒ����.��Ʒ���, ��Ʒ����, ����
from ��Ʒ right join ��Ʒ����
on ��Ʒ.��Ʒ��� = ��Ʒ����.��Ʒ��� 

select ��Ʒ����.��Ʒ���, ��Ʒ����, ����
from ��Ʒ full join ��Ʒ����
on ��Ʒ.��Ʒ��� = ��Ʒ����.��Ʒ���


--5.���ݵĶ���ѯ���Ӳ�ѯ

--��ѯ�������ڴ������»���ѧ����ѧ�š�������
select ѧ��,����,�������� from ѧ�� where �������� >
	(select �������� from ѧ�� where ����='���»�' )

--��ѯ�γ̺�Ϊc1������ѧ����ѧ�š�������
--��Ҫ��ʹ���Ӳ�ѯ�����Ӳ�ѯ���ַ�����ע�⣺�����ѡ����Ϣ��ѧ����Ϣ�ֱ���ѧ����ѡ�γɼ��������С���

select ѧ��,���� from ѧ�� where ѧ��=any
	(select ѧ�� from ѡ�γɼ� where �γ̺�='c1' )

select ѧ��.ѧ��,����,�γ̺� from ѧ�� inner join ѡ�γɼ� 
on �γ̺�='c1' and ѧ��.ѧ��=ѡ�γɼ�.ѧ��

select ѧ��.ѧ��,ѧ��.����,ѡ�γɼ�.�γ̺� from ѧ��,ѡ�γɼ�
where �γ̺�='c1' and ѧ��.ѧ��= ѡ�γɼ�.ѧ��

--����ʹ��IN���桰=ANY����
select ѧ��,���� from ѧ�� where ѧ�� in
	(select ѧ�� from ѡ�γɼ� where �γ̺�='c1' )

--��ѯ����ϵ�б�02ϵ����ѧ���߿��������ߵ�ѧ���������͸߿�������
select ����,�߿�����,ϵ������ from ѧ�� where �߿�����>all
	(select �߿����� from ѧ�� where ϵ������='02')

select ����,�߿�����,ϵ������ from ѧ�� where �߿�����>
	(select max(�߿�����)from ѧ�� where ϵ������='02')
AND ϵ������!= '02'

--��ѯ����ϵ�б�02ϵĳһѧ���߿������ߵ�ѧ����������ϵ������͸߿�������
select  ����,�߿�����,ϵ������ from ѧ�� where �߿�����>any
	(select �߿����� from ѧ�� where ϵ������='02')

--��ѯ�߿���������ѧ��Ϊ01,04������һ����ѧ����ѧ�š��������߿�����

select ѧ��,����,�߿����� from ѧ�� where �߿�����>any
	(select �߿����� from ѧ�� where ѧ�� in('010101000001','010101000004'))

--��ѯ�߿���������ѧ��Ϊ01��04��ѧ����ѧ�š��������߿�����
select ѧ��,����,�߿����� from ѧ�� where �߿�����>all
	(select �߿����� from ѧ�� where ѧ�� in('010101000001','010101000004'))

--��ѯ�߿��������ڵ���ѧ��Ϊ01,04������һ����ѧ����ѧ�š��������߿�����

select ѧ��,����,�߿����� from ѧ�� where �߿�����>=any
	(select �߿����� from ѧ�� where ѧ�� in('010101000001','010101000004'))
	
	
	--	��ѯ�߿��������ڵ���ѧ��Ϊ13,14������һ����ѧ����ѧ�š��������߿�������
select ѧ��,����, �߿����� from ѧ��
where �߿����� >any
(select �߿����� from ѧ�� where ѧ�� like '%13' or ѧ�� like '%14')

--��ѯ�߿��������ڵ���ѧ��Ϊ01��04��ѧ����ѧ�š��������߿�������
select ѧ��,����,�߿����� from ѧ�� where �߿�����>=all
	(select �߿����� from ѧ�� where ѧ�� in('010101000001','010101000004'))

--ʹ��exist����ѯ�γ̺�Ϊc1������ѧ����ѧ�š�������
--ע�⣺exist����е��Ӳ�ѯֻ������٣�Ϊ��ʱ����ִ��where existsǰ����䣬��select ѧ��,���� from ѧ����ȫ�����ݣ������и�������������ѧ��=ѧ��.ѧ�š�
select ѧ��,���� from ѧ�� where exists
	(select *from ѡ�γɼ� where �γ̺�='c1'and ѧ��=ѧ��.ѧ��)

select ѧ��,���� from ѧ�� where not exists
	(select *from ѡ�γɼ� where �γ̺�='c1'and ѧ��=ѧ��.ѧ��)

select ѧ��,���� from ѧ�� where ѧ��=any
	(select ѧ�� from ѡ�γɼ� where �γ̺�='c1' )
	
--��ѯû��ѡ��1�ſγ̵�ѧ��������(��������������ʵ��) 

SELECT ���� FROM ѧ����
     WHERE NOT EXISTS (SELECT * FROM ѡ�γɼ�
             WHERE ѡ�γɼ�.ѧ�� = ѧ����.ѧ�� and �γ̺�='c1')
             
select ѧ��,���� from ѧ����
where ѧ�� not in
(select ѧ�� from ѡ�γɼ� where �γ̺�='c1')

--��ѯѡ�α��ѧ������ÿλѧ����ѧ�ţ�������ƽ���ɼ�
select ѡ�γɼ�.ѧ��,����, AVG(�ɼ�) as ƽ���ɼ� from ѧ����,ѡ�γɼ�
where ѧ����.ѧ��=ѡ�γɼ�.ѧ��
group by ѡ�γɼ�.ѧ��,����



--------------ʵ���� ����---------------------------------------------------

--1. ��������

--����ϵ�����ϵ�����ƷǾۼ�������
create nonclustered index id_xibu on ϵ��(ϵ������)

--����רҵ���רҵ���Ƶ�Ψһ������
create unique index id_zhuanye on רҵ(רҵ����)

--����ѧ�����ѧ�ź�������Ψһ�ۼ�������������ѧ�Ž������У�
create unique clustered index id_xuesheng on ѧ��(ѧ�� desc,����)

--2. �鿴����
exec sp_helpindex ϵ��

exec sp_helpindex רҵ

exec sp_helpindex ѧ��

--3��������ɾ��
drop index ϵ��.id_xibu

drop index רҵ.id_zhuanye

drop index ѧ��.id_xuesheng


--ʵ���� ��ͼ---------------------------------------------------


--1����ͼ�Ĵ���

--����ѧ����ѧ�š��������༶���ơ�רҵ���ơ�ϵ��������ͼ
create view view_3
as
select ѧ��.ѧ��,ѧ��.����,ϵ��.ϵ������,רҵ.רҵ����,�༶.�༶����
from ϵ��,רҵ,�༶,ѧ��
where  ѧ��.ϵ������=ϵ��.ϵ������ and ѧ��.רҵ����=רҵ.רҵ���� and ѧ��.�༶����=�༶.�༶����

--����һ���������1��ϵѧ���������ͼ

create view �������1��
as
select ѧ��.ѧ��,ѧ��.����,�༶.�༶����
from �༶,ѧ��
where ѧ��.�༶����=�༶.�༶���� and �༶.�༶����='�������1��'

--��������ϵ���߿�������ƽ���ֵ���ͼ��Ҫ����ʾϵ�����ƺ�ϵ��ƽ���֡�	
	create view v_DepGrade3(ϵ������,ϵ��ƽ����)
	as
	select top(20) ϵ������, AVG(�߿�����) from ѧ����,ϵ����
	where ѧ����.ϵ������=ϵ����.ϵ������
	group by ѧ����.ϵ������,ϵ������
	order by AVG(�߿�����)


--2.�鿴��ͼ
exec sp_helptext View_3

--3.ɾ����ͼ

drop view View_4


--ʵ����	���ݿ���---------------------------------------------------

--1�����塢�޸ĺͳ������ݿ���û�

--����һ����¼��Ϊ��Andrew�������ݿ��û�

CREATE LOGIN Andrew123
    WITH PASSWORD = '123'
    
grant create table 
to Andrew123

USE db_students
CREATE USER Andrew123 FOR LOGIN Andrew123


--�޸�Andrew123���û���������

ALTER LOGIN Andrew123 WITH PASSWORD = 'abc12345'  OLD_PASSWORD = '123'

ALTER LOGIN Andrew123 WITH NAME = AndrewAndrew

ALTER USER Andrew123  WITH NAME = AndrewAndrew ;


--ɾ��Andrew�û��͵�¼��
DROP LOGIN AndrewAndrew

drop user AndrewAndrew


 Grant CREATE table 
 to AndrewAndrew
/*  
 Create Table AndrewAndrew.ϵ��1
(
	ϵ������ char(6) not null primary key,
	ϵ������ varchar(30) not null,
	ϵ����	 char(8) 
)


CREATE TABLE [dbo].[��Ʒ����](
	[��Ʒ���] [char](9) NOT NULL,
	[����] [int] NULL
) ON [PRIMARY]
*/

--2.Ȩ�����ɫ���������ջ�

--����ѧ������޸�ѧ�źͲ�ѯȨ�������û�AndrewAndrew
grant update (ѧ��),select on ѧ���� to AndrewAndrew

--���������ϵͳȨ�����������û�
grant create table to public

--����ѯѧ������޸ĸ߿�������Ȩ������AndrewAndrew,��������Ȩ�����������û���
GRANT SELECT,UPDATE(�߿�����)
ON ѧ��
TO AndrewAndrew
WITH GRANT OPTION

GRANT SELECT,UPDATE(�߿�����)
ON ѧ��
TO test

--�����û�AndrewAndrew���޸�ѧ��Ȩ��
revoke update(ѧ��) on ѧ�� from AndrewAndrew

--���������û��Ĵ������ϵͳȨ��
revoke create table from public

--ʵ����	�洢�����봥����---------------------------------------------------

--1.	������ִ�С��޸ġ�ɾ���򵥵Ĵ洢����

--��SQL Server ��ʹ�ò�ѯ������ִ��SQL��䣬Ϊѧ������һ���洢����
create proc student_name
as
select ���� from  ѧ����

exec student_name

--����һ����ѯ�洢���̣��ô洢���̷���ѡ��c1�γ̵�ѧ����ѧ�ź��������ɼ���
create procedure student_name_score
as
select ѧ��.ѧ��,����, �ɼ�
from ѧ��, ѡ�γɼ�
where ѧ��.ѧ��=ѡ�γɼ�.ѧ�� and �γ̺�='c1'

exec student_name_score

--Ϊѧ������һ���洢���̣������Ϊѧ�����Ա��ϵ������
create proc student_sex_dep
@sex varchar(10),
@id varchar(10)
as
select ����,�Ա�,ϵ������ from  ѧ�� where �Ա�=@sex and ϵ������=@id

execute student_sex_dep '��','02'


-- ����һ���洢���̣�������һ�����������ڽ���ѧ�ţ���ʾ��ѧ�����������γ̺źͳɼ���

create procedure student_cno_score
@ѧ�� char(12)
as
select ѧ��.ѧ��,����, �γ̺�,�ɼ�
from ѧ��, ѡ�γɼ�
where ѧ��.ѧ��=ѡ�γɼ�.ѧ�� and ѧ��.ѧ��=@ѧ��

exec student_cno_score '010101000001'

-- �޸�����Ĵ洢����,�Ѳ���"ѧ��"��Ϊ"�γ̺�"
alter proc student_cno_score
@�γ̺� char(12)
as
select ѧ��.ѧ��,����, �γ̺�,�ɼ�
from ѧ��, ѡ�γɼ�
where ѧ��.ѧ��=ѡ�γɼ�.ѧ�� and ѡ�γɼ�.�γ̺�=@�γ̺�

exec student_cno_score 'c1'

--ִ�������´����Ĵ洢���̣������Ϊ���Ա��У���ϵ�����룽02��

execute student
execute student_sex_dep '��','02'


--�鿴�����´����Ĵ洢����
execute sp_helptext student_name
execute sp_depends student_name
execute sp_help student_name

exec student_name


--ɾ�����洴����һ���洢����

drop procedure student_name,student_name_score,student_cno_score

--2. ������ִ�С��޸ġ�ɾ��������

--Ϊרҵ����һ����������Ҫ��Ҫɾ��רҵ���¼ʱ�������רҵ�Ѿ������������ã���Print��������ʾ��Ϣ�����ָ�ԭ�������ݡ�
Create  trigger  delete_zhye    on  רҵ
   for   delete
   As
  If(select count(*)from  �༶ join  deleted  On  �༶.רҵ����=deleted.רҵ����)>0 
    begin
      Print ('��רҵ�ѱ��༶�������ã��㲻����ɾ���˼�¼��ɾ������ֹ')
      Rollback  transaction
    end
 else
    print '��¼��ɾ��'     


create trigger update_zhuanye on רҵ
for update
as
if(select count(*) from ѧ�� join רҵ on ѧ��.רҵ����=רҵ.רҵ����)>0
	begin 
		print('��רҵ�ѱ�ѧ���������ã������޸�')
		Rollback  transaction
	end
else
	print('��¼���޸�') 

--Ϊרҵ����һ����������Ҫ���޸�רҵ����ʱ����Print��������ʾ��Ϣ�����ָ�ԭ�������ݡ�

Create  trigger  update_zymc  On רҵ
  For  update 
  As
  If update(רҵ����)
   Begin
    Print '�����޸�רҵ����'
    rollback  transaction
   End


--ʹ��SQL Ϊ��Ʒ����һ��inserted�����������������������ݣ�ִ�й۲�����
create trigger t1
ON ��Ʒ
FOR  insert
as
declare @a char(10)
select @a=��Ʒ��� from inserted
insert into ��Ʒ���� values(@a, 0)

--Ϊ���洴���Ĵ������������ݣ�ִ�й۲�����
select * from ��Ʒ
select * from ��Ʒ����

insert ��Ʒ values('04','����')
insert ��Ʒ values('06','����ͷ')

--Ϊ��Ʒ����һ��deleteed������������������ɾ�����ݣ�ִ�й۲���
create trigger t2
on ��Ʒ
for delete
as
declare @a char(10)
select @a=��Ʒ��� from deleted
delete ��Ʒ���� where ��Ʒ���=@a

delete ��Ʒ where ��Ʒ���='004'

--�鿴��������Ϣ
exec sp_helptrigger ��Ʒ

--ɾ��������
drop trigger t1,t2


--ʵ��� ����---------------------------------------------------

--2����ѧ����
--���ؾ���ֵ
select ABS (-8)

--���ش��ڻ�����������ֵ���С����
select CEILING(5.6)
select CEILING(-5.6)

--piֵ
select	PI ()

--����x��y�η�
select   POWER (2,3)

--����~1֮��������
select   RAND ()

--3�� ���ú���

--��ȡ��ǰ���ݿ�汾
SELECT @@VERSION 

--��ǰ����	
SELECT @@LANGUAGE 

--4��ʱ�亯��
select getdate()   --��ǰʱ��
select day(getdate())   --ȡ����
select month(getdate())   --ȡ����
select year(getdate())   --ȡ����
select dateadd(d,3,getdate()) as wawa_dateadd --������
select datename(d,'2010-07-15')   --ȡ��ʱ���ĳһ����

--5���ַ�������
Select LEN('str1111')--�����ַ������ַ�����
Select lower('ABC'),lower('Abc'),upper('Abc'),upper('abc') --ת����Сд
select ltrim('           ���û�пո�')   --ȥ�ո�
select rtrim('�ұ�û�пո�    ') --ȥ�ո�
select ltrim(rtrim('    ���Ҷ�û�пո�    ')) --ȥ�ո�
select left('sql server',3),right('sql server',6) --ȡ�����ȡ��
Select replace('ԭ�ַ���','ԭ','����һ��')--�ַ����滻
Select replicate('go',5)--ָ���Ĵ����ظ��ַ�
select reverse('�����ַ���') --�����ַ�����������
select substring('����һ��ԭ�ַ���',2,3)--ָ����ȡָ���ַ���

--6����������
select ����,rank() over (order by �߿����� desc)as ����,�߿����� from ѧ��
