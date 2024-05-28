package com.icia.semi.service;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.semi.dao.PDao;
import com.icia.semi.dto.Reserv;

import java.util.List;

@Service
public class PService {
    @Autowired
    private PDao pdao;

    @Autowired
    private HttpSession session;

    public int getPointsById(String loginId) {
        return pdao.getPointsById(loginId);
    }

    public ModelAndView reserv(Reserv reserv) {
        ModelAndView mav = new ModelAndView();
        String loginId = (String) session.getAttribute("loginId");
        int currentPoints = pdao.getPointsById(loginId);
        int itemPrice = reserv.getPrice();

        if (currentPoints < itemPrice) {
            mav.setViewName("redirect:/cPoint");
            mav.addObject("message", "포인트가 부족합니다.");
        } else {
            pdao.updatePoints(loginId, currentPoints - itemPrice);
            reserv.setRid(loginId); // 로그인 아이디를 예약 정보에 포함
            pdao.saveReservation(reserv);
            session.setAttribute("mpoints", currentPoints - itemPrice);
            mav.setViewName("redirect:/change");
        }
        
        return mav;
    }

    public ModelAndView getChangeHistory(String loginId) {
        ModelAndView mav = new ModelAndView();
        List<Reserv> reservList = pdao.getChangeHistory(loginId);
        mav.addObject("reservList", reservList);
        mav.setViewName("point/change");
        return mav;
    }
    
    
}
