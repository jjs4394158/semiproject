package com.icia.semi.dao;

import java.util.List;
import java.util.Optional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.semi.dto.Board;
import com.icia.semi.dto.CWebtoon;
import com.icia.semi.dto.Paging;
import com.icia.semi.dto.Search;

@Repository
public class CWDao {

	@Autowired
	private SqlSessionTemplate sql;

	public void cwWrite(CWebtoon cwebtoon) {
		sql.insert("CWEBTOON.cwWrite", cwebtoon);
	}

	public CWebtoon cwView(int cwNum) {
		return sql.selectOne("CWEBTOON.cwView", cwNum);
	}

	public int cwCount(int cwNum) {
		return sql.update("CWEBTOON.cwCount", cwNum);
	}

	public void cwModify(CWebtoon cwebtoon) {
		sql.update("CWEBTOON.cwModify", cwebtoon);
	}

	public void cwDelete(int cwNum) {
		sql.delete("CWEBTOON.cwDelete", cwNum);
	}

	public int cwCtn() {
		return sql.selectOne("CWEBTOON.cwCtn");
	}

	public List<CWebtoon> cwList(Paging paging) {
		return sql.selectList("CWEBTOON.cwList", paging);
	}

	public List<CWebtoon> cwSearch(Search search) {
		return sql.selectList("CWEBTOON.cwSearch", search);
	}

	// 좋아요 관련 메서드 추가
	public Optional<Integer> checkUserLike(int cwNum, String userId) {
		Integer count = sql.selectOne("CWEBTOON.checkUserLike", new LikeParams(cwNum, userId));
		return count != null && count > 0 ? Optional.of(count) : Optional.empty();
	}

	public void addUserLike(int cwNum, String userId) {
		sql.insert("CWEBTOON.addUserLike", new LikeParams(cwNum, userId));
	}

	public void incrementLikeCount(int cwNum) {
		sql.update("CWEBTOON.incrementLikeCount", cwNum);
	}

	public int getLikeCount(int cwNum) {
		return sql.selectOne("CWEBTOON.getLikeCount", cwNum);
	}

	// 내부 클래스 추가
	public static class LikeParams {
		private int cwNum;
		private String userId;

		public LikeParams(int cwNum, String userId) {
			this.cwNum = cwNum;
			this.userId = userId;
		}

		public int getcwNum() {
			return cwNum;
		}

		public void setcwNum(int cwNum) {
			this.cwNum = cwNum;
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
		private int cwNum;
		private String userId;

		public ReportParams(int cwNum, String userId) {
			this.cwNum = cwNum;
			this.userId = userId;
		}

		public int getcwNum() {
			return cwNum;
		}

		public void setcwNum(int cwNum) {
			this.cwNum = cwNum;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}
	}

	

    public void reportPost(int cwNum) {
        sql.update("CWEBTOON.reportCwPost", cwNum);
    }
	
	
}
