package com.icia.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.semi.dao.CDao;
import com.icia.semi.dto.Comment;





@Service
public class CService {
	
	@Autowired
	private CDao cdao;

	public List<Comment> cList(int cbNum) {
        return cdao.cList(cbNum);
    }

    public List<Comment> cWrite(Comment comment) {
        cdao.cWrite(comment);
        return cdao.cList(comment.getCbNum());
    }

    public List<Comment> cModify(Comment comment) {
        cdao.cModify(comment);
        return cdao.cList(comment.getCbNum());
    }

    public List<Comment> cDelete(Comment comment) {
        cdao.cDelete(comment);
        return cdao.cList(comment.getCbNum());
    }

    public boolean addLike(int commentId, String userId) {
        if (!cdao.checkLike(commentId, userId)) {
            cdao.addLike(commentId, userId);
            return true;
        }
        return false;
    }
	
	
}
