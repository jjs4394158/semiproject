package com.icia.semi.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.semi.dto.Comment;



@Repository
public class CDao {

	@Autowired
	private SqlSessionTemplate sql;

	public List<Comment> cList(int cbNum) {
		return sql.selectList("COMMENT.cList", cbNum);
	}

	public void cWrite(Comment comment) {
		sql.insert("COMMENT.cWrite", comment);
	}

	public void cModify(Comment comment) {
		sql.update("COMMENT.cModify", comment);
	}

	public void cDelete(Comment comment) {
		sql.delete("COMMENT.cDelete", comment);
	}
	
	public void addLike(int commentId, String userId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("commentId", commentId);
        params.put("userId", userId);
        sql.insert("COMMENT.addLike", params);
    }

    public boolean checkLike(int commentId, String userId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("commentId", commentId);
        params.put("userId", userId);
        Integer count = sql.selectOne("COMMENT.checkLike", params);
        return count != null && count > 0;
    }
    
    public void bcDelete(int bNum) {
		sql.delete("COMMENT.bcDelete", bNum);
	}
	
}
