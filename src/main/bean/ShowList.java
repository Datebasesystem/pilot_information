/**
 * show
 * <p>show   <br>
 * show
 *
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/10/22,email:962271983@qq.com
 */


package main.bean;

import java.util.ArrayList;
import java.util.List;

public class ShowList {

    private List<List> list = new ArrayList<List>();

    public List<List> getList() {
        return list;
    }

    public void setList(List<List> list1) {


        for(int i=0;i<list1.size();i++){//通过循环来赋值给另一个List
            Object object=list1.get(i);
            list.add((List) object);
        }

    }
}
