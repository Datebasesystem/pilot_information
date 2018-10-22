<%@ page import="java.util.List" %>
<%@ page import="main.bean.Pilots" %>
<%@ page import="main.servlet.ShowReport" %><%--
  Created by IntelliJ IDEA.
  User: 周瑛
  Date: 2018/8/23
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <script src="js/highcharts.js"></script>
      <script src="js/jquery-3.3.1.min.js"></script>
    <title>飞行员信息检索</title>
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



      * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
      }

      .parent {
          width: 681px;
          height: 384px;
          top: 0;
          bottom: 0;
          left: 0;
          right: 0;
          margin: auto auto;
          overflow: hidden;
          position: absolute;
          -webkit-box-shadow: 0 0 88px 5px rgba(0, 0, 0, 0.75);
          -moz-box-shadow: 0 0 88px 5px rgba(0, 0, 0, 0.75);
          box-shadow: 0 0 88px 5px rgba(0, 0, 0, 0.75);
      }

      svg {
          position: absolute;
          z-index: 1;
          width: 681px;
          height: 384px;
      }

      button {
          position: absolute;
          z-index: 50;
          width: 40px;
          overflow: hidden;
          height: 40px;
          border: none;
          border-radius: 50%;
          background: #fff;
          cursor: pointer;
          -webkit-box-shadow: 0 0 88px 5px rgba(0, 0, 0, 0.75);
          -moz-box-shadow: 0 0 88px 5px rgba(0, 0, 0, 0.75);
          box-shadow: 0 0 88px 5px rgba(0, 0, 0, 0.75);
      }
      button:focus {
          outline-width: 0;
      }

      circle {
          stroke: #fff;
          fill: none;
          transition: 0.3s;
      }

      #svg1 circle {
          transition-timing-function: linear;
      }

      #svg2 circle {
          transition-timing-function: linear;
      }

      #Capa_1 {
          position: absolute;
          width: 16px;
          height: 16px;
          transform: translate(-7px, -8px);
      }

      #Capa_2 {
          position: absolute;
          width: 16px;
          height: 16px;
          transform: translate(-9px, -8px);
      }

      .right {
          margin-left: 628px;
          margin-top: 168px;
          border: 1px solid #849494;
          background-color: transparent;
          transition: .5s;
      }
      .right:hover {
          background-color: #fff;
      }

      .left {
          margin-left: 0.5%;
          margin-top: 6.17%;
          border: 1px solid #849494;
          background-color: transparent;
          transition: .5s;
      }
      .left:hover {
          background-color: #fff;
      }

      .circle1 {
          transition-delay: 0.05s;
      }

      .circle2 {
          transition-delay: 0.1s;
      }

      .circle3 {
          transition-delay: 0.15s;
      }

      .circle4 {
          transition-delay: 0.2s;
      }

      .circle5 {
          transition-delay: 0.25s;
      }

      .circle6 {
          transition-delay: 0.3s;
      }

      .circle7 {
          transition-delay: 0.35s;
      }

      .circle8 {
          transition-delay: 0.4s;
      }

      .circle9 {
          transition-delay: 0.45s;
      }

      .circle10 {
          transition-delay: 0.05s;
      }

      .circle11 {
          transition-delay: 0.1s;
      }

      .circle12 {
          transition-delay: 0.15s;
      }

      .circle13 {
          transition-delay: 0.2s;
      }

      .circle14 {
          transition-delay: 0.25s;
      }

      .circle15 {
          transition-delay: 0.3s;
      }

      .circle16 {
          transition-delay: 0.35s;
      }

      .circle17 {
          transition-delay: 0.4s;
      }

      .circle18 {
          transition-delay: 0.45s;
      }

      .slide1 {
          background-image: url("img/1.jpg");
      }

      .slide2 {
          background-image: url("img/2.jpg");
      }

      .slide3 {
          background-image: url("img/3.jpg");
      }

      .slide4 {
          background-image: url("img/4.jpg");
      }

      .slider {
          position: absolute;
          width: 400%;
          height: 100%;
          background: #000;
          display: inline-flex;
          overflow: hidden;
      }

      .slide1,
      .slide2,
      .slide3,
      .slide4 {
          position: absolute;
          background-position: center;
          background-size: cover;
          color: #fff;
          font-size: 62px;
          padding-top: 138px;
          font-weight: 800;
          font-family: 'Heebo', sans-serif;
          text-align: center;
          width: 25%;
          height: 100%;
          z-index: 10;
          transition: 1.4s;
      }

      .tran {
          transform: scale(1.3);
      }

      .up1 {
          z-index: 20;
      }

      .up2 {
          z-index: 40;
      }

      .steap {
          stroke-width: 0;
      }

      .streak {
          stroke-width: 82px;
      }

      @media (max-width: 700px) {
          .parent {
              margin-left: 1%;
          }
      }



    </style>
  </head>
  <body>
  <div class="text" style=" text-align:center ;color: white ; font-family: 华文行楷 ; font-size: 75px" >飞行员信息检索页面</div>

  <div id="menu">
      <div class="logo">
          Zhouying
      </div>
      <ul>
          <li><a href="index.jsp">首页</a></li>
          <li><a href="birthday.jsp">按出生年份查询</a>
              <ul>
                  <li><a href="#">以数据列表的方式显示</a></li>
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

  <iframe frameborder="0" scrolling="no" src="index2.jsp" width="100%" height="500px"></iframe>



  </body>


</html>
