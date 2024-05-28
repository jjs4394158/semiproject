package com.icia.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.semi.dto.Reserv;
import com.icia.semi.service.PService;

@Controller
public class PController {
    @Autowired
    private PService psvc;

    @Autowired
    private HttpSession session;
    
    private ModelAndView mav = new ModelAndView();

    @RequestMapping(value = "/mPoint", method = RequestMethod.GET)
    public String mPoint() {
        String loginId = (String) session.getAttribute("loginId");
        int mpoints = psvc.getPointsById(loginId);
        session.setAttribute("mpoints", mpoints);
        return "point/mPoint";
    }
    
    @RequestMapping(value = "/cPoint", method = RequestMethod.GET)
    public String cPoint() {
        return "point/cPoint";
    }
    
    @RequestMapping(value = "/reserv", method = RequestMethod.POST)
    public ModelAndView reserv(@ModelAttribute Reserv reserv) {
        mav = psvc.reserv(reserv);
        return mav;
    }
    
    @RequestMapping(value = "/change", method = RequestMethod.GET)
    public ModelAndView change() {
        String loginId = (String) session.getAttribute("loginId");
        mav = psvc.getChangeHistory(loginId);
        return mav;
    }
    
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public String check() {
        return "point/check";
    }

    
}
