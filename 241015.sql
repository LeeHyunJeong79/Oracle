SQLȰ�� ���� 1

create table first_half(
    shipment_id number(5) not null,
    flavor varchar(30) not null primary key,
    total_order number(10) not null);
    
insert into first_half values(101,'chocolate',3200);
insert into first_half values(102,'vanilla',2800);
insert into first_half values(103,'mint_chocolate',1700);
insert into first_half values(104,'caramel',2600);
insert into first_half values(105,'white_chocolate',3100);
insert into first_half values(106,'peach',2450);
insert into first_half values(107,'watermelon',2150);
insert into first_half values(108,'mango',2900);
insert into first_half values(109,'strawberry',3100);
insert into first_half values(110,'melon',3150);
insert into first_half values(111,'orange',2900);
insert into first_half values(112,'pineapple',2900);

create table icecream_info(
    flavor varchar(30) not null primary key,
    ingredient_type varchar(30) not null);

insert into icecream_info values('chocolate','sugar_based');
insert into icecream_info values('vanilla','sugar_based');
insert into icecream_info values('mint_chocolate','sugar_based');
insert into icecream_info values('caramel','sugar_based');
insert into icecream_info values('white_chocolate','sugar_based');
insert into icecream_info values('peach','fruit_based');
insert into icecream_info values('watermelon','fruit_based');
insert into icecream_info values('mango','fruit_based');
insert into icecream_info values('strawberry','fruit_based');
insert into icecream_info values('melon','fruit_based');
insert into icecream_info values('orange','fruit_based');
insert into icecream_info values('pineapple','fruit_based');

select * from icecream_info;
select * from first_half;

//����1 ��ݱ� ���̽�ũ�� �� �ֹ����� 3000���� �����鼭 ���̽�ũ���� �ּ����� ������ ���̽�ũ���� ���� �� �ֹ����� ū ������� ��ȸ�ϴ� ��
select f.flavor as �� from first_half f join icecream_info i on f.flavor=i.flavor
   where f.total_order>3000 and i.ingredient_type='fruit_based' order by f.total_order desc;

select f.flavor as �� from first_half f , icecream_info i
   where f.flavor=i.flavor and f.total_order>3000 and i.ingredient_type='fruit_based' order by f.total_order desc;
   
//����2 ���̽�ũ�� ������ ���̽�ũ�� ���� ��ݱ� �� �ֹ����� �հ谡 ��µǵ��� ��ȸ�ϴ� ��
select sum(total_order) as ���ֹ����հ� from first_half;

//SQLȰ�� ���� 2
create table book(book_id number(5) not null, category varchar(10) not null, 
    author_id number(5) not null, price number(10) not null,
    published_date date not null);
    
insert into book values(1,'�ι�',1,10000,'2020-01-01');
insert into book values(1,'����',1,90000,'2021-04-11');
insert into book values(1,'����',2,110000,'2021-02-05');
insert into book values(1,'�ι�',3,10000,'2021-03-15');
insert into book values(1,'��Ȱ',2,12000,'2021-01-10');

create table author(author_id number(5) not null, author_name varchar(10) not null);

insert into author values(1,'ȫ�浿');
insert into author values(2,'�迵ȣ');
insert into author values(3,'������');
insert into author values(4,'��յ�');

select * from book;
select * from author;

//����1
select book_id, published_date from book
   where to_char(published_date,'yyyy')='2021' and category='�ι�';

//����2 
select book_id,author_name, published_date from book b, author a where b.author_id=a.author_id;

