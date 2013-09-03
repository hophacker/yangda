create or replace procedure
	add_jud(q_text in varchar2, q_jud in char, q_type in char)
is 
	que_num int;
begin
	select num into que_num from numClass where cla='que';
	que_num := que_num+1;
	update numClass set num=que_num where cla='que';
	insert into question values(que_num, 'p', q_text, q_jud, '', '', '', '', q_type);
end;
/
create or replace procedure
	add_ans(q_text in varchar2, q_ans in char, q_type in char)
is 
	que_num int;
begin
	select num into que_num from numClass where cla='que';
	que_num := que_num+1;
	update numClass set num=que_num where cla='que';
	insert into question values(que_num, 'j', q_text, '', q_ans, '', '', '', q_type);
end;
/
create or replace procedure
	add_sel(q_text in varchar2, q_A in varchar2, q_B in varchar2, q_C in varchar2, q_D in varchar2, q_sel in char, q_type in char)
is 
	que_num int;
begin
	select num into que_num from numClass where cla='que';
	que_num := que_num+1;
	update numClass set num=que_num where cla='que';
	insert into question values(que_num, 'x', q_text, q_sel, q_A, q_B, q_C, q_D, q_type);
end;
/
create or replace procedure
	get_jud(question_id in int, que out varchar2, ans out char)
is 
begin
	select q_text, q_choose into que, ans from question where q_id=question_id ;
end;
/
create or replace procedure
	get_sel(question_id in int, que out varchar2, selA out varchar2, selB out varchar2, selC out varchar2, selD out varchar2, ans out char)
is 
begin
	select q_text, q_A, q_B, q_C, q_D, q_choose into que, selA, selB, selC, selD, ans from question where q_id=question_id;
end;
/	
create or replace procedure
	add_info(titleN in varchar2, infoN in varchar2)
is 
	info_num int;
begin
	select num into info_num from numClass where cla='infoNum';
	info_num := info_num+1;
	update numClass set num=info_num where cla='infoNum';
	insert into infoBroad values(info_num, titleN, infoN, sysdate);
end;
/
create or replace procedure
	get_ans(question_id in int, que out varchar2)
is 
begin
	select q_text into que from question where q_id=question_id ;
end;
/
create or replace procedure 
	insert_dept(dept_name in varchar2)
is 
	dept_num int;
begin
	select num into dept_num from numClass where cla='deptNum';
	dept_num := dept_num+1;
	update numClass set num=dept_num where cla='deptNum';
	insert into department values(dept_num, dept_name, -1);
	insert into test_time (dept_id) values(dept_num);
end;
/
create or replace procedure 
	del_dept(dept in int)
is 
begin
	delete from student where dept_id=dept;
	delete from dept_manager where dept_id=dept;
	delete from test_time where dept_id=dept;
	delete from department where dept_id=dept;
end;
/
create or replace procedure 
	insert_testPaper(ext in varchar2, name in varchar2, des varchar2, id_out out int)
is 
	testPaperNum int;
begin
	select num into testPaperNum from numClass where cla='testPaperNum';
	testPaperNum := testPaperNum+1;
	update numClass set num=testPaperNum where cla='testPaperNum';
	insert into testPaper 
	(paper_id,paper_ext,paper_name,paper_des) values(testPaperNum, ext, name, des);
	id_out := testPaperNum;
end;
/