<%--
  Created by IntelliJ IDEA.
  User: muqi1118
  Date: 2019/6/28
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/lib/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
    <legend>开启复选框</legend>

<div id="test7" class="demo-tree"></div>

    <script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script src="/lib/layui/layui.all.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    function proJSON(oldArr, pid) {
        var newArr = [];
        var self = this;
        oldArr.map(function(item) {
            if(item.pId == pid) {
                var obj = {
                    id: item.id,
                    title: item.name
                }
                var childs = self.proJSON(oldArr, item.id);
                if(childs.length > 0) {
                    obj.children = childs
                }
                newArr.push(obj)
            }

        })
        return newArr;
    };

    $(function(){

        $.ajax({
            "url": "/auth/authList",
            type: "post",
            dataType: "json",
            success: function (res) {
                var d = res.data;
                var testData = proJSON(d, 0);
                console.log(testData);
                layui.use(['tree', 'util'], function () {
                    var tree = layui.tree
                        , layer = layui.layer
                        , util = layui.util

                    //开启复选框
                    tree.render({
                        elem: '#test7'
                        , data: testData
                        , showCheckbox: true
                    });
                });
            }
        });
    });
</script>

</body>
</html>