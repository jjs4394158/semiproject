package com.icia.semi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.semi.dto.Reserv;

@Repository
public class PDao {
    @Autowired
    private SqlSessionTemplate sql;

    public int getPointsById(String id) {
        return sql.selectOne("POINT.getPointsById", id);
    }

    public void updatePoints(String id, int points) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("points", points);
        sql.update("POINT.updatePoints", params);
    }

    public void saveReservation(Reserv reserv) {
        sql.insert("POINT.saveReservation", reserv);
    }

    public List<Reserv> getChangeHistory(String id) {
        return sql.selectList("POINT.getChangeHistory", id);
    }
}
