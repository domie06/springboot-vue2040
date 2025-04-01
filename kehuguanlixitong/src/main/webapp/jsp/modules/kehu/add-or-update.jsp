<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑客户</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">客户管理</li>
                        <li class="breadcrumb-item active">编辑客户</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">客户信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6">
                                        <label>姓名</label>
                                        <input id="name" name="name" class="form-control"
                                               placeholder="姓名">
                                    </div>
                                <div class="form-group col-md-6">
                                    <label>手机号</label>
                                    <input id="phone" name="phone" class="form-control"
                                           onchange="phoneChickValue(this)"  placeholder="手机号">
                                </div>
                                    <div class="form-group col-md-6">
                                        <label>邮箱</label>
                                        <input id="youxiang" name="youxiang" class="form-control"
                                               placeholder="邮箱">
                                    </div>
                                <div class="form-group col-md-6">
                                    <label>身份证号</label>
                                    <input id="idNumber" name="idNumber" class="form-control"
                                           onchange="idNumberChickValue(this)"  placeholder="身份证号">
                                </div>
                                   <div class="form-group col-md-6">
                                       <label>性别</label>
                                       <select id="sexTypesSelect" name="sexTypes" class="form-control">
                                       </select>
                                   </div>
                                   <div class="form-group col-md-6">
                                       <label>照片</label>
                                       <img id="myPhotoImg" src="" width="100" height="100">
                                       <input name="file" type="file" id="myPhotoupload"
                                              class="form-control-file">
                                       <input name="myPhoto" id="myPhoto-input" type="hidden">
                                   </div>
                                    <div class="form-group col-md-6">
                                        <label>民族</label>
                                        <input id="nation" name="nation" class="form-control"
                                               placeholder="民族">
                                    </div>
                                   <div class="form-group col-md-6">
                                       <label>政治面貌</label>
                                       <select id="politicsTypesSelect" name="politicsTypes" class="form-control">
                                       </select>
                                   </div>
                                    <div class="form-group col-md-6">
                                        <label>地址</label>
                                        <input id="birthplace" name="birthplace" class="form-control"
                                               placeholder="地址">
                                    </div>
                                   <div class="form-group  col-md-6">
                                       <label>备注</label>
                                       <input id="kehuContentupload" name="file" type="file">
                                       <script id="kehuContentEditor" type="text/plain"
                                               style="width:800px;height:230px;"></script>
                                       <script type = "text/javascript" >
                                       //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                       //相见文档配置属于你自己的编译器
                                       var kehuContentUe = UE.getEditor('kehuContentEditor', {
                                           toolbars: [
                                               [
                                                   'undo', //撤销
                                                   'bold', //加粗
                                                   'redo', //重做
                                                   'underline', //下划线
                                                   'horizontal', //分隔线
                                                   'inserttitle', //插入标题
                                                   'cleardoc', //清空文档
                                                   'fontfamily', //字体
                                                   'fontsize', //字号
                                                   'paragraph', //段落格式
                                                   'inserttable', //插入表格
                                                   'justifyleft', //居左对齐
                                                   'justifyright', //居右对齐
                                                   'justifycenter', //居中对
                                                   'justifyjustify', //两端对齐
                                                   'forecolor', //字体颜色
                                                   'fullscreen', //全屏
                                                   'edittip ', //编辑提示
                                                   'customstyle', //自定义标题
                                               ]
                                           ]
                                       });
                                       </script>
                                       <input type="hidden" name="kehuContent" id="kehuContent-input">
                                   </div>
                                   <div class="form-group col-md-6">
                                       <label>地区</label>
                                       <select id="diquTypesSelect" name="diquTypes" class="form-control">
                                       </select>
                                   </div>
                                   <div class="form-group col-md-6">
                                       <label>标签</label>
                                       <select id="biaoqianTypesSelect" name="biaoqianTypes" class="form-control">
                                       </select>
                                   </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
