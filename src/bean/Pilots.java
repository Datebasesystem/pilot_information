/**
 * show Pilots
 * <p>show bean层核心，作为数据的载体<br>
 * show 整合了所有飞行员的信息
 * @version 1.0
 * @author Created by 周瑛 Created on 2018/08/23,email:962271983@qq.com
 */


package bean;

public class Pilots {
    //飞行员id
    private int pilotsId;
    //飞行员性别
    private int pilotsSex;
    //飞行员出生年份
    private int pilotsBirthDay;
    //飞行员总旅行里程
    private int pilotsTotalTravelMileage;
    //飞行员总旅行时间
    private int PilotsTotalTravelTime;

    public int getPilotsId() {
        return pilotsId;
    }

    public void setPilotsId(int pilotsId) {
        this.pilotsId = pilotsId;
    }

    public int getPilotsSex() {
        return pilotsSex;
    }

    public void setPilotsSex(int pilotsSex) {
        this.pilotsSex = pilotsSex;
    }

    public int getPilotsBirthDay() {
        return pilotsBirthDay;
    }

    public void setPilotsBirthDay(int pilotsBirthDay) {
        this.pilotsBirthDay = pilotsBirthDay;
    }

    public int getPilotsTotalTravelMileage() {
        return pilotsTotalTravelMileage;
    }

    public void setPilotsTotalTravelMileage(int pilotsTotalTravelMileage) {
        this.pilotsTotalTravelMileage = pilotsTotalTravelMileage;
    }

    public int getPilotsTotalTravelTime() {
        return PilotsTotalTravelTime;
    }

    public void setPilotsTotalTravelTime(int pilotsTotalTravelTime) {
        PilotsTotalTravelTime = pilotsTotalTravelTime;
    }
}
