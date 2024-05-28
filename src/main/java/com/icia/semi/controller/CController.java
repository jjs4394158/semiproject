package com.icia.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.semi.dto.Comment;
import com.icia.semi.service.CService;


@Controller
public class CController<MyData> {

	@Autowired
	private CService csvc;


	  
	// cList : 댓글 목록
	    @RequestMapping(value="cList", method=RequestMethod.POST)
	    public @ResponseBody List<Comment> cList(@RequestParam("cbNum") int cbNum){
	        return csvc.cList(cbNum);
	    }

	    // cWrite : 댓글 입력
	    @RequestMapping(value="cWrite", method=RequestMethod.POST)
	    public @ResponseBody List<Comment> cWrite(@ModelAttribute Comment comment){
	        return csvc.cWrite(comment);
	    }
	    
	    // cModify : 댓글 수정
	    @RequestMapping(value="cModify", method=RequestMethod.POST)
	    public @ResponseBody List<Comment> cModify(@ModelAttribute Comment comment){
	        return csvc.cModify(comment);
	    }

	    // cDelete: 댓글 삭제
	    @RequestMapping(value="cDelete", method=RequestMethod.POST)
	    public @ResponseBody List<Comment> cDelete(@ModelAttribute Comment comment){
	        return csvc.cDelete(comment);
	    }

	    @RequestMapping(value="addLike", method=RequestMethod.POST)
	    public @ResponseBody boolean addLike(@RequestParam("commentId") int commentId, @RequestParam("userId") String userId) {
	        return csvc.addLike(commentId, userId);
	    }

	    @RequestMapping(value="/api/data", method=RequestMethod.POST)
	    public @ResponseBody ResponseEntity<String> receiveData(@RequestBody MyData data){
	        System.out.println("Received data: " + data.toString());
	        return new ResponseEntity<>("Data received successfully", HttpStatus.OK);
	    }
	 
}
