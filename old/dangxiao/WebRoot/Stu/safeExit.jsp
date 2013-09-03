<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	session.removeAttribute("dxU1");
	session.removeAttribute("dxP1");
	session.removeAttribute("s_name");
	session.removeAttribute("s_user");
	session.removeAttribute("biryear");
	session.removeAttribute("birmonth");
	session.removeAttribute("birday");
	session.removeAttribute("sclass");
	session.removeAttribute("semail");
	session.removeAttribute("s_id");
	session.removeAttribute("score_type");
	session.removeAttribute("sdept_id");
	session.removeAttribute("dept_name");
%>
<script>window.location.href='/Login.html';</script>