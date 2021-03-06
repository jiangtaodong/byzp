<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%-- jstl --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

    <%--内部引入css--%>
   <%-- <script type="text/css">

    </script>--%>

    <title>教务管理系统</title>

    <%--homepage-admin.css引入--%>
   <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homepage-admin.css">--%>
    <%-- EasyUi --%>
    <%-- 部署war包，css、javascript引用地址需加 ${pageContext.request.contextPath} --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>

    <%-- digital-clock.js --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\js\jsled\css\demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\js\jsled\css\normalize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\js\jsled\css\style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}\js\jsled\js\digital-clock.js"></script>

    <script type="text/javascript">
        $(function(){

            alert("教务管理系统");

            $('#cc').combobox({
                url:'selectallcity',
                valueField:'cityname',
                textField:'cityname',
                limitToList:true,
                onChange: function (cityname) {

                    $("#weathertable").children().remove()

                    $.ajax({

                        url: "selectweatherbycityname",
                        type: "post",
                        data: {"cityname":cityname},
                        dataType: "text",
                        success:function (data) {

                            alert("selectweatherbycityname成功！" + data);

                            var dataobj = eval("(" + data + ")");

                            $('#weathertable').append(
                                '<tr>' +
                                '<td>' + '城市' + '</td>' +
                                '<td>' + '天气详情' + '</td>' +
                                '<td>' + '最高温度' + '</td>' +
                                '<td>' + '最低温度' + '</td>' +
                                '<td>' + '温度实况' + '</td>' +
                                '<td>' + '风向详情' + '</td>' +
                                '<td>' + '风向' + '</td>' +
                                '<td>' + '强风等级' + '</td>' +
                                '<td>' + '空气湿度' + '</td>' +
                                '<td>' + '更新时间' + '</td>' +
                                '</tr>'
                            )

                            $.each(dataobj,function (index,data) {

                                $('#weathertable').last().append(
                                    '<tr>' +
                                    '<td>' + data.cityname + '</td>' +
                                    '<td>' + data.stateDetailed + '</td>' +
                                    '<td>' + data.tem1 + '</td>' +
                                    '<td>' + data.tem2 + '</td>' +
                                    '<td>' + data.temNow + '</td>' +
                                    '<td>' + data.windState + '</td>' +
                                    '<td>' + data.windDir + '</td>' +
                                    '<td>' + data.windPower + '</td>' +
                                    '<td>' + data.humidity + '</td>' +
                                    '<td>' + data.inserttime + '</td>' +
                                    '</tr>'
                                )

                            })

                        },
                        error:function () {

                            alert("selectweatherbycityname失败！");

                        }

                    })

                }

            });

        });

        function yonghuzhuce() {

            $("#cityshuju").remove()

            $('#tt').tabs({
                fit: true,
                border: true,
                pill:true,
            });

            $('#tt').tabs('add', {
                id:'tianjia',
                title: '用户注册',
                fit: true,
                closable: true,
                tools: [{
                    iconCls: 'icon-mini-refresh',
                    handler: function () {
                        alert('refresh');
                    }
                }]
            });

            $('#tianjia').append(
                '<form action="insertuser" method="post" enctype="multipart/form-data">' +
                '<table align="center" style="margin-top: 5%;color: black">' +
                '<tr>' +
                '<td>' + '姓名：' + '</td>' +
                '<td>' + '<input style="width:200px" name="name" type="text">' + '</td>'+
                '</tr>' +
                '<tr>' +
                '<td>' + '性别：' + '</td>' +
                '<td>' + '男' +
                '<input type="radio" name="gender" value="男" checked="checked">' + '&nbsp&nbsp&nbsp&nbsp' + '女' +
                '<input type="radio" name="gender" value="女">' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>' + '年龄：' + '</td>' +
                '<td>' +
                '<select name="age">' +
                '<option>' + '---请选择---' + '</option>' +
                '</select>' +
                '</td>'+
                '</tr>' +
                '<tr>' +
                '<td>' + '所在班级：' + '</td>' +
                '<td>' + '<input style="width:200px" name="classes" type="text">' + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>' + '工号or学号：' + '</td>' +
                '<td>' + '<input style="width:200px" name="identity_number" type="text">' + '</td>'+
                '</tr>' +
                '<tr>' +
                '<td>' + '身份性质：' + '</td>' +
                '<td>' +
                '<select name="identity">' +
                '<option>' + '---请选择---' + '</option>' +
                '<option>' + '老师' + '</option>' +
                '<option>' + '学生' + '</option>' +
                '</select>' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>' + '地址：' + '</td>' +
                '<td>' + '<input style="width:200px" name="address" type="text">' + '</td>'+
                '</tr>' +
                '<tr>' +
                '<td>' + '电话：' + '</td>' +
                '<td>' + '<input style="width:200px" name="phone" type="text">' + '</td>'+
                '</tr>' +
                '<tr>' +
                '<td>' + '照片：' + '</td>' +
                '<td>' + '<input style="width:200px" type="file" name="pictureFile">' + '</td>'+
                '</tr>' +
                '<tr>' +
                '<td>' + '</td>' +
                '<td>' + '<input type="reset" value="重置">' + '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' + '<input type="submit" value="提交">' + '</td>'
                + '</tr>'
                + '</table>'
                + '</form>'
            );

            $("#btn1").attr("onclick"," ");

            /*alert($('div#tt').children().last().children().last().html());*/

            for(var i = 10; i <= 100; i++){

                $("select[name='age']").append('<option style="text-align: center">' + i + '</option>')

            }

        }

        function mimaxiugai() {

            $("#cityshuju").remove()

            $('#dg').remove();

            $('#tt').tabs({
                fit: true,
                border: true,
                pill:true,
            });

            $('#tt').tabs('add', {
                id:'xiugai',
                title: '密码修改',
                fit: true,
                closable: true,
                tools: [{
                    iconCls: 'icon-mini-refresh',
                    handler: function () {
                        alert('refresh');
                    }
                }]
            });

            var loginusername = $("#loginusername").text();

            $('#xiugai').append(
                '<form id="updatepassword" action="updatepassword" method="post">' +
                    '<table align="center" style="margin-top: 5%;color: black">' +
                        '<tr>' +
                            '<td>' + '新密码：' + '</td>' +
                            '<td>' + '<input name="password" type="password" placeholder="请输入新密码">' + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td>' + '再次输入新密码：' + '</td>' +
                            '<td>' + '<input name="passwordagain" type="password" placeholder="请再次输入新密码">' + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td>' + '</td>' +
                            '<td>' + '&nbsp' +
                                '<input type="reset" value="重置">' + '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' +
                                '<input type="button" value="提交" onclick="changepassword()">' +
                            '</td>' +
                        '</tr>'
                     + '</table>'
                + '</form>'
            );

            $("#btn2").attr("onclick"," ");

            /*alert($('div#tt').children().last().children().last().html());*/

                $("input[name='password']").blur(function(){

                    if($("input[name='password']").val().length < 6){

                        alert("密码长度不应小于6位！");

                    }

                });

        }

        function changepassword() {

                if($("input[name='password']").val() == $("input[name='passwordagain']").val()){

                    $("#updatepassword").submit();

                }else{

                    alert("密码输入不一致，请重新输入！");

                }

        }


        function chakanyonghu() {

            $("#cityshuju").remove()

            $("#btn3").attr("onclick"," ");

            /*$('#dg').remove();*/

            $('#tt').append('<table id="dg">' + '</table>');

            $('#tt').tabs({
                border:true,
                fit:true,
                pill:true,
            });

            $('#tt').tabs('add',{
                id:'chakan',
                title:'查看用户',
                closable:true,
                tools: [{
                    iconCls: 'icon-mini-refresh',
                    handler: function () {
                        alert('refresh');
                    }
                }]
            });

            $.ajax({
                url: 'selectall',
                type: 'post',
                data: 'json',
                success:function(data){

                    $('#chakan').append(
                        '<form id="shujutable" action="deleteuserbyid" method="post">' +
                        '<table id="shujubianli" align="center" style="margin-top: 5%;color: black;width: 90%;text-align: center" border="1px">' +
                            '<tr>' +
                                '<td style="text-align: right">' + '全选' + '<input type="checkbox" id="checked">' + '</td>' +
                                '<td>' + '序号' + '</td>' +
                                '<td>' + '用户名' + '</td>' +
                                '<td>' + '密码' + '</td>' +
                                '<td>' + '<input id="identity" value="身份" style="text-align: center">' +
                                '</td>' +
                                '<td>' + '注册时间' + '</td>' +
                                '<td colspan="2" style="text-align: center">' + '操作' + '</td>' +
                            '</tr>' +
                        '</table>' +
                        '</form>'
                    );

                    var indexlength = 0;
                    var selectallobj = eval("("+ data +")");//转换成json对象

                    $.each(selectallobj,function (index,user) {

                        /*alert(user.id + " ------- " + user.username);*/

                        $('#shujubianli').append(
                            '<tr>'+
                                '<td style="text-align: right">' + '<input name="idchecked" type="checkbox" value="'+(user.id)+'">' + '</td>' +
                                '<td>' + user.id + '</td>' +
                                '<td>' + user.username + '</td>' +
                                '<td>' + user.password + '</td>' +
                                '<td>' + user.identity + '</td>' +
                                '<td>' + user.time + '</td>'+
                                '<td>' +
                                '<input type="button" value="修改" onclick="xiugaiuser('+user.id+')" style="margin-right: 10px">'  +
                                '<input type="button" value="删除" onclick="shanchuuser('+user.id+')">' +
                                '</td>'+
                            '</tr>'
                        );

                        indexlength = index;

                    })

                    alert(indexlength);

                    $("#shujubianli tr:first").last().append('<td rowspan="'+(indexlength + 2)+'">'+'<input type="button" value="批量删除" onclick="pldelete()">'+'</td>');

                    $('#identity').combobox({
                        url:'selectidentity',
                        valueField:'identity',
                        textField:'identity',
                        onChange:function (identity) {

                            alert("选择了【" + identity + "】")

                            $.ajax({

                                url: "selectloginbyidentity",
                                type: "post",
                                data: {"identity":identity},
                                dataType: "text",
                                success: function (data) {

                                    alert("根据identity查询登录信息成功！" + data);

                                    $("#shujubianli tr:first").nextAll().remove();

                                    var loginuserobj = eval("(" + data + ")")
                                    
                                    $.each(loginuserobj,function (index,login) {

                                       /* alert($("#shujubianli tr:first").html());*/

                                        $("#shujubianli").last().append(

                                            '<tr>'+
                                                '<td>' + login.id + '</td>' +
                                                '<td>' + login.username + '</td>' +
                                                '<td>' + login.password + '</td>' +
                                                '<td>' + login.identity + '</td>' +
                                                '<td>' + login.time + '</td>'+
                                                '<td>' +
                                                '<input type="button" value="修改" onclick="xiugaiuser('+login.id+')" style="margin-right: 10px">'  +
                                                '<input type="button" value="删除" onclick="shanchuuser('+login.id+')">' +
                                                '</td>'+
                                            '</tr>'

                                        );
                                        
                                    })

                                },
                                error: function () {

                                    alert("根据identity查询登录信息失败！");

                                }

                            })

                        }
                    });

                    jiazai();

                },
                error:function(){

                    alert("查询出错！");

                }

        });

            /*$('#dg').datagrid({
                url:'selectall',
                columns:[[
                    {field:'id',title:'ID',width:100,align:'center'},
                    {field:'username',title:'用户名',width:100,align:'center'},
                    {field:'password',title:'密码',width:100,align:'center'},
                    {field:'identity',title:'身份',width:100,align:'center'},
                    {field:'time',title:'注册时间',width:200,align:'center'},
                ]]
            });*/

        }

        function jiazai(){

            $("#checked").click(function(){

                alert("全部选中...");

                if(this.checked == false){

                    $("input[name='idchecked']").prop("checked",false);

                }else{

                    $("input[name='idchecked']").prop("checked",true);

                }

            });

        }

        function pldelete() {

            alert("批量删除...");

            for(var i=0; i<$("input[name='idchecked']").length; i++){
                if($("input[name='idchecked']").attr("checked","checked")[i]){
                    alert($("input[name='idchecked']").val()[i]);
                }
            }

        }

        function selectuserinfo() {

            $("#cityshuju").remove()

            alert("搜索详情！");

            $("#btn4").attr("onclick"," ");

           /* $('#dg').remove();*/

            $('#tt').tabs({
                border:true,
                fit:true,
                pill:true,
            });

            $('#tt').tabs('add',{
                id:'sousuoxiangqing',
                title:'搜索详情',
                closable:true,
                tools: [{
                    iconCls: 'icon-mini-refresh',
                    handler: function () {
                        alert('refresh');
                    }
                }]
            });

            /*使用外部css文件*/
            $('#sousuoxiangqing').append(

                '<div id="sousuokuang" style="margin-top: 3%">' +
                    '<div style="margin-bottom: 3%" align="center">' +
                        '<input id="ss" style="width: 44%">' + '</input>' +
                        '<div id="mm" style="width:120px;">' +
                        '<div data-options="name:\'teacher\',iconCls:\'icon-man\'">' + '老师' + '</div>' +
                        '<div data-options="name:\'student\',iconCls:\'icon-man\'">' + '学生' + '</div>' +
                        '</div>' +
                    '</div>' +
                    '<table id="dg">' + '  ' +  '</table>' +
                '<div>'

        );

            $('#ss').searchbox({

                searcher:function(value,name){

                    if(name == "teacher"){

                        $('#dg').datagrid({
                            url:'teacher/liketeacherinfo',
                            queryParams: {
                                "name":name,"value":value
                            },
                            columns:[[
                                {field:'username',title:'用户名',width:100},
                                {field:'password',title:'密码',width:100},
                                {field:'identity',title:'身份',width:100},
                                {field:'tname',title:'姓名',width:100},
                                {field:'tgender',title:'性别',width:100},
                                {field:'tage',title:'年龄',width:100},
                                {field:'tclasses',title:'班级',width:100},
                                {field:'taddress',title:'地址',width:100},
                                {field:'tphone',title:'电话',width:100},
                                {field:'tnumber',title:'工号',width:100},
                            ]]
                        });

                        return;

                    }

                    $('#dg').datagrid({
                        url:'student/likestudentinfo',
                        queryParams: {
                           "name":name,"value":value
                        },
                        columns:[[
                            {field:'username',title:'用户名',width:100},
                            {field:'password',title:'密码',width:100},
                            {field:'identity',title:'身份',width:100},
                            {field:'name',title:'姓名',width:100},
                            {field:'gender',title:'性别',width:100},
                            {field:'age',title:'年龄',width:100},
                            {field:'classes',title:'班级',width:100},
                            {field:'address',title:'地址',width:100},
                            {field:'phone',title:'电话',width:100},
                            {field:'student_number',title:'学号',width:100},
                            {field:'yuwen',title:'语文',width:100},
                            {field:'shuxue',title:'数学',width:100},
                            {field:'yingyu',title:'英语',width:100},
                            {field:'tiyu',title:'体育',width:100},
                        ]]
                    });
                },
                menu:'#mm',
                prompt:'查询姓名,学号(工号)，学号(工号)不能小于4位数！'
            });
            
        }

        function xiugaiuser (xiugaibyid) {

            alert("这是修改！修改序号为【" + xiugaibyid +"】");

            $("#chakan").append(
            '<div id="win">' +
            '</div>'
            );

            $('#win').window({
                width:600,
                height:400,
                title:"用户信息修改",
                modal:true
            });

            $.ajax({

                url: 'selectuserbyid',
                type: 'post',
                data:{'id':xiugaibyid},
                dataType: 'text',
                success: function(data){

                    var newdata = JSON.parse(data);

                    /*alert("根据id查询用户信息！" + newdata.username);*/

                    $("#win").append(
                        '<form action="updateuserbyid" method="post">'+
                        '<table id="xiugaiuserxinxitable" align="center" style="margin-top: 5%;color: black;width: 90%;text-align: center" border="1px">' +
                        '<tr>' +
                        '<td>' + '序号：' + '</td>' +
                        '<td>' + '<input type="text" name="id" value="" readonly="readonly">' + '</td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td>' + '用户名：' + '</td>' +
                        '<td>' + '<input type="text" name="username" value="">' + '</td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td>' + '密码：' + '</td>' +
                        '<td>' + '<input type="text" name="password" value="">' + '</td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td>' + '身份：' + '</td>' +
                        '<td>' +
                        '<select name="identity" style="width: 47%">' +
                            '<option value="管理员">'+ '管理员' +'</option>'+
                            '<option value="老师">'+ '老师' +'</option>'+
                            '<option value="学生">'+ '学生' +'</option>'+
                        '</select>'+
                        '</td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td colspan="2">' + '<input type="reset" value="重置" style="margin-right: 20%">' +  '<input type="submit" value="修改">' + '</td>' +
                        '</tr>' +
                        '</table>'+
                        '</br>'+
                        '</br>'+
                            '<input id="closewin" type="button" value="关闭页面" onclick="closewindow()" style="text-align: center;margin-left: 45%">'+
                        '</form>'
                    );

                    $("input[name='id']").val(newdata.id)
                    $("input[name='username']").val(newdata.username)
                    $("input[name='password']").val(newdata.password)
                    $("input[name='identity']").val(newdata.identity)

                },
                error: function(){

                    alert("根据id查询用户信息出错！");

                }

            })

        }

        function closewindow() {

           /* alert("暂时未开放！");*/

           window.location.href="closewindow";

        }

        function shanchuuser (shanchubyid) {

          $.ajax({

              url: 'deleteuserbyid',
              type: 'post',
              data: {"id":shanchubyid},
              dataType:'text',
              success:function(data){

                alert("删除成功！序号为：【" + shanchubyid + "】");

                  $("#shujubianli").remove();
                  $("#shujutable").remove();

                  $.ajax({
                      url: 'selectall',
                      type: 'post',
                      data: 'json',
                      success:function(data){

                          $('#chakan').append(
                              '<form id="shujutable" action="deleteuserbyid" method="post">' +
                              '<table id="shujubianli" align="center" style="margin-top: 5%;color: black;width: 90%;text-align: center" border="1px">' +
                              '<tr>' +
                              '<td>' + '序号' + '</td>' +
                              '<td>' + '用户名' + '</td>' +
                              '<td>' + '密码' + '</td>' +
                              '<td>' + '身份' + '</td>' +
                              '<td>' + '注册时间' + '</td>' +
                              '<td colspan="2" style="text-align: center">' + '操作' + '</td>' +
                              '</tr>' +
                              '</table>' +
                              '</form>'
                          );

                          var selectallobj = eval("("+ data +")");//转换成json对象

                          $.each(selectallobj,function (index,user) {

                              /* if(index == 0){

                                   return true;

                               }*/

                             /* alert(user.id + " ------- " + user.username);*/

                              $('#shujubianli').append(
                                  '<tr>'+
                                  '<td>' + user.id + '</td>' +
                                  '<td>' + user.username + '</td>' +
                                  '<td>' + user.password + '</td>' +
                                  '<td>' + user.identity + '</td>' +
                                  '<td>' + user.time + '</td>'+
                                  '<td>' +
                                  '<input type="button" value="修改" onclick="xiugaiuser('+user.id+')" style="margin-right: 10px">' +
                                  '<input type="button" value="删除" onclick="shanchuuser('+user.id+')">'+
                                  '</td>'+
                                  '</tr>'
                              );

                          })

                      },
                      error:function(){

                          alert("查询出错！");

                      }

                  });

              },
              error:function () {

                  alert("删除失败！");

              }

          });

        }

    </script>

