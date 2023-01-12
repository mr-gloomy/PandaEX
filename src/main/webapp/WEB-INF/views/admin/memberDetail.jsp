<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp"%>


<%-- ${uvo.user_id } --%>



<div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="fa fa-text-width"></i>

              <h3 class="box-title">사용자 아이디 : ${uvo.user_id }</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<div>${uvo.user_nick }</div>
            	<div>${uvo.user_email }</div>
            	<div>${uvo.user_tel }</div>
            
            
            
            
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>