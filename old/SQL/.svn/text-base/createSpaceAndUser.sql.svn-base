--host del H:\app\FarmerJ\product\11.2.0\dbhome_1\database\dangxiao.dat
spool H:\app\dangxiao.log;
create tablespace dangxiao
datafile 'dangxiao.dat' size 20M
autoextend on next 1M maxsize unlimited;
create user fengjie
  identified by fengjie
default tablespace dangxiao;
alter user fengjie default role all;
grant connect to fengjie;
grant resource to fengjie;
spool out;