<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>


    <script src="./static/js/jquery-1.12.4.min.js">
    </script>

    <script src="./static/bootstrap-3.3.7-dist/js/bootstrap.min.js">
    </script>

    <link href="./static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">



</head>
<body>

<%--
模式框的更新
--%>
<div class="modal fade" tabindex="-1" role="dialog" id="empUpdateModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">更新</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <!--
                            <input id="empName_update_input" name="empName" type="text"
                                   class="form-control"
                                   placeholder="empName">
                            <span  class="help-block"></span>
                            -->
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>


                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input id="email_update_input" name="email" type="text" class="form-control"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" >
                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<%--
模式框的创建
--%>
<div class="modal fade" tabindex="-1" role="dialog" id="empAddModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input id="empName_add_input" name="empName" type="text" class="form-control"
                                   placeholder="empName">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>


                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input id="email_add_input" name="email" type="text" class="form-control"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="select_depts">

                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--搭建界面 -->
<div class="container">
    <%--标题 --%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%-- 按钮--%>
    <div class="row">
        <div class="col-md-offset-8 col-md-4 ">
            <button type="button" class="btn btn-success" id="empAddModalBtn">新增</button>
            <button type="button" class="btn btn-danger" id="del_all_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emplist_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="checkbox_all"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>


            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6" id="page_info">

        </div>
        <div class="col-md-6" id="nav_info">

        </div>

    </div>
</div>
<script type="text/javascript">
    /**
     * 记录一些全局变量
     */
        //总的记录数
    var totalRecord;
    //当前的一页
    var currentPage;
</script>

<script type="text/javascript">





    /**
     *显示数据是否得可用
     */
    function validate_show(ele,state,msg){

        //在校验前 应该将 之前的一些状态删除掉
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");

        if(state=="success")
        {

            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);

        }
        else
        {

            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);

        }
    }

    function validate_add_form() {

        var input_empName = $("#empName_add_input").val();
        var validate_empName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!validate_empName.test(input_empName)) {
            // console.log("用户名的格式有问题");

            validate_show("#empName_add_input","error","用户名的格式有问题");
            return false;
        }
        else
        {
            validate_show("#empName_add_input","success","");
        }

        var input_email = $("#email_add_input").val();
        var validate_email=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!validate_email.test(input_email))
        {
            // console.log("邮箱不对");

            validate_show("#email_add_input","error","邮箱格式不对");
            return false;
        }
        else
        {
            validate_show("#email_add_input","success","");
        }
        return true;
    }

    function getDepts(ele) {
        $(ele).empty();//"#select_depts"
        $.ajax({
            url: "${APP_PATH}/getdepts",
            type: "get",
            success: function (result) {
                // console.log(result);

                //第二个参数  不是函数蛮 它可以是有参数的 也可以是无参数的
                $.each(result.extend.depts, function () {

                    var optionE = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionE.appendTo(ele);
                });


            }
        });

    }


    function pageJump(pn) {
        $.ajax(
            {
                url: "${APP_PATH}/emps",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    buildtable(result);
                    build_page_info(result);
                    build_nav_info(result);
                }
            }
        );
    }

    /**
     * 在table中显示
     */
    function buildtable(result) {
        $("#emplist_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var empcheckbox=$("<td><input type='checkbox' class='checkboxitem'></td>");
            var empId = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var gender = $("<td></td>").append(item.gender=='M'?'男':'女');
            var email = $("<td></td>").append(item.email);
            var departmentName = $("<td></td>").append(item.department.deptName);
            /**
             <button class="">
             <span class="" aria-hidden="true"></span>
             编辑
             </button>
             */
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm btn-edit").append(
                $("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑")
            );

            //给button 增加个属性 反正它的属性我们想怎么加就怎么加
            //empId 是一个对象
            editBtn.attr("edit_id",item.empId);


            var deleBtn = $("<button></button>").addClass("btn btn btn-danger btn-sm btn-del").append(
                $("<span></span>").addClass("glyphicon glyphicon-pencil").append("删除")
            );
            deleBtn.attr("del_id",item.empId);

            var btn = $("<td></td>").append(editBtn).append(" ").append(deleBtn);
            $("<tr></tr>").append(empcheckbox).append(empId).append(empName)
                .append(gender).append(email).append(departmentName).append(btn).appendTo("#emplist_table tbody");
        });

    }

    function build_page_info(result) {

        $("#page_info").empty();
        $("#page_info").append("当前" + result.extend.pageInfo.pageNum + "页，总共"
            + result.extend.pageInfo.pages + "页，总共" + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }

    function build_nav_info(result) {

        $("#nav_info").empty();
        var ulnav = $("<ul></ul>").addClass("pagination");
        var firstNav = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var lastNav = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        var preNav = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        var nextNav = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));


        /**
         * onclick 就不显示的
         */
        if (result.extend.pageInfo.hasPreviousPage == false) {
            preNav.addClass("disabled");
        }
        else {
            preNav.click(function () {
                pageJump(result.extend.pageInfo.pageNum - 1);
            });
        }

        if (result.extend.pageInfo.hasNextPage == false) {
            nextNav.addClass("disabled");
        } else {
            nextNav.click(function () {
                pageJump(result.extend.pageInfo.pageNum + 1);
            });
        }
        firstNav.click(function () {

            pageJump(1);
        });
        lastNav.click(function () {
            pageJump(result.extend.pageInfo.pages);
        });
        ulnav.append(firstNav).append(preNav);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var navitem = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));

            if (item == result.extend.pageInfo.pageNum) {
                //添加选中的框
                navitem.addClass("active");
            }
            navitem.click(function () {
                pageJump(item);
            });
            ulnav.append(navitem);

        });
        ulnav.append(nextNav).append(lastNav).appendTo("#nav_info");
    }

    function clear_form(ele) {
        /**
         * 清除表单 清除内容
         *
         * jq 好像没有表单的清楚 然后我们用的是 js的表单的清除
         *
         * ele 是表单
         */
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }


    //获取到emp的信息
    function  getemp(id) {
        $.ajax({
            url:"${APP_PATH}/getemp/"+id,
            type:"GET",
            success:function (result) {
                // console.log(result);

                //获取到数据
                var empData=result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);

                //传的是val 可以直接帮我们转换成显示的值 是不是很牛逼
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }

        });

    }

