package com.icia.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.semi.dto.Member;
import com.icia.semi.dto.Search;
import com.icia.semi.service.MService;

@Controller
public class MController {
    @Autowired
    private MService msvc;

    @Autowired
    private HttpSession session;

    private ModelAndView mav = new ModelAndView();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index1() {
        return "index";
    }

    @RequestMapping(value = "/joinForm", method = RequestMethod.GET)
    public String joinForm() {
        return "member/join";
    }

    @RequestMapping(value = "/loginForm", method = RequestMethod.GET)
    public String loginForm() {
        return "member/login";
    }

    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    public @ResponseBody String idCheck(@RequestParam("mId") String mId) {
        String result = msvc.idCheck(mId);
        return result;
    }

    @RequestMapping(value = "/mJoin", method = RequestMethod.POST)
    public ModelAndView mJoin(@ModelAttribute Member member) {
        mav = msvc.mJoin(member);
        return mav;
    }

    @RequestMapping(value = "/mLogin", method = RequestMethod.POST)
    public ModelAndView mLogin(@ModelAttribute Member member) {
        mav = msvc.mLogin(member);
        return mav;
    }

    @RequestMapping(value = "/mList", method = RequestMethod.GET)
    public ModelAndView mList(
            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {
        mav = msvc.mList(page, limit);
        return mav;
    }

    @RequestMapping(value = "/mSearch", method = RequestMethod.GET)
    public ModelAndView mSearch(@ModelAttribute Search search) {
        mav = msvc.mSearch(search);
        return mav;
    }

    @RequestMapping(value = "/mView", method = RequestMethod.GET)
    public ModelAndView mView(@RequestParam("mId") String mId) {
        mav = msvc.mView(mId);
        return mav;
    }

    @RequestMapping(value = "/mModiForm", method = RequestMethod.GET)
    public ModelAndView mModiForm(@RequestParam("mId") String mId) {
        mav = msvc.mModiForm(mId);
        return mav;
    }

    @RequestMapping(value = "/mModify", method = RequestMethod.POST)
    public ModelAndView mModify(@ModelAttribute Member member) {
        mav = msvc.mModify(member);
        return mav;
    }

    @RequestMapping(value = "/mDelete", method = RequestMethod.GET)
    public ModelAndView mDelete(@RequestParam("mId") String mId, @RequestParam("mProfileName") String mProfileName) {
        mav = msvc.mDelete(mId, mProfileName);
        session.invalidate();
        return mav;
    }

    @RequestMapping(value = "/mLogout", method = RequestMethod.GET)
    public String mLogout() {
        session.invalidate();
        return "index";
    }
    
    @RequestMapping(value = "/pUp", method = RequestMethod.GET)
    public ModelAndView pUp(@RequestParam("mId") String mId) {
    	System.out.println("[1]jsp -> controller : " + mId);
        mav = msvc.pUp(mId); 
        return mav;
    }
   
}
