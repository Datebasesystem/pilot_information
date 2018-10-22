
<!DOVTYPE html>

<%--
  Created by IntelliJ IDEA.
  User: 周瑛
  Date: 2018/8/23
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.util.List" %>
<%@ page import="main.bean.Pilots" %>

<%@ page import="main.servlet.ShowReport" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
      <script src="js/highcharts.js"></script>
      <script src="js/jquery-3.3.1.min.js"></script>
     <script src="bootstrap.min.js"></script>
      <script src="bootstrap-table.js"></script>

      <script src="bootstrap-table-zh-CN.js"></script>
    <title>飞行员信息检索</title>
      <link rel="icon" href="img/ico.jpg"/>
      <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

      <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="no-cache">
    <meta http-equiv="keywords" content="no-cache">
    <meta http-equiv="description" content="no-cache">
      <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">


    <style type="text/css">

        body {background-color: #202838}
      table.hovertable{
        fond-family: verdana, arial , sans-serif;
        font-size: 13px;
        color: #333333;
        border-width: 1px;
        border-color: #999999;
        border-collapse: collapse;
      }




      table.hovertable th{
        background-color: #c3dde0;
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        vorder-color: #a9c6c9;

      }
      table.hovertable tr{
        background-color: #d4e3e5;
      }

      table.hovertable td{
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        vorder-color: #a9c6c9;
      }


      * {
          margin: 0;
          padding: 0;
      }

      #menu {
          position: relative;
          background-color: #000;
          width: 100%;
          height: 55px;
      }

      .logo {
          color: #57d4ce;
          display: inline-block;
          line-height: 55px;
          position: absolute;
          padding: 0 40px;
      }

      /*最上面一行*/
      ul {
          list-style: none;
          display: inline-block;
          padding-left: 136px;
      }

      ul li {
          line-height: 55px;
          text-align: center;
          position: relative;
          float: left;
      }

      a {
          text-decoration: none;
          color: #fff;
          display: block;
          padding: 0 20px;
          white-space: nowrap;
      }

      a:hover {

          color: #FFF;
          background-color: #ccc;
      }

      ul li ul li {
          float: none;
          margin-top: 2px;
          background-color: #000;
      }

      ul li ul li a:hover {
          color: #FFF;
          background-color: #ccc;
      }

      ul li ul {
          position: absolute;
          left: 0;
          top: 55px;
          display: none;
          padding-left: 0;
      }

      ul li:hover ul {
          display: block;
      }