</script>
<script type="text/javascript">
    $(function () {

        pageJump(1);


        /**
         * 用户名输入框的改变
         */
        $("#empName_add_input").change(function () {

            // $("#email_update_input").val(); 这样写的是val
            // 用this 直接value
            var empName=this.value;
            console.log(empName);
            $.ajax({
                url:"${APP_PATH}/checkUserName",
                type:"POST",
                data:"empName="+empName,//  =号 不能忘记写
                success:function (result) {
                    //用户名可用  has-success has-error
                    if(result.code==100)
                    {
                        validate_show("#empName_add_input","success","用户名可用");
                        $("#emp_save").attr("ajax-va","success");
                    }
                    //用户名不可以用
                    else{
                        console.log(result.extend.valmsg);
                        validate_show("#empName_add_input","error",result.extend.valmsg);
                        $("#emp_save").attr("ajax-va","error");
                    }
                }
            });

        });



        $("#empAddModalBtn").click(function () {


            /**
             *
             * 在打开窗口之前
             * 1.清空表单之前的数据
             * 2.清楚表单的格式
             *3.获取到部门的信息
             */

            clear_form("#empAddModal form");

            getDepts("#select_depts");

            $("#empAddModal").modal({

                backdrop: "static" //这句话的意思就是 当点击模块化 以外的它不会消失
            });
        });

        /*
                    $("#emp_save").click(function () {
                            console.log("点击了事件");
                        $.ajax({
                           url:"
      //  {APP_PATH}/saveemps",
                   type:"POST",
                    data:$("#empAddModal form").serialize(),
                   success:function(result) {
                       //创建成功
                       alert(result.message);
                        //关闭模式框
                        $("#empAddModal").modal('hide');
                       //跳转到最后一页 我们尽量调到最后一页 让我们知道 你真的创建成功 因为插件帮我们已经做好了处理
                       //即使 超过也没事的
                        pageJump(totalRecord+1);
                   }
                });
            });
            */

        /**
         * 有时候发送请求失败 400 错误
         * 可能是传的参数 有问题 。之前deptId 写成depid
         * 就提示 400 错误
         * 另外序列号 也可以不需要id 之前误认为
         * 序列化 需要给每个值 传id的
         */

        $("#emp_save").click(function () {
            // console.log($("#empAddModal form").serialize());

            //检验表单的数据是否可用

            if(!validate_add_form())
                return ;


            //检测用户名是否可用
            //如何获取到attr("ajax-va") 一个属性值
            if($(this).attr("ajax-va")=="error"){
                return ;
            }

            $.ajax({
                url: "${APP_PATH}/saveemps",
                type: "POST",
                data: $("#empAddModal form").serialize(),
                success: function (result) {
                    /**
                     //关闭模式框
                     $("#empAddModal").modal('hide');
                     //跳转到最后一页 我们尽量调到最后一页 让我们知道 你真的创建成功 因为插件帮我们已经做好了处理
                     //即使 超过也没事的
                     pageJump(totalRecord + 1);
                     */

                    /**
                     * 这时候需要判断数据的规范性
                     * 对成功的处理
                     */

                    if(result.code==100)
                    {
                        //关闭 模式框 跳入到最后一页
                        $("#empAddModal").modal('hide');
                        pageJump(totalRecord + 1);

                    }
                    //对失败的处理
                    else
                    {
                        //遍历下
                        if(undefined != result.extend.fieldErrors.email)
                        {
                            show_validate_msg("#email_add_input", "error", result.extend.fieldErrors.email);
                        }
                        if(undefined != result.extend.fieldErrors.empName)
                        {
                            show_validate_msg("#empName_add_input","error",result.extend.fieldErrors.empName);
                        }
                    }

                }
            });
        });


        /**
         * 编辑事件的处理
         * 我们是动态加载的 注解添加一个添加一个点击事件
         * 就是添加事件之前 然后添加元素 时间是绑定不上的
         * 我们有其他的方法
         *  绑定点击.live()  .jquery新版没有live，使用on进行替代
         *
         *  下面的三个参数 第一个是 事件 第二个选择器
         */
        $(document).on("click",".btn-edit",function(){

            //1。先获取到部门的信息
            //2.打开模式框

            getDepts("#empUpdateModal select");
            //给更新按钮 赋给个值
            $("#emp_update").attr("edit_id",$(this).attr("edit_id"));

            $("#empUpdateModal").modal({
                backdrop:"static"
            });

            //注意 "edit_id" 中的双引号
            getemp($(this).attr("edit_id"));

        });


        $("#emp_update").click(function () {

            //1 .保存前 需要检验email的合法性

            /**
             * java 与js 的验证是相反的
             * java 是数据.match（正则表达式）
             * 而js 是正则表达式 .test（数据）
             * @type {*|jQuery}
             */
            var email_val=$("#email_update_input").val();
            var validate_email=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!validate_email.test(email_val))
            {
                validate_show("#email_update_input","error","邮箱的格式不对");
                return ;
            }
            else
            {
                validate_show("#email_update_input","success","");
            }
            //2.数据合法性后
            /* $.ajax({
                 url:"{APP_PATH}/emp/"+$(this).attr("edit_id"),
                 type:"POST",
                 data:$("#empUpdateModal form").serialize()+"&_method=PUT", //& 别忘记写 这里put 不用写成'put'
                 success:function (result) {
                     console.log(result.message);
                 }

             });*/

            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(), //& 别忘记写 这里put 不用写成'put'
                success:function (result) {
                    //数据保存成功后

                    /**
                     * 1 关闭模式框
                     * 2 跳到刚才编辑的那一页
                     */
                    $("#empUpdateModal").modal("hide");

                    pageJump(currentPage);

                }

            });

        });
        $(document).on("click",".btn-del",function()
        {
            // console.log("进入时间");
            // del_id
            var empId=$(this).attr("del_id");
            var empName=$(this).parents("tr").find("td:eq(2)").text();
            console.log(empName);
            // console.log(empId);
            if(confirm("确认删除 "+empName))
            {
                console.log("测试下这个确认框");

                //发送ajax请求 删除
                $.ajax({
                    url:"${APP_PATH}/emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
                        console.log(result.message);
                        pageJump(currentPage);
                    }

                });

            }
            // else
            // {
            //     console.log("取消按钮");
            // }

        });


        //给全选增加个事件
        $("#checkbox_all").click(function () {


            /** 我们不仅可以通过attr 获取元素的属性 还可以通过prop来获取属性的值
             * 一般我们自定义的属性值 用attr
             * check 用attr获取的checkbox的值 是undefined 的但是
             * 通过prop就不会啦
             *
             *
             * */
            $(".checkboxitem").prop("checked",$(this).prop("checked"));

        });

        /**
         * 因为下面是动态的增加的 我们不能直接添加事件的
         */

        $(document).on("click",".checkboxitem",function () {

            //比如说 所有的元素都点了 上面那个全选就不是需要全点吗
            var flag = $(".checkboxitem:checked").length==$(".checkboxitem").length;
            $("#checkbox_all").prop("checked",flag);
        });

        $("#del_all_btn").click(function () {

            /**
             * 删除按钮的是实现
             * 1.获取到删除的名字 。id
             */

            var empNames="";
            var ids="";
            $.each($(".checkboxitem:checked"),function () {
                empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
                ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            // 最后一个元素 带有 ，  或者 -
            empNames=empNames.substring(0,empNames.length-1);
            ids=ids.substring(0,ids.length-1);
            if(confirm("确认要"+empNames+"删除？"))
            {
                $.ajax({
                    url:"${APP_PATH}/emp/"+ids,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.message);
                        pageJump(currentPage);
                    }
                });
            }

        });

    });


</script>

</body>
</html>
