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

import com.icia.semi.dto.Board;
import com.icia.semi.dto.Search;
import com.icia.semi.service.BService;

@Controller
public class BController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private BService bsvc;

	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "board/write";
	}

	@RequestMapping(value = "/bWrite", method = RequestMethod.POST)
	public ModelAndView bWrite(@ModelAttribute Board board) {
		mav = bsvc.bWrite(board);
		return mav;
	}

	@RequestMapping(value = "/bView", method = RequestMethod.GET)
	public ModelAndView bView(@RequestParam("bNum") int bNum) {
		mav = bsvc.bView(bNum);
		return mav;
	}

	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(@RequestParam("bNum") int bNum) {
		mav = bsvc.modifyForm(bNum);
		return mav;
	}

	@RequestMapping(value = "/bModify", method = RequestMethod.POST)
	public ModelAndView bModify(@ModelAttribute Board board) {
		mav = bsvc.bModify(board);
		return mav;
	}

	@RequestMapping(value = "/bDelete", method = RequestMethod.GET)
	public ModelAndView bDelete(@ModelAttribute Board board) {
		mav = bsvc.bDelete(board);
		return mav;
	}

	@RequestMapping(value = "/bList", method = RequestMethod.GET)
	public ModelAndView bList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit) {
		mav = bsvc.bList(page, limit);
		return mav;
	}

	@RequestMapping(value = "/bSearch", method = RequestMethod.GET)
	public ModelAndView bSearch(@ModelAttribute Search search) {
		mav = bsvc.bSearch(search);
		return mav;
	}

	@RequestMapping(value = "/likePost", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> likePost(@RequestParam("BNum") int bNum, @RequestParam("userId") String userId) {
		Map<String, Object> result = new HashMap<>();
		try {
			int likes = bsvc.likePost(bNum, userId);
			result.put("status", "success");
			result.put("likes", likes);
		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}
		return result;
	}

	@RequestMapping(value = "/reportPost", method = RequestMethod.POST)
	public ModelAndView reportPost(@RequestParam("bNum") int bNum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("1 bNum = " + bNum);
		try {
			bsvc.reportPost(bNum);
			mav.setViewName("reported"); // 이동할 JSP 파일 이름 설정 (reported.jsp)
			mav.addObject("status", "success");
		} catch (Exception e) {
			mav.setViewName("error"); // 에러 페이지로 이동
			mav.addObject("status", "error");
			mav.addObject("message", e.getMessage());
		}
		return mav;
	}
}
