package test.service;
import main.service.Service;

import java.sql.SQLException;


public class ServiceTest {
    private String keywords = "[{\"start\":\"1922\",\"end\":\"1930\"},{\"start\":\"1922\",\"end\":\"1930\"},{\"start\":\"1922\",\"end\":\"1930\"}]";

    @org.junit.Test
    public void getSelectionAnswerTest() throws SQLException {
        System.out.println(keywords);
        Service service = new Service();
        service.getSelectionAnswer(keywords);
    }
}
