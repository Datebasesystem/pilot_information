/**
 * 数据库交互层
 * <p>将查询的信息传导JDBC层，将返回的connection传给service层   <br>
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/08/28,email:962271983@qq.com
 */


package main.javadao;

import main.bean.Pilots;
import main.jdbc.JavaJdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JavaDao {

    private static Connection dbconnection;
    private static Statement st;
    private static ResultSet rs;
    private static String sql;
    //sql返回
    private static List list;
    private static Pilots pi;

    /**
     * @name getConnectionToJDBC
     * @brief  通过年份，返回飞行员详细信息
     * @param year 年份
     * @return 返回值 ResultSet 飞行员的所有信息，用于制作表格
     * @throws SQLException 查询失败
     * @author 周瑛
     */

    public static List getConnectionToJDBC(int year) throws SQLException {
        list = new ArrayList();

        try {
            dbconnection = JavaJdbc.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            st = (Statement) dbconnection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        sql = "SELECT Id id,Sex sex,BirthDay birthday,TotalTravelMileage" +
                " mile,TotalTravelTime mileTime FROM pilot_information " +
                "WHERE Id BETWEEN 222 AND 113211";

            //执行sql语句，需要容器去承载

        try {
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        while (rs.next()) {
            //用bean这个类去承载
            //每到一个循环当中，承载需要new一下。把容器在循环开始时初始化
            pi = new Pilots();
            pi.setPilotsId(rs.getInt("id"));
            pi.setPilotsSex(rs.getInt("sex"));
            pi.setPilotsBirthDay(rs.getInt("birthday"));
            pi.setPilotsTotalTravelMileage(rs.getInt("mile"));
            pi.setPilotsTotalTravelTime(rs.getInt("mileTime"));
            list.add(pi);

        }

        return list;
    }
/**
 * @name searchYear
 * @brief  用于ajax的返回，仅仅返回年份的分类，用于提高用户的友好度
 * @param year，即用户查询的年份  year>=3
 * @return 返回值 List<Integer> 即年份的时间
 * @throws SQLException 抛出SQL异常，即查询失败
 * @author 周瑛
 */

    public static List<String> searchYear(int year) throws SQLException{
        list = new ArrayList();

        try {
            dbconnection = JavaJdbc.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            st = (Statement) dbconnection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        sql = "SELECT BirthDay birthday FROM pilot_information " +
                "WHERE BirthDay LIKE '"+year+"%'GROUP BY BirthDay";

            //执行sql语句，需要容器去承载

        try {
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        while (rs.next()){
            list.add(String.valueOf(rs.getInt("birthday")));
        }
        return list;
    }

    /**
     * @name searchYearOfSection
     * @brief  通过起始和结束的年份，查询飞行员的所有信息，并将其放在list2中
     * @param 参数说明 start 表示开始年份，edn 表示结束年份
     * @param
     * @return 返回值 list2  表示查询的结果
     * @throws 对方法可能抛出的异常进行说明  SQLexception
     * @author 周瑛
     */

    public static List<Pilots> searchYearOfSection(int start, int end) throws SQLException {


        List list2 = new ArrayList();
//        list2.add("1123");
//        list2.add("11wqwe23");
//        list2.add("1123zxdfas");
//        list2.add("1123");
//        list2.add("1qwe123");

//        /*
        try {
            dbconnection = JavaJdbc.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            st = (Statement) dbconnection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        sql = "SELECT Id id,Sex sex,BirthDay birthday,TotalTravelMileage" +
                " mile,TotalTravelTime mileTime FROM pilot_information " +
                "WHERE Birthday BETWEEN '" + start + "' AND '" + end + "'";
        //执行sql语句，需要容器去承载

        ResultSet rs2 = null;
        try {
            rs2 = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Pilots pi2;
        while (rs2.next()) {
            //用bean这个类去承载
            //每到一个循环当中，承载需要new一下。把容器在循环开始时初始化
            pi2 = new Pilots();
            pi2.setPilotsId(rs2.getInt("id"));
            pi2.setPilotsSex(rs2.getInt("sex"));
            pi2.setPilotsBirthDay(rs2.getInt("birthday"));
            pi2.setPilotsTotalTravelMileage(rs2.getInt("mile"));
            pi2.setPilotsTotalTravelTime(rs2.getInt("mileTime"));
            list2.add(pi2);
        }
  //      */
        return list2;
    }

}