</head>

<%--<body>

<h1>Test Page</h1>

</body>--%>

<body class="easyui-layout">

<div data-options="region:'north',iconCls:'icon-man',title:'登录信息',split:true" style="height:130px;">

        <div style="width:30%;height:90px;float: left">

            <br>
        <label>&nbsp;&nbsp;用户：</label>
        <br>
        <label id="loginusername">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【 ${username} 】&nbsp;</label>
            <label>身份：【 ${identity} 】&nbsp;&nbsp;</label>
            <label><a href="exitlogin">退出</a></label>
        <br>
        <label>&nbsp;&nbsp;欢迎你！</label>
        </div>

        <div class="clock" style="background-color:#d5d5d5;float: left">
            <div class="digit hours">
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
            </div>
            <div class="digit hours">
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
            </div>
            <div class="separator"></div>
            <div class="digit minutes">
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
            </div>
            <div class="digit minutes">
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
            </div>
            <div class="separator"></div>
            <div class="digit seconds">
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
            </div>
            <div class="digit seconds">
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
                <div class="segment"></div>
            </div>
        </div>

</div>

<div data-options="region:'south',iconCls:'icon-help',title:'友情提示',split:true" style="height:115px;">
    <div data-options="fit" style="text-align: center">
        <p>14软件外包服务</p>
        <p>董江涛</p>
    </div>
