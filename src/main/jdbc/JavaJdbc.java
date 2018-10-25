/**
 * show 数据库连接层.
 * <p>show 用于连接Mysql数据库<br>
 * show 端口3306，用户名root，密码123
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/08/23,email:962271983@qq.com
 */


package main.jdbc;


import java.sql.*;


public class JavaJdbc {
    //数据库地址
    private static String url = "jdbc:mysql://127.0.0.1:3306/pilot?serverTimezone=UTC";
    //JDBC驱动
    private static String driverName = "com.mysql.jdbc.Driver";
    //数据库名字

    private static String user = "root";
    //数据库密码
    private static String password = "123";


    /**
     * @name getConnection
     * @brief  用于连接数据库
     * @throws null。连接失败的话，看下数据库服务是否打开
     * 返回一个链接给调用的方法
     * @author 周瑛
     *
     */

    public static Connection getConnection() throws SQLException, ClassCastException {
        Connection connection = null;
        Statement statement = null;
        //1.注册驱动

        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        connection = DriverManager.getConnection(url, user, password);
        return connection;
    }

    //关闭链接
    public static void close(PreparedStatement preparedStatement, Connection connection){
        if(connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(preparedStatement!=null){
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