/*查询按键*/
        .button{

            display: inline-block;
            padding: 5px 25px;
            font-size: 24px;
            cursor: pointer;
            text-align: center;
            color: #fff;
            background-color: #0aaddc;
            border-radius: 15px;
            box-shadow: 0 8px #999;
            outline: none;
            border: none;


        }
        .button:hover{
            opacity: 0.8;
        }
        .button:active{
            opacity: 0.8;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }

        /*ajax下拉框*/
        #mydiv{
            position: absolute;
            left: 50%;
            /*top: 15%;*/
            top: 50%;
            margin-left: -200px;
            margin-top: -50px;
        }
        .mouseOver{
            background: #708090;
            color: #FFFAFA;
        }
        .mouseOut{
            background: #FFFAFA;
            color: #000000;
        }

    </style>

      <script type="text/javascript">
            var xmlHttp;
            var lastHTTPPost;
          //获得飞行员出生年份的函数
          function getMoreContents() {
              //首先获得用户的输入
              var content = document.getElementById("keyword1");
               // alert(content);
              if(content.value == ""){
                  clearContent("content_table_body");
                  return;
              }
              if((content.value).length<3){
                  clearContent("content_table_body");
                  return;
              }

              //然后给服务器发送数据
              //因为我们使用ajax异步发送数据
              //所以我们需要使用对象XMLHttp
            //xmlHttp = 获得XmlHttp对象;
                xmlHttp = createXMLHttp();
              // alert(xmlHttp);
              //要给服务器发送数据
              var url = "search?keyword="+escape(content.value);
              //true表示JavaScript脚本会在send()方法后继续执行而不会等待服务器的响应


              xmlHttp.open("GET",url,true);
              //xmlHttp绑定回调方法，这个回调方法会在xmlHttp状态 改变的时候被调用
              //XMLHttp的状态有0-4，我们只关心4.4表示complete。
              //所以，当完成之后再调用回调方法才有意义
              xmlHttp.onreadystatechange=callback;
              xmlHttp.send(null);
          }

















            function sendTextToServer() {
                //首先获得用户的输入

                // alert(content);
                if(lastHTTPPost.value == ""){
                    clearContent("content_table_body");
                    return;
                }


                //然后给服务器发送数据
                //因为我们使用ajax异步发送数据
                //所以我们需要使用对象XMLHttp
                //xmlHttp = 获得XmlHttp对象;
                xmlHttp = createXMLHttp();
                // alert(xmlHttp);
                //要给服务器发送数据
                var url = "search?keyword="+escape(content.value);
                //true表示JavaScript脚本会在send()方法后继续执行而不会等待服务器的响应


                xmlHttp.open("GET",url,true);
                //xmlHttp绑定回调方法，这个回调方法会在xmlHttp状态 改变的时候被调用
                //XMLHttp的状态有0-4，我们只关心4.4表示complete。
                //所以，当完成之后再调用回调方法才有意义
                xmlHttp.onreadystatechange=callback;
                xmlHttp.send(null);
            }
















          //获得XMLHttp对象
          function createXMLHttp() {
              //大多数浏览器都适用
              var xmlHttp;
              if(window.XMLHttpRequest){
                  xmlHttp = new XMLHttpRequest();
              }
              //考虑浏览器的兼容性
              if(window.ActiveXObject){
                  xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                  if(!xmlHttp){
                      xmlHttp = new ActiveXObject("Msxml2.XMLHttp");

                  }
              }
              return xmlHttp;
          }

          //回调函数
            function callback() {
              //4代表完成
                if(xmlHttp.readyState == 4){
                    //200表示服务器响应成功
                    //404表示找不到资源
                    //500表示服务器异常
                    if( xmlHttp.status == 200){
                        //交互成功，获得响应的数据，是JSON格式
                        var result = xmlHttp.responseText;
                        //获得解析数据
                        var json = eval("(" + result + ")");
                        //JSP的json和java不太一样，需要在外部加（）
                        //获得数据后，动态显示
                        //输入框下面
                        setContent(json,"keyword1","content_table_body");

                    }
                }

            }
          //设置关联数据的展示,参数代表的是从服务器传过来的数据
          function setContent(contents,keyword,content_table_body) {
        //清空列表信息
              clearContent(content_table_body);
              //设定位置


              if(content_table_body=="content_table_body"){
                  setLocation();
              }else {
                  setLocation2();
              }


            //首先获得关联数据的长度，以此来确定生成多少<tr>
              var size = contents.length;
              //设置内容
              for(var i=0;i<size;i++){
                  var nextNode = contents[i];//代表json格式数据的di1个元素
                  var tr = document.createElement("tr");
                  var td = document.createElement("td");
                  td.setAttribute("border","0");

                  //下拉框背景颜色
                  td.setAttribute("bgcolor","#FFFAFA");

                  //td的两个样式，分别为鼠标在上面和鼠标移开
                  td.onmousemove=function(){
                      // this.className='mouseOver';

//鼠标移进来就添加了类属性
                          this.className='mouseOver';
//这是把鼠标移到内容上变成了手型;
                          this.style.cursor="pointer";

                  };
                  td.onmouseout=function (){
                      this.className='mouseOut';
                  };

                  //通过冒泡事件，实现点击文本，让文本框显示该数据.
                  // td元素是tbody元素子元素，冒泡事件，先执行子元素事件，实现要求
                  td.onmousedown = function(){
                      console.log("onmousedown");
                      document.getElementById(keyword).value = this.innerText;
                  };
                  td.onclick=function(){
                      console.log(this.innerText);
                      document.getElementById(keyword).value=this.innerText;
                  };


                  var text = document.createTextNode(nextNode);
                  td.appendChild(text);
                  tr.appendChild(td);
                  document.getElementById(content_table_body).appendChild(tr);

              }
          }

          //清空之前的数据
          function clearContent(content_table_body) {
              var contentTableBody = document.getElementById(content_table_body);
              var size = contentTableBody.childNodes.length;
              for(var i = size - 1; i >= 0 ; i--){
                  contentTableBody.removeChild(contentTableBody.childNodes[i]);

              }
              document.getElementById("popDiv").style.border="none";
          }

          //当输入框失去焦点的时候，关联信息清空
          function keywordBlur() {
              clearContent("content_table_body");
          }