</script><script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "kehu";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var sexTypesOptions = [];
    var politicsTypesOptions = [];
    var diquTypesOptions = [];
    var biaoqianTypesOptions = [];
        <!-- 级联表的下拉框数组 -->

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#myPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= baseUrl + 'file/download?fileName=' + data.result.file;
                document.getElementById('myPhotoImg').setAttribute('src',photoUrl);
                document.getElementById('myPhoto-input').setAttribute('value',photoUrl);
            }
        });


        $('#kehuContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('kehuContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                successMes = '添加成功';
            }
            httpJson("kehu/" + urlParam, "POST", data, (res) => {
                if(res.code == 0)
                {
                    window.sessionStorage.removeItem('addkehu');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function sexTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
                if(res.code == 0){
                    sexTypesOptions = res.data.list;
                }
            });
        }
        function politicsTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=politics_types", "GET", {}, (res) => {
                if(res.code == 0){
                    politicsTypesOptions = res.data.list;
                }
            });
        }
        function diquTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=diqu_types", "GET", {}, (res) => {
                if(res.code == 0){
                    diquTypesOptions = res.data.list;
                }
            });
        }
        function biaoqianTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=biaoqian_types", "GET", {}, (res) => {
                if(res.code == 0){
                    biaoqianTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationSextypesSelect(){
            var sexTypesSelect = document.getElementById('sexTypesSelect');
            if(sexTypesSelect != null && sexTypesOptions != null  && sexTypesOptions.length > 0 ){
                for (var i = 0; i < sexTypesOptions.length; i++) {
                    sexTypesSelect.add(new Option(sexTypesOptions[i].indexName,sexTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationPoliticstypesSelect(){
            var politicsTypesSelect = document.getElementById('politicsTypesSelect');
            if(politicsTypesSelect != null && politicsTypesOptions != null  && politicsTypesOptions.length > 0 ){
                for (var i = 0; i < politicsTypesOptions.length; i++) {
                    politicsTypesSelect.add(new Option(politicsTypesOptions[i].indexName,politicsTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationDiqutypesSelect(){
            var diquTypesSelect = document.getElementById('diquTypesSelect');
            if(diquTypesSelect != null && diquTypesOptions != null  && diquTypesOptions.length > 0 ){
                for (var i = 0; i < diquTypesOptions.length; i++) {
                    diquTypesSelect.add(new Option(diquTypesOptions[i].indexName,diquTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationBiaoqiantypesSelect(){
            var biaoqianTypesSelect = document.getElementById('biaoqianTypesSelect');
            if(biaoqianTypesSelect != null && biaoqianTypesOptions != null  && biaoqianTypesOptions.length > 0 ){
                for (var i = 0; i < biaoqianTypesOptions.length; i++) {
                    biaoqianTypesSelect.add(new Option(biaoqianTypesOptions[i].indexName,biaoqianTypesOptions[i].codeIndex));
                }
            }
        }

    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->


    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var sexTypesSelect = document.getElementById("sexTypesSelect");
        if(sexTypesSelect != null && sexTypesOptions != null  && sexTypesOptions.length > 0 ) {
            for (var i = 0; i < sexTypesOptions.length; i++) {
                if (sexTypesOptions[i].codeIndex == ruleForm.sexTypes) {//下拉框value对比,如果一致就赋值汉字
                        sexTypesSelect.options[i].selected = true;
                }
            }
        }

        var politicsTypesSelect = document.getElementById("politicsTypesSelect");
        if(politicsTypesSelect != null && politicsTypesOptions != null  && politicsTypesOptions.length > 0 ) {
            for (var i = 0; i < politicsTypesOptions.length; i++) {
                if (politicsTypesOptions[i].codeIndex == ruleForm.politicsTypes) {//下拉框value对比,如果一致就赋值汉字
                        politicsTypesSelect.options[i].selected = true;
                }
            }
        }

        var diquTypesSelect = document.getElementById("diquTypesSelect");
        if(diquTypesSelect != null && diquTypesOptions != null  && diquTypesOptions.length > 0 ) {
            for (var i = 0; i < diquTypesOptions.length; i++) {
                if (diquTypesOptions[i].codeIndex == ruleForm.diquTypes) {//下拉框value对比,如果一致就赋值汉字
                        diquTypesSelect.options[i].selected = true;
                }
            }
        }

        var biaoqianTypesSelect = document.getElementById("biaoqianTypesSelect");
        if(biaoqianTypesSelect != null && biaoqianTypesOptions != null  && biaoqianTypesOptions.length > 0 ) {
            for (var i = 0; i < biaoqianTypesOptions.length; i++) {
                if (biaoqianTypesOptions[i].codeIndex == ruleForm.biaoqianTypes) {//下拉框value对比,如果一致就赋值汉字
                        biaoqianTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.kehuContent != null && ruleForm.kehuContent != 'null' && ruleForm.kehuContent != '') {

            var kehuContentUeditor = UE.getEditor('kehuContentEditor');
            kehuContentUeditor.ready(function () {
                var mes = '' + ruleForm.kehuContent;
                kehuContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        var kehuContentEditor =UE.getEditor('kehuContentEditor');
        if (kehuContentEditor.hasContents()) {
                $('#kehuContent-input').attr('value', kehuContentEditor.getPlainTxt());
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function phoneChickValue(e){
            var this_val = e.value || 0;
            var reg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("手机号不正确");
                return false;
            }
        }
        function idNumberChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("身份证号不正确");
                return false;
            }
        }



    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addkehu');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                name: "required",
                phone: "required",
                youxiang: "required",
                idNumber: "required",
                sexTypes: "required",
                myPhoto: "required",
                nation: "required",
                politicsTypes: "required",
                birthplace: "required",
                kehuContent: "required",
                diquTypes: "required",
                biaoqianTypes: "required",
                insertTime: "required",
            },
            messages: {
                name: "姓名不能为空",
                phone: "手机号不能为空",
                youxiang: "邮箱不能为空",
                idNumber: "身份证号不能为空",
                sexTypes: "性别不能为空",
                myPhoto: "照片不能为空",
                nation: "民族不能为空",
                politicsTypes: "政治面貌不能为空",
                birthplace: "地址不能为空",
                kehuContent: "备注不能为空",
                diquTypes: "地区不能为空",
                biaoqianTypes: "标签不能为空",
                insertTime: "添加时间不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addkehu = window.sessionStorage.getItem("addkehu");
        if (addkehu != null && addkehu != "" && addkehu != "null") {
            window.sessionStorage.removeItem('addkehu');
            //注册表单验证
            $(validform());
            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("kehu/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {

    }


    function dataBind() {


    <!--  级联表的数据回显  -->


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#name").val(ruleForm.name);
        $("#phone").val(ruleForm.phone);
        $("#youxiang").val(ruleForm.youxiang);
        $("#idNumber").val(ruleForm.idNumber);
        $("#nation").val(ruleForm.nation);
        $("#birthplace").val(ruleForm.birthplace);
        $("#kehuContent").val(ruleForm.kehuContent);
        $("#insertTime-input").val(ruleForm.insertTime);

    }
    <!--  级联表的数据回显  -->

    //图片显示
    function showImg() {
        <!--  当前表的图片  -->
        $("#myPhotoImg").attr("src",ruleForm.myPhoto);

        <!--  级联表的图片  -->
    }


    <!--  级联表的图片  -->


    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            sexTypesSelect();
            politicsTypesSelect();
            diquTypesSelect();
            biaoqianTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationSextypesSelect();
            initializationPoliticstypesSelect();
            initializationDiqutypesSelect();
            initializationBiaoqiantypesSelect();
            <!--  初始化级联表的下拉框  -->

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') != '管理员') {
            $('#jifen').attr('readonly', 'readonly');
            //$('#money').attr('readonly', 'readonly');
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>