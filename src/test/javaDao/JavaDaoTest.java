package test.javaDao;


import main.javadao.JavaDao;
import main.bean.Pilots;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JavaDaoTest {

    @Test
    public void searchYearOfSectionTest() throws SQLException {
        int start = 1935;
        int end = 1945;
        List<Pilots> list = new ArrayList<Pilots>();
        list = JavaDao.searchYearOfSection(start , end);
        //List<Object> list=new ArrayList<Object>();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getPilotsId());
        }
    }

    @Test
    public void getConnectionToGDBCTest() throws SQLException{
        int a=222;
        List<Pilots> sds = new ArrayList<Pilots>();
        sds = JavaDao.getConnectionToJDBC(a);
        for (int i = 0; i < sds.size(); i++) {
            //System.out.println(sds.get(i).getPilotsId());
        }


    }



}
