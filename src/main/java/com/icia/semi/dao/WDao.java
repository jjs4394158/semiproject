package com.icia.semi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.icia.semi.dto.Webtoon;

@Repository
public class WDao {
    @Autowired
    private SqlSessionTemplate sql;

    public List<Webtoon> SWBP(String platform) {
        return sql.selectList("WEBTOON.SWBP", platform);
    }

    public List<Webtoon> SWBG(String genre) {
        return sql.selectList("WEBTOON.SWBG", genre);
    }

    public List<Webtoon> SWBPAG(String platform, String genre) {
        return sql.selectList("WEBTOON.SWBPAG", Map.of("platform", platform, "genre", genre));
    }

    public List<Webtoon> SAW() {
        return sql.selectList("WEBTOON.SAW");
    }
}