</div>

<div data-options="region:'east',iconCls:'icon-tip',title:'标语栏',split:true" style="width:200px">
    <div data-options="fit:true">
        <marquee behavior="scroll" direction="up" scrollamount="5" scrolldelay="100" loop="-1">
        <img src="${pageContext.request.contextPath}/images/xuexi.jpg" width="100%">
        <img src="${pageContext.request.contextPath}/images/gongying.jpg" width="100%" style="margin-top: 50px">
        <img src="${pageContext.request.contextPath}/images/jiazhi.jpg" width="100%" style="margin-top: 50px">
        </marquee>
    </div>
</div>

<div data-options="region:'west',iconCls:'icon-large-smartart',title:'菜单栏',split:true" style="width:200px;">

    <div id="aa" class="easyui-accordion" style="width:300px;height:200px" data-options="fit:true">
        <div title="添加新用户" data-options="iconCls:'icon-redo'" style="overflow:auto;padding:10px;">
            <a id="btn1" href="###" class="easyui-linkbutton" data-options="iconCls:'icon-pencil'" onclick="yonghuzhuce()">用户注册</a>
        </div>

        <div title="用户管理" data-options="iconCls:'icon-redo',selected:false" style="padding:10px;">
            <a id="btn3" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="chakanyonghu()">查看用户</a>

            <a id="btn4" href="###" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="selectuserinfo()" style="margin-top: 10px">搜索详情</a>

        </div>
        <div title="密码管理" data-options="iconCls:'icon-redo',selected:false" style="padding:10px;">
            <a id="btn2" href="###" class="easyui-linkbutton" data-options="iconCls:'icon-pencil'" onclick="mimaxiugai()">密码修改</a>
        </div>
    </div>

</div>

<div data-options="region:'center',iconCls:'icon-large-chart',title:'信息管理'" style="padding:5px;background-image: url(${pageContext.request.contextPath}/images/beijingtupian2.jpg);background-size: 100%" id="xinxiguanli">

    <div id="cityshuju" align="center" style="margin-top: 2%">
        <h2 style="color: #9e9737">天气情况</h2>
        <br>
        所在城市：
        <input id="cc" name="cityname" value="请选择">
        <table id="weathertable" style="width: 90%;margin-top: 4%;color: black;text-align: center" border="1"></table>
    </div>

    <div id="tt">

    </div>

</div>

</body>

</html>
