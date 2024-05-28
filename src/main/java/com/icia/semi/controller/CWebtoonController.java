package com.icia.semi.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.semi.dto.CWebtoon;
import com.icia.semi.dto.Search;
import com.icia.semi.service.CWebtoonService;

@Controller
public class CWebtoonController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private CWebtoonService cwsvc;

	@RequestMapping(value = "/cwwriteForm", method = RequestMethod.GET)
	public String writeForm() {
		return "cwebtoon/write";
	}

	@RequestMapping(value = "/dojeon", method = RequestMethod.GET)
	public String dojeon() {
		return "cwebtoon/list";
	}

	@RequestMapping(value = "/cwWrite", method = RequestMethod.POST)
	public ModelAndView cwWrite(@ModelAttribute CWebtoon cwebtoon) {
		mav = cwsvc.cwWrite(cwebtoon);
		return mav;
	}

	@RequestMapping(value = "/cwView", method = RequestMethod.GET)
	public ModelAndView cwView(@RequestParam("cwNum") int cwNum) {
	    mav = cwsvc.cwView(cwNum);
	    mav.addObject("view", mav.getModel().get("view")); // 기존에 있는 "view" 모델을 가져와서 추가
	    return mav;
	}


	@RequestMapping(value = "/cwmodifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(@RequestParam("cwNum") int cwNum) {
		mav = cwsvc.modifyForm(cwNum);
		return mav;
	}

	@RequestMapping(value = "/cwModify", method = RequestMethod.POST)
	public ModelAndView cwModify(@ModelAttribute CWebtoon cwebtoon) {
		mav = cwsvc.cwModify(cwebtoon);
		return mav;
	}

	@RequestMapping(value = "/cwDelete", method = RequestMethod.GET)
	public ModelAndView cwDelete(@ModelAttribute CWebtoon cwebtoon) {
		mav = cwsvc.cwDelete(cwebtoon);
		return mav;
	}

	@RequestMapping(value = "/cwList", method = RequestMethod.GET)
	public ModelAndView cwList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
	        @RequestParam(value = "limit", required = false, defaultValue = "10") int limit) {
	    ModelAndView mav = new ModelAndView();
	    try {
	        mav = cwsvc.cwList(page, limit);
	        mav.setViewName("cwebtoon/list"); // 해당 뷰의 이름 설정
	    } catch (Exception e) {
	        mav.setViewName("error"); // 에러가 발생한 경우의 뷰 이름 설정
	        mav.addObject("message", e.getMessage()); // 에러 메시지 추가
	    }
	    return mav;
	}


	@RequestMapping(value = "/cwSearch", method = RequestMethod.GET)
	public ModelAndView cwSearch(@ModelAttribute Search search) {
		mav = cwsvc.cwSearch(search);
		return mav;
	}

	@RequestMapping(value = "/likecwPost", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> likeCwPost(@RequestParam("cwNum") int cwNum, @RequestParam("userId") String userId) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        int likes = cwsvc.likeCwPost(cwNum, userId);
	        result.put("status", "success");
	        result.put("likes", likes);
	    } catch (Exception e) {
	        result.put("status", "error");
	        result.put("message", e.getMessage());
	    }
	    return result;
	}
	


	

	// 게시글 신고 처리
	@RequestMapping(value = "/reportCwPost", produces = "application/json")
	@ResponseBody
	public String reportCwPost(@RequestParam("cwNum") int cwNum) {
	    cwsvc.reportCwPost(cwNum);
	    return "{\"status\":\"success\"}";
	}
}