// 设置显示关联信息的位置
          function setLocation() {
// 关联信息的显示位置要和输入框一致
              var content = document.getElementById("keyword1");
              // 输入框的宽度
              var width = content.offsetWidth;
              var left = content["offsetLeft"];//到左边框的距离
              var top = content["offsetTop"] + content.offsetHeight;//到顶部的距离
// 获得显示数据的div
              var popDiv=document.getElementById("popDiv");
              popDiv.style.border = "#202838 1px solid";
              popDiv.style.left = left  +  "px";
              popDiv.style.top = top + "px";
              popDiv.style.width = width + "px";
              document.getElementById("content_table").style.width = width+"px";

          }








          // keyword2的事件



            var xmlHttp2;
            //获得飞行员出生年份的函数
            function getMoreContents2() {
                //首先获得用户的输入
                var content2 = document.getElementById("keyword2");

    // alert(1);
                if(content2.value == "" || (content2.value).length<3){
                    clearContent("content_table_body2");
                    return;
                }

                //然后给服务器发送数据
                //因为我们使用ajax异步发送数据
                //所以我们需要使用对象XMLHttp
                //xmlHttp = 获得XmlHttp对象;
                xmlHttp2 = createXMLHttp();
                // alert(xmlHttp);
                //要给服务器发送数据
                var url2 = "search?keyword="+escape(content2.value);
                //true表示JavaScript脚本会在send()方法后继续执行而不会等待服务器的响应


                xmlHttp2.open("GET",url2,true);
                //xmlHttp绑定回调方法，这个回调方法会在xmlHttp状态 改变的时候被调用
                //XMLHttp的状态有0-4，我们只关心4.4表示complete。
                //所以，当完成之后再调用回调方法才有意义
                xmlHttp2.onreadystatechange=callback2;
                xmlHttp2.send(null);
            }


            //回调函数
            function callback2() {
                //4代表完成
                if(xmlHttp2.readyState == 4){
                    //200表示服务器响应成功
                    //404表示找不到资源
                    //500表示服务器异常
                    if(xmlHttp2.status == 200){
                        //交互成功，获得响应的数据，是JSON格式
                        var result2 = xmlHttp2.responseText;
                        //获得解析数据
                        var json2 = eval("(" + result2 + ")");
                        //JSP的json和java不太一样，需要在外部加（）
                        //获得数据后，动态显示
                        //输入框下面
                        setContent(json2,"keyword2","content_table_body2");

                    }
                }

            }

            //当输入框失去焦点的时候，关联信息清空
            function keywordBlur2() {
                clearContent("content_table_body2");
            }
            // 设置显示关联信息的位置
            function setLocation2() {
// 关联信息的显示位置要和输入框一致
                var content2 = document.getElementById("keyword2");


                // 输入框的宽度
                var width = content2.offsetWidth;
                var left = content2["offsetLeft"];//到左边框的距离
                var top = content2["offsetTop"] + content2.offsetHeight;//到顶部的距离
// 获得显示数据的div
                var popDiv2=document.getElementById("popDiv2");
                popDiv2.style.border = "#202838 1px solid";
                popDiv2.style.left = left  +  "px" ;
                popDiv2.style.top = top + "px";
                popDiv2.style.width = width + "px";
                document.getElementById("content_table2").style.width = width+"px";

            }











            // 动态展示输入信息

            function data(){
                var start = document.getElementById("keyword1");
                var end = document.getElementById("keyword2");
                // var str = '[{\'start\':\'' + start.value + '\',\'end\':\'' + end.value + '\'}]' ;
                var str = '{\'start\':\'' + start.value + '\',\'end\':\'' + end.value + '\'}' ;
                // alert(str);

                // 数据连接，为查询做准备
                lastHTTPPost = lastHTTPPost + str + ',';


                str = '[' + str + ']';
                var jsonObject=eval('('+str+')');

                for(var i=0;i<jsonObject.length;i++){
                    var tr=document.createElement('tr');
                    var tdstart=document.createElement('td');
                    var tdend=document.createElement('td');
                    // var tdage=document.createElement('td')
                    tdstart.innerHTML=jsonObject[i].start;
                    tdend.innerHTML=jsonObject[i].end;


                    tr.appendChild(tdstart);
                    tr.appendChild(tdend);

                    var tbody=document.getElementById('tbody');
                    tbody.appendChild(tr);
                }

            }





            //post提交表单数据


            function getXMLHttpRequest(){
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
// IE6, IE5 浏览器执行代码
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }
            window.onload=function()
            {
                var xmlhttp=getXMLHttpRequest();
                // var data={
                //     "username":"汤姆",
                //     "password":"123"
                // }
                // var stringData=JSON.stringify(data);

                lastHTTPPost = lastHTTPPost.substring(0,lastHTTPPost.length-1);
                lastHTTPPost = '[' + lastHTTPPost + ']';

                xmlhttp.onreadystatechange=function()
                {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("POST","${pageContext.request.contextPath}/AjaxDemo1",true);
//xmlhttp.setRequestHeader("text/plain;charset=UTF-8");//默认方式（可以发送json格式字符串）
//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
                xmlhttp.setRequestHeader("Content-type","application/json;charset=UTF-8");//可以发送json格式字符串

//xmlhttp.send(data);//后台无法接收
//发送json数据，首先POST方式，再需要先格式化为json格式的字符串发送过去,后台才能接收到，
//并且需要后台通过request.getInputStream获取数据，无法通过getInparamter方法获取
                xmlhttp.send(lastHTTPPost);
            }
      </script>


      </script>


  </head>
  <body onload="cascadeMenu()">
  <div class="text" style=" text-align:center ;color: white ; font-family: 华文行楷 ; font-size: 75px" >飞行员信息检索页面</div>



  <div id="menu" style="z-index: 200">
      <div class="logo">
          Zhouying
      </div>
      <ul>
          <li><a href="index.jsp">首页</a></li>
          <li><a href="birthday.jsp">按出生年份查询</a>
              <ul>
                  <li><a href="birthdayTable.jsp">以数据列表的方式显示</a></li>
                  <li><a href="#">以柱状图的方式显示</a></li>
                  <li><a href="#">以饼状图的方式显示</a></li>
                  <li><a href="#">以折线图的方式显示</a></li>
              </ul>
          </li>



          <li><a href="#">按飞行里程查询</a>
              <ul>
                  <li><a href="#">以数据列表的方式显示</a></li>
                  <li><a href="#">以柱状图的方式显示</a></li>
                  <li><a href="#">以饼状图的方式显示</a></li>
                  <li><a href="#">以折线图的方式显示</a></li>
              </ul>
          </li>
          <li><a href="#">按飞行时间查询</a>
              <ul>
                  <li><a href="#">以数据列表的方式显示</a></li>
                  <li><a href="#">以柱状图的方式显示</a></li>
                  <li><a href="#">以饼状图的方式显示</a></li>
                  <li><a href="#">以折线图的方式显示</a></li>
              </ul>
          </li>
          <li><a href="#">关于我们</a>
          </li>
      </ul>


</div>


<%--下拉框-----%>
  <%--city<select id="city" onchange="cascadeMenu();">--%>
      <%--<option value="1">北京</option>--%>
      <%--<option value="2">上海</option>--%>
      <%--<option value="3">天津</option>--%>
  <%--</select>--%>
  <%--section<select id="section">--%>

  <%--</select>--%>

  <%--<div class="text" style=" text-align:center ; margin-top: 50px;--%>
  <%--color: white ; font-family: 华文行楷 ; font-size: 35px" >请输入查询的组数：--%>

  <%--</div>--%>

  <%--<br>--%>

  <%--<div style=" text-align: center ">--%>
  <%--<input type="text" style="width:150px;height:30px; " id = "turn">--%>
      <%--&nbsp;--%>
      <%--<input type="submit" id="turnButton" class="button" value="确定"/>--%>

   <%--</div>--%>




  <div class="text" style=" text-align:center ; margin-top: 20px; color: white ; font-family: 华文行楷 ; font-size: 35px" > 请输入查询的数据范围:</div>
  <br>
  <br>






  <div id="Mydiv" style="z-index: 90; ">
      <!--输入框-->

      <input type ="text" style="width:150px;height:30px;" id = "keyword1"
             onkeyup="getMoreContents()"
      <%--绑定一个函数，实现失去焦点的功能--%>
            onblur="keywordBlur()"
      <%--当获得焦点的时候，需要与服务器进行交互，再将信息显示出来--%>
            onfocus="getMoreContents()"
      />
      &nbsp;
      <txt style="color: white ; font-size: 30px; ">~</txt>
      &nbsp;
      <input type ="text" style="width:150px; height:30px; " id = "keyword2"



             onkeyup="getMoreContents2()"
      <%--绑定一个函数，实现失去焦点的功能--%>
             onblur="keywordBlur2()"
      <%--当获得焦点的时候，需要与服务器进行交互，再将信息显示出来--%>
             onfocus="getMoreContents2()"
      />
      &nbsp;


     <form style="margin:0px;display:inline;"
           <%--action="ShowReport" method="post"--%>
     >
         <input type="button" id="save" class="button" value="提交" onclick="data()"/>



      </form>

      <%--下面是内容展示的区域--%>
      <div
  id="popDiv"
  style="position: absolute;" >
      <table id="content_table" bgcolor="FFFAFA" border="0" cellspacing="0" cellpadding="0">
            <tbody id="content_table_body">

            </tbody>

        </table>

      </div>

      <%--第二个数据--%>
      <div id="popDiv2"
           style="position: absolute; "
      >
          <table id="content_table2" bgcolor="FFFAFA" border="0"
                 cellspacing="0" cellpadding="0">
              <tbody id="content_table_body2">
              <%--动态查询出来的数据显示在这位置--%>
              <%--<tr><td bgcolor="white">ssss</td></tr>--%>
              <%--<tr><td bgcolor="white">ssss</td></tr>--%>
              <%--<tr><td bgcolor="white">ssss</td></tr>--%>
              </tbody>

          </table>
      </div>

  </div>




  <table class="hovertable" style= "position:absolute ; left:45.5% ;top:58%" >
      <thead>
      <tr>
          <th>start</th>
          <th>end</th>
          <%--<th>enasde</th>--%>
          <%--<th>salary</th>--%>
          <%--<th>age</th>--%>
          <%--<th><input type='button' value='导入数据' onclick="data()"></th>--%>
      </tr>
      </thead>
      <tbody id='tbody'>

      </tbody>
  </table>

      <input type="button" id="submit2" class="button" value="查询"
  style="position: absolute ; left  : 70% ; top:80%;"
  onclick="getXMLHttpRequest()"/>
  <%--下面是表格区域--%>
  <%--<table class="hovertable"  >--%>
      <%--<tr >--%>

          <%--<th colspan="6" style=" vertical-align:center ; text-align:center ;">飞行员信息表</th>--%>

      <%--</tr>--%>
      <%--<tr>--%>
          <%--<th>序号</th>--%>
          <%--<th>人员ID</th>--%>
          <%--<th>性别</th>--%>
          <%--<th>出生年份</th>--%>
          <%--<th>总旅行里程</th>--%>
          <%--<th>总旅行时间</th>--%>

      <%--</tr>--%>
      <%--<%--%>
          <%--List list = null;--%>
          <%--if(session.getAttribute("PILOTSID")!=null){--%>

              <%--list = (List)session.getAttribute("PILOTSID");--%>

              <%--if(list.size()>0){--%>
                  <%--int temp = 0;--%>
                  <%--int temp2 = 0;--%>
                  <%--int temp3= 0;--%>
                  <%--int temp4 = 0;--%>
                  <%--Pilots pi;--%>
                  <%--for(int i = 0 ; i < list.size(); i ++){--%>
                      <%--pi = new Pilots();--%>
                      <%--pi = (Pilots)list.get(i);--%>

      <%--%>--%>

      <%--<tr--%>
              <%--onmouseover="this.style.backgroundColor='#FFFF00';"--%>
          <%--onmouseout="this.style.backgroundColor='c3dde0';">--%>
          <%--<td><c:out value="${tem+=1}"></c:out></td>--%>


          <%--<td><c:out value="${tem+=1}"></c:out></td>--%>
          <%--<td><%=pi.getPilotsId()%></td>--%>
          <%--<td><%=pi.getPilotsSex()%></td>--%>
          <%--<td><%=pi.getPilotsBirthDay()%></td>--%>
          <%--<td><%=pi.getPilotsTotalTravelMileage()%></td>--%>
          <%--<td><%=pi.getPilotsTotalTravelTime()%></td>--%>

      <%--</tr>--%>

      <%--<%--%>
                  <%--}--%>
              <%--}--%>

          <%--}--%>
      <%--%>--%>



  <%--</table>--%>















  <div id="container" style="width: 600px; height:400px; text-align:center; margin:0 auto; z-index: 80;"></div>
  <script>
      // 图表配置
      var options = {

          chart: {
              type: 'bar'                          //指定图表的类型，默认是折线图（line）
          },
          title: {
              text: '我的第说的是图表'                 // 标题
          },
          xAxis: {
              categories: ['苹果', '香蕉', '橙子']   // x 轴分类
          },
          yAxis: {
              title: {
                  text: '吃水果个数'                // y 轴标题
              }
          },
          series: [{                              // 数据列
              name: '小明',                        // 数据列名
              data: [1, 0, 4]                     // 数据
          }, {
              name: '小红',
              data: [5, 7, 3]
          }]
      };
      // 图表初始化函数
      // var chart = Highcharts.chart('container', options);



  </script>



      <%--<form action="ShowReport" method="post" >--%>
      <%--<input type="submit" value="生成报表">--%>
  <%--</form>--%>


  </body>


</html>
