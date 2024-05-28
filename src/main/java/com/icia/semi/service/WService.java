package com.icia.semi.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icia.semi.dao.WDao;
import com.icia.semi.dto.Webtoon;

@Service
public class WService {
    @Autowired
    private WDao wdao;

    public List<Webtoon> WBP(String platform) {
        return wdao.SWBP(platform);
    }

    public List<Webtoon> WBG(String genre) {
        return wdao.SWBG(genre);
    }

    public List<Webtoon> PAG(String platform, String genre) {
        return wdao.SWBPAG(platform, genre);
    }

    public List<Webtoon> AWebtoon() {
        return wdao.SAW();
    }
}
