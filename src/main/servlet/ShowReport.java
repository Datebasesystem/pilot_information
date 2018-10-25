/**
 * servlet层
 * <p>调用service层取得的数据  <br>
 * 将数据封装，发送http请求到前端
 *
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/08/24,email:962271983@qq.com
 */


package main.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.ShowList;
import net.sf.json.JSONArray;
import main.service.Service;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ShowReport extends HttpServlet {


    public ShowReport(){
        super();
    }
    public void init() throws ServletException{

    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws IOException {
//        System.out.println("123");
        //首先，获得客户端发送来的数据keyword
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<String> list = new ArrayList();
        Integer keyword = Integer.valueOf(request.getParameter("keyword"));
        //  之前传入的仅仅为一个数字，可以用int

        //获得关键字之后进行处理，得到关联数据
        Service service = new Service();
        try {
            list = service.getData(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
        }




//        返回JSON格式
        //System.out.println(list);

        System.out.println(JSONArray.fromObject(list));
        response.getWriter().write(JSONArray.fromObject(list).toString());

        //response.getWriter().write(JSONArray.fromObject(list).toString());

        //如何将listSum的内容返回给前端？



    }
/**
 * @name 方法的名称  doPostPilots
 * @brief  方法的描述  传入飞行员的数据，用post方法将查询的结果返回
 * @param 参数说明 b true 表示显示，false 表示隐藏
 * @param 参数说明
 * @return 返回值
 * @throws 对方法可能抛出的异常进行说明
 * @author 周瑛
 */

    public void doPostPilots(HttpServletRequest request , HttpServletResponse response ) throws IOException{


        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");


        /**
         *
         * 对飞行员以出生年份进行查询
         */
        String keywordSelection = String.valueOf(request.getParameter("selection"));
        //获得关键字之后进行处理，得到关联数据

        ShowList listSum = new ShowList();
        Service service2 = new Service();
        try {
            listSum = service2.getSelectionAnswer(keywordSelection);
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        返回JSON格式
        //System.out.println(list);



        //response.getWriter().write(JSONArray.fromObject(list).toString());

        //如何将listSum的内容返回给前端？
        //post方法
        request.getSession().setAttribute("BIRTHDAYTOSEARCH",listSum);

        //重定向
        response.sendRedirect("birthdayTable.jsp");

    }
    public void doPost(HttpServletRequest request , HttpServletResponse response ) throws IOException {
        List list = new ArrayList();
        Service service = new Service();
        try {
            list = service.getPilotsId();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("PILOTSID",list);

        //重定向
        response.sendRedirect("index.jsp");
    }

}
