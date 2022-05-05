package com.project.railwayreservation.CRUD.DanujaCRUD;

import com.project.railwayreservation.connection.JDBCUtils;
import com.project.railwayreservation.model.TrainSchedule;
import com.project.railwayreservation.model.TrainStations;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DanujaSelect {

    //SQL Queries

    private static final String SELECT_SCHEDULES = "select t.tname, s1.station, s2.station, sh.sdate, sh.stime\n" +
            "from stations s1, stations s2, shedules sh, trains t\n" +
            "where s1.id = sh.fromStationId and s2.id = sh.toStationId and t.id = sh.tid and sh.fromStationId = ? and sh.toStationId= ? and sh.sdate = ? and t.seats > ? ";

    private static final String SELECT_ALL_SCHEDULES = "select t.tname,s1.id ,s1.station, s2.id, s2.station, sh.sdate, sh.stime\n" +
            "from stations s1, stations s2, shedules sh, trains t\n" +
            "where s1.id = sh.fromStationId and s2.id = sh.toStationId and t.id = sh.tid;";

    private static final String SELECT_ALL_STATIONS = "SELECT id, station FROM stations";


    public static List<TrainSchedule> selectSchedule(int fromId, int toId, Date sdate, int seats) throws SQLException{
        List<TrainSchedule> shedules = new ArrayList<>();

        try (Connection con = JDBCUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_SCHEDULES)) {
            ps.setInt(1, fromId);
            ps.setInt(2, toId);
            ps.setDate(3, sdate);
            ps.setInt(4,seats);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String tName = rs.getString(1);
                String from = rs.getString(2);
                String to = rs.getString(3);
                Date date = rs.getDate(4);
                Time time = rs.getTime(5);

                TrainSchedule ts = new TrainSchedule(tName, from, to, date, time);
                shedules.add(ts);
            }

        }
        return shedules;
    }

    public static List<TrainSchedule> selectAllSchedules() throws  SQLException {
        List<TrainSchedule> allSchedules = new ArrayList<>();

        try( Connection con = JDBCUtils.getConnection();
        PreparedStatement ps = con.prepareStatement(SELECT_ALL_SCHEDULES)){
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                String tName = rs.getString(1);
                int fromId = rs.getInt(2);
                String from = rs.getString(3);
                int toId = rs.getInt(4);
                String to = rs.getString(5);
                Date date = rs.getDate(6);
                Time time = rs.getTime(7);

                TrainSchedule ts = new TrainSchedule(tName, from, to, date, time, fromId, toId);
                allSchedules.add(ts);
            }
        }
        return allSchedules;
    }

    public static List<TrainStations> selectAllStations() throws SQLException {
        List<TrainStations> stations = new ArrayList<>();

        try(Connection con = JDBCUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(SELECT_ALL_STATIONS)){
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                int tid = rs.getInt("id");
                String station = rs.getString("station");

                TrainStations s = new TrainStations(tid, station);

                stations.add(s);
            }
        }
       return stations;
    }
}