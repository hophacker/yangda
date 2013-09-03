  @E:\dangxiao\oracle
drop table ansQue;
drop table score;
drop table school_manager;
drop table dept_manager;
drop table test_time;
drop table question;
drop table student;
drop table department;
drop table numClass;
drop table infoBroad;
drop table testPaper;
  
                                                                                
create table school_manager
(
  m_user varchar2(25) not null unique,
  m_pwd varchar2(25) not null
);
insert into school_manager values('dangxiao', 'dangxiao');
                                                                                
create table department 
(
  dept_id int primary key,
  dept_name varchar2(60)  not null unique,
  paper_id int default( 1)
  ���� 1˵��û��ʹ��
);

                                                                                
create table dept_manager
(
  m_user varchar2(25) not null unique,
  m_pwd varchar2(25) not null,
  m_name varchar2(25) not null, 
  dept_id int not null, 
  constraint dept_manager_dept_fk foreign key(dept_id) references department  foreign
);
                                                                                
create table student 
(
  s_user varchar2(25)  primary key,   �û���
  s_id varchar2(25),   ѧ��
  s_pwd varchar2(25) not null,
  dept_id int not null,
  s_name varchar2(25) not null,
  s_date_year char(5) not null,
  s_date_month char(5) not null,
  s_date_day char(5) not null,  
  s_class varchar2(25) not null,
  s_mail varchar2(40),
  score_1 int DEFAULT( 1),     1 representsû�μӿ��� 
  score_2 int DEFAULT( 1),
  score_3 int DEFAULT( 1),
  ������
  score_ans int DEFAULT( 1),
  score_type int DEFAULT(0),
  end_sec int DEFAULT( 1), 
   0 no exam is admitted
   1~3  pri||mid||adv exam is admitted
    1~ 3   exam has been taken
  constraint student_dept_fk foreign key(dept_id) references department
);
                                                                                
create table score
(
  s_user varchar2(25),
  s_time varchar2(20),
  s_score int,
  s_type int,
  constraint score_student_fk foreign key(s_user) references student  foreign
);


create table ansQue
(	
  s_user varchar2(25),
  q_id int,
  q_ans varchar2(4000),
  q_score int
);

create table test_time
(
  dept_id int primary key,
  pri_begin_1 char(20) default(''),
  pri_begin_2 char(20) default(''),
  pri_begin_3 char(20) default(''),
  adv_begin_1 char(20) default(''),
  adv_begin_2 char(20) default(''),
  adv_begin_3 char(20) default(''),
  pri_inter char(6) default(''),
  adv_inter char(6) default(''),
  constraint test_time_dept_fk foreign key(dept_id) references department
);

                                                                                
create table question
(
  q_id int not null unique,
  q_type char(1),  'x'uanze || 'p'uanduan ||'j'ieda 
  q_text varchar2(500), 
  q_choose char(1),   'YNABCD'
  q_A varchar2(1000),
  q_B varchar2(400),
  q_C varchar2(400),
  q_D varchar2(400),
  q_deg char(1)
);
create table numClass
(	
  cla varchar2(20),
  num int
);

insert into numClass values('que', 0);
  ������Ŀ
insert into numClass values('priSelNum', 0);
  �趨�߼�ѡ������Ŀ
insert into numClass values('advSelNum',  0);
  �趨�ͳ���ѡ������Ŀ
insert into numClass values('priJudNum', 0);
  �趨�߼��ж�����Ŀ
insert into numClass values('advJudNum', 0);
  �趨�����ж�����Ŀ
insert into numClass values('ansNum', 0);
  �趨�߼��������Ŀ
insert into numClass values('selWei', 0);
  ѡ�����ֵ
insert into numClass values('judWei', 0);
  �ж����ֵ
insert into numClass values('infoNum', 0);
  ֪ͨ��id����
insert into numClass values('validTime', 0);
  ��Ч���Ե�½ʱ��
insert into numClass values('deptNum', 27);
  Ժϵid����
insert into numClass values('testPaperNum', 0);
  �м����Ծ��id���� 
insert into numClass values('scoreSea', 0);
insert into numClass values('canDownMid', 0);
                                                   
create table infoBroad
(
  info_id int not null unique,
  title varchar2(200),
  info varchar2(800),
  info_date Date
);
create table testPaper
(
  paper_id int not null unique,
  paper_ext varchar2(10),
    paper_id.paper_ext��ʵ�ʴ�����ļ���
  paper_name varchar2(20),
  paper_des varchar2(400),
  user_info varchar (50) default('0000000000000000000000000000000000000000')
	   ����û��Ժϵʹ��
);