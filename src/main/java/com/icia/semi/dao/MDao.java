package com.icia.semi.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.semi.dto.Member;
import com.icia.semi.dto.Paging;
import com.icia.semi.dto.Search;

@Repository
public class MDao {
    @Autowired
    private SqlSessionTemplate sql;

    public String idCheck(String mId) {
        return sql.selectOne("MEMBER.idCheck", mId);
    }

    public void mJoin(Member member) {
        sql.insert("MEMBER.mJoin", member);
    }

    public Member mView(String mId) {
        return sql.selectOne("MEMBER.mView", mId);
    }

    public int mCount() {
        return sql.selectOne("MEMBER.mCount");
    }

    public List<Member> mList(Paging paging) {
        return sql.selectList("MEMBER.mList", paging);
    }

    public List<Member> mSearch(Search search) {
        return sql.selectList("MEMBER.mSearch", search);
    }

    public void mModify(Member member) {
        sql.update("MEMBER.mModify", member);
    }

    public void mDelete(String mId) {
        sql.delete("MEMBER.mDelete", mId);
    }
    
    public void pUp(String mId) {
        System.out.println("[3] 서비스 -> DAO : " + mId);
        sql.update("MEMBER.pUp", mId);
    }

}
