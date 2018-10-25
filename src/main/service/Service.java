/**
 * service层
 * <p>业务层，用于实现查询等业务，并将得到的结果发送到servlet层 <br>
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/08/23,email:962271983@qq.com
 */


package main.service;


import main.bean.Pilots;
import main.bean.ShowList;
import main.javadao.JavaDao;

import java.sql.SQLException;
import java.util.*;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONArray;

public class Service {

    //sql返回
    private List list;


    public List getPilotsId() throws SQLException {
        list = new ArrayList();
        list = JavaDao.getConnectionToJDBC(1);


        return list;
    }


    /**
     * @param keywords 表示出生的年分
     * @return List<Pilots>  飞行员信息
     * @throws
     * @name 方法的名称:getData
     * @brief 方法的描述 : 通过飞行员出生年份查询飞行员。用于ajax请求
     * @author 周瑛
     */

    public List<String> getData(int keywords) throws SQLException {
        list = new ArrayList();
        //由于出生年份十分接近，都是19**年，所以在小于3位不进行查询，节约服务器资源
        if ((keywords + "").length() < 3) {
            return list;
        }
        list = JavaDao.searchYear(keywords);

        return list;
    }

    /**
     * @param 参数说明 keywords 为传入的JSON 我们对其进行拆分，分为多个json，每个json分别查询
     *             将结果连成一张表
     *             true 表示显示，false 表示隐藏
     * @return 返回值 ShowList 类 即为查询的结果
     *          该类其实就是一个list 的合集，把list放在list中
     * @throws 对方法可能抛出的异常进行说明 SQLException
     * @name getSelectionAnswer
     * @brief 输入JSON格式的数据，为[{"start":"1922","end":"1930"},{"start":"1922","end":"1930"},{"start":"1922","end":"1930"}]
     * @author 周瑛
     */

    public ShowList getSelectionAnswer(String keywords) throws SQLException {
        List<Pilots> list2 = new ArrayList<Pilots>();
        List<List> listTem= new ArrayList<List>();
        ShowList listSum = new ShowList();

        //在前端，我们判断过，keyword不为空
        //keywords=keywords.replace("[", "");
        //keywords=keywords.replace("]", "");
        //System.out.println(keywords);
        JSONArray jsonArray = JSONObject.parseArray(keywords);
        int size = jsonArray.size();
        int start ;
        int end ;
        for (int i = 0; i < size; i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            //System.out.println(i+"  "++"    "+jsonObject.getInteger("end"));
            start = jsonObject.getInteger("start");
            end = jsonObject.getInteger("end");
            //将这两个数据送入JavaDao层搜索
            list2 = JavaDao.searchYearOfSection(start , end);
            listTem.add(list2);
            //listSum.setList(listem);

        }
        listSum.setList(listTem);
        /**
         *
         * 读取listSum的内容
        List t1;
        for(int i2 = 0;i2 < listSum.getList().size(); i2 ++){
            t1 = listSum.getList().get(i2);
            for(Object string1 : t1){
                System.out.println(string1);
            }

            //System.out.println(list.get(i));
        }
*/
        //完成
        return listSum;

    }
}
