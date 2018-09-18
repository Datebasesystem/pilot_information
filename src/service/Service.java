/**
 * service层
 * <p>业务层，用于实现查询等业务，并将得到的结果发送到servlet层 <br>
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/08/23,email:962271983@qq.com
 */


package service;


import javadao.JavaDao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Service {

    //sql返回
    private List list;


    public List getPilotsId() throws SQLException {
        list = new ArrayList();
        list = JavaDao.getConnectionToJDBC(1);


        return list;
    }


    /**
     * @name 方法的名称:getData
     * @brief  方法的描述 : 通过飞行员出生年份查询飞行员。用于ajax请求
     * @param keywords 表示出生的年分
     * @return List<Pilots>  飞行员信息
     * @throws
     * @author 周瑛
     */

    public List<String> getData (int keywords)throws SQLException{
        list = new ArrayList();
        //由于出生年份十分接近，都是19**年，所以在小于3位不进行查询，节约服务器资源
        if((keywords+"").length() <3){
            return list;
        }
       list = JavaDao.searchYear(keywords);

        return list;
    }

}

