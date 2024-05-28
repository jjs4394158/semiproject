package com.icia.semi.dao;

import java.util.List;
import java.util.Optional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.semi.dto.Board;
import com.icia.semi.dto.Paging;
import com.icia.semi.dto.Search;

@Repository
public class BDao {

	@Autowired
	private SqlSessionTemplate sql;

	public void bWrite(Board board) {
		sql.insert("BOARD.bWrite", board);
	}

	public Board bView(int bNum) {
		return sql.selectOne("BOARD.bView", bNum);
	}

	public int bCount(int bNum) {
		return sql.update("BOARD.bCount", bNum);
	}

	public void bModify(Board board) {
		sql.update("BOARD.bModify", board);
	}

	public void bDelete(int bNum) {
		sql.delete("BOARD.bDelete", bNum);
	}

	public int bCtn() {
		return sql.selectOne("BOARD.bCtn");
	}

	public List<Board> bList(Paging paging) {
		return sql.selectList("BOARD.bList", paging);
	}

	public List<Board> bSearch(Search search) {
		return sql.selectList("BOARD.bSearch", search);
	}

	// 좋아요 관련 메서드 추가
	public Optional<Integer> checkUserLike(int bNum, String userId) {
		Integer count = sql.selectOne("BOARD.checkUserLike", new LikeParams(bNum, userId));
		return count != null && count > 0 ? Optional.of(count) : Optional.empty();
	}

	public void addUserLike(int bNum, String userId) {
		sql.insert("BOARD.addUserLike", new LikeParams(bNum, userId));
	}

	public void incrementLikeCount(int bNum) {
		sql.update("BOARD.incrementLikeCount", bNum);
	}

	public int getLikeCount(int bNum) {
		return sql.selectOne("BOARD.getLikeCount", bNum);
	}

	// 내부 클래스 추가
	public static class LikeParams {
		private int bNum;
		private String userId;

		public LikeParams(int bNum, String userId) {
			this.bNum = bNum;
			this.userId = userId;
		}

		public int getbNum() {
			return bNum;
		}

		public void setbNum(int bNum) {
			this.bNum = bNum;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}
	}

	// 내부 클래스 추가
	public static class ReportParams {
		private int bNum;
		private String userId;

		public ReportParams(int bNum, String userId) {
			this.bNum = bNum;
			this.userId = userId;
		}

		public int getbNum() {
			return bNum;
		}

		public void setbNum(int bNum) {
			this.bNum = bNum;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}
	}

	

	public void reportPost(int bNum) {
        sql.update("BOARD.reportPost", bNum);
        System.out.println("3 bNum = " + bNum);
    }
	/*
	 * public void reportPost(int bNum, String userId) {
	 * sql.update("BOARD.reportPost", new ReportParams(bNum, userId)); }
	 */
	
	
}
