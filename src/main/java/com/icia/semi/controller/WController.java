package com.icia.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
import com.icia.semi.service.WService;
import com.icia.semi.dto.Webtoon;

@Controller
public class WController {

    @Autowired
    private WService wsvc;

    @RequestMapping(value="/wList", method = RequestMethod.GET)
    public String nList() {
        return "webtoon/webtoon";
    }
    
    @RequestMapping(value="webtoon", method=RequestMethod.GET)
    public @ResponseBody List<Webtoon> webtoon(@RequestParam(required = false) String platform, 
                                               @RequestParam(required = false) String genre) {
        if (platform != null && !platform.isEmpty() && genre != null && !genre.isEmpty()) {
            return wsvc.PAG(platform, genre);
        } else if (platform != null && !platform.isEmpty()) {
            return wsvc.WBP(platform);
        } else if (genre != null && !genre.isEmpty()) {
            return wsvc.WBG(genre);
        } else {
            return wsvc.AWebtoon();
        }
    }
}
