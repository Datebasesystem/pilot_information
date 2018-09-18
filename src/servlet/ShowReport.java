/**
 * servlet层
 * <p>调用service层取得的数据  <br>
 * 将数据封装，发送http请求到前端
 *
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/08/24,email:962271983@qq.com
 */


package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import service.Service;
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
        //获得关键字之后进行处理，得到关联数据
        Service service = new Service();
        try {
            list = service.getData(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
        }


//        返回JSON格式
        System.out.println(list);

        System.out.println(JSONArray.fromObject(list));
        response.getWriter().write(JSONArray.fromObject(list).toString());
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
        response.sendRedirect("birthday.jsp");
    }

}
