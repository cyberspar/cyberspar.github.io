--ʵ��һ �������ݿ�
CREATE  DATABASE  db_student
 ON PRIMARY
(
	NAME= 'db_student.mdf',
	FILENAME= 'D:\Works\Database Samples\db_student.mdf',
	SIZE=3mb,
	MAXSIZE=50mb,
	FILEGROWTH=10%
);

--ʵ��� ��Ļ�������
--1��	���������ͽṹ

--�������ݿ��еĸ�����
Create Table ϵ��
(
	ϵ������ char(6) not null primary key,
	ϵ������ varchar(30) not null,
	ϵ����	 char(8) 
)

Create Table רҵ
(
	רҵ���� char(4) not null primary key,
	רҵ���� varchar(20) not null,
	ϵ������ char(6) constraint con_dep foreign key references ϵ��(ϵ������)
)

Create Table �༶
(
	�༶���� char(9) not null primary key,
	�༶���� varchar(20), 
	רҵ���� char(4) constraint con_maj foreign key references רҵ(רҵ����),
	ϵ������ char(6) constraint con_dep_class foreign key references ϵ��(ϵ������),
	��ע	 varchar(50) 
)

Create Table ѧ��
(
	ѧ�� char(12) not null primary key ,
	���� char(8),
	�Ա� char(2),
	�������� datetime,
	��ѧʱ�� datetime,
	�༶���� char(9) constraint con_class_stu foreign key references �༶(�༶����),
	ϵ������ char(6) constraint con_dep_stu foreign key references ϵ��(ϵ������),
	רҵ���� char(4) constraint con_maj_stu foreign key references רҵ(רҵ����)
)

--�޸�ѧ��������һ����ͥסַ�У�
alter table ѧ�� add ��ַ char(20)

--�����е��������ͣ���ѧ�����е������мӿ�10λ�ַ���ȣ�
alter table ѧ��
alter column ���� char(10)

--���һ������
alter table ѧ�� add ��ע char(20)

--ɾ��һ����
alter table ѧ�� drop column ��ַ 

--ɾ��ѧ�����е�רҵ�����Լ����
alter table ѧ�� drop constraint wz5

--����������ѧ��������ָ���ΪSTUDENT�����ٸĻ�����
sp_rename 'ѧ��','STUDENT'
sp_rename 'STUDENT','ѧ��'

--�������У����༶��ı�ע����Ϊ������
sp_rename '�༶.��ע','����'

--ɾ��һ������ɾ���󲻿ɻָ���
 drop table ѡ�γɼ�

--ɾ������������ݣ�
truncate table �༶

--��������Լ����
 alter table ѧ�� add constraint pk_stu
	primary key clustered (ѧ��)

--�����⽨Լ����
 alter table ѧ�� add constraint wz5
	foreign key (רҵ����) references רҵ(רҵ����)

--����CHECKԼ��,�����Ա�ֻ������Ů.
alter table ѧ��
add constraint css
check(�Ա� in ('��','Ů')) --��Լ�����ʽ�Ա� in ('��','Ů')��

--����CHECKԼ���������Ա�Ĭ��Ϊ��.
alter table ѧ��
add constraint cs default('��') for �Ա� --��Լ�����ʽ�Ա�=('��')��



--ʵ���� ���ݵĻ�������
--1��	���ݵ����.ɾ��.�޸�


--Ϊ���ݿ��еĸ����������
insert ϵ��(ϵ������,ϵ������,ϵ����) values('01','�����ϵ','����') 
go
insert ϵ��(ϵ������,ϵ������,ϵ����) values('02','���ù���ϵ','�ϳ�') 
go
insert ϵ��(ϵ������,ϵ������,ϵ����) values('03','��еϵ','����') 
go
insert ϵ��(ϵ������,ϵ������,ϵ����) values('04','��ѧϵ','����') 
go
 

insert רҵ(רҵ����,רҵ����,ϵ������) values('0101','�������','01')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0102','���繤��','01')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0103','��Ϣ����','01')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0201','���̹���','02')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0202','��������','02')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0301','ģ�߼ӹ�','03')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0302','����һ�廯','03')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0401','Ӧ����ѧ','04')
go
insert רҵ(רҵ����,רҵ����,ϵ������) values('0402','������ѧ','04')
go

insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010101','�������1��','0101','01','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010102','�������2��','0101','01','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010103','���繤��1��','0102','01','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010104','���繤��2��','0102','01','����')
go 
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010105','��Ϣ����1��','0103','01','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010106','���̹���1��','0201','02','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010107','��������1��','0202','02','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010108','ģ�߼ӹ�1��','0301','03','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('010109','Ӧ����ѧ1��','0401','04','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('0101010','������ѧ1��','0402','04','����')
go
insert �༶(�༶����,�༶����,רҵ����,ϵ������,��ע)
values('0101011','������ѧ2��','0402','04','����')

insert ѧ�� values('010101000000','���»�','��','1988-5-5','2010-9-1','010101','01','0101',356)
go
insert ѧ�� values('010101000001','��ѧ��','��','1988-1-4','2010-9-1','010101','01','0101',354)
go
insert ѧ�� values('010101000002','������','Ů','1988-2-1','2010-9-1','010101','01','0101',342)
go
insert ѧ�� values('010101000003','����Ѹ','��','1983-5-3','2010-9-1','010102','01','0101',441)
go
insert ѧ�� values('010101000004','���غ�','Ů','1987-8-6','2010-9-1','010102','01','0101',354)
go
insert ѧ�� values('010101000005','�ֿ���','��','1988-6-6','2010-9-1','010102','01','0101',498)
go
insert ѧ�� values('010101000006','������','Ů','1984-5-3','2010-9-1','010106','02','0201',522)
go
insert ѧ�� values('010101000007','�ܻ���','��','1986-8-6','2010-9-1','010106','02','0201',378)
go
insert ѧ�� values('010101000008','�����','Ů','1988-6-6','2010-9-1','010106','02','0201',365)
go 
insert ѧ�� values('010101000009','������','��','1984-5-3','2010-9-1','010108','03','0301',421)
go
insert ѧ�� values('010101000010','κ��','��','1986-8-6','2010-9-1','010108','03','0301',574)
go
insert ѧ�� values('010101000011','����','��','1988-6-6','2010-9-1','010108','03','0301',452)
go 
insert ѧ�� values('010101000012','����Ӣ','Ů','1988-5-3','2010-9-1','0101011','04','0402',354)
go
insert ѧ�� values('010101000013','��ʥ��','��','1989-8-6','2010-9-1','0101011','04','0402',324)
go
insert ѧ�� values('010101000014','���Ⱥ','��','1989-2-9','2010-9-1','0101011','04','0402',321)
go 


--����ѡ�γɼ������ѧ�ţ��γ̺źͳɼ������С��ö��в�����佫ѧ�����е�ѧ�Ÿ��Ƶ�ѡ�γɼ���
create table ѡ�γɼ�
(
	ѧ�� char(12) not null primary key ,
	�γ̺� char(10),
	�ɼ�   int
)

insert into ѡ�γɼ� (ѧ��)
select ѧ�� from ѧ��

--���������޸ı��еĸ����¼��
update ѧ�� set �Ա�='��' where ����='�����'
update ѧ�� set ϵ������='01' where ����='�����'


--Ϊѧ�������������ֱ������λѧ�������䣻
alter table ѧ�� add ���� int

--�޸�����Ϊ18���ѧ������Ϊ20�����ڿ��ӻ��������ֶ����ѧ�����䣩
update ѧ�� set ����=18
update ѧ�� set ����=20 where ����=18

--�޸�����ѧ������ѧʱ�䡢�༶����ȣ�
update ѧ�� set ��ѧʱ��='2010-9-1'
update ѧ�� set �༶����='010108' where רҵ����='0402'


--��������ɾ�����е����ü�¼��
insert ѧ��(ѧ��) values('010101000015')
 
delete ѧ�� where ���� is null

---��ձ�������
truncate table [����]




create table st_table
(
	ѧ�� int not null identity,
	���� char(8) not null,
	רҵ���� varchar(50) not null,
	ϵ������ char(2) not null,
	��ע varchar(50),
	�߿����� int 
)



insert st_table values('��ѧ��','����','01','û��','411')
insert st_table values('���»�','�����','02','û��','412')
insert st_table values('���','�����','01','û��','413')
insert st_table values('��ӽ��','����','02','û��','431')
insert st_table values('��ǧ��','�����','01','û��','465')
insert st_table values('���','����','02','û��','485')
insert st_table values('������','����','01','û��','468')
insert st_table values('֣Դ','�����','02','û��','510')
insert st_table values('�³���','����','01','û��','550')
insert st_table values('���غ�','�����','02','û��','421')
insert st_table values('�ͷ�','����','01','û��','423')
insert st_table values('֣����','����','02','û��','411')
insert st_table values('�ֿ���','�����','01','û��','511')
insert st_table values('��Ȫ','�����','01','û��','500')
insert st_table values('������','����','02','û��','400')
insert st_table values('��ƷԴ','����','02','û��','589')
insert st_table values('����ΰ','�����','02','û��','530')
insert st_table values('�����','����','01','û��','520')
insert st_table values('��С��','���ʽ���','02','û��','512')
insert st_table values('����Ӣ','֤ȯ�ڻ�','02','û��','421')
insert st_table values('������','���ز�����','01','û��','428')
insert st_table values('̷ӽ��','���ز�����','02','û��','498')
insert st_table values('��ѧ��','֤ȯ�ڻ�','01','û��','454')
insert st_table values('������','֤ȯ�ڻ�','02','û��','515')
insert st_table values('�ܴ���','���ز�����','01','û��','532')
insert st_table values('���ǳ�','���ʽ���','02','û��','423')
insert st_table values('�κ���','���ز�����','02','û��','477')
insert st_table values('�Գ���','���ʽ���','02','û��','488')
insert st_table values('��־��','���ʽ���','01','û��','582')
insert st_table values('Ҷٻ��','���ز�����','01','û��','495')
insert st_table values('Ҷ����','���ز�����','02','û��','499')
insert st_table values('������','֤ȯ�ڻ�','02','û��','531')
insert st_table values('����','���ʽ���','01','û��','531')
insert st_table values('������','֤ȯ�ڻ�','01','û��','424')
insert st_table values('������','֤ȯ�ڻ�','02','û��','412')
insert st_table values('̫���ֶ�','֤ȯ�ڻ�','02','û��','423')

