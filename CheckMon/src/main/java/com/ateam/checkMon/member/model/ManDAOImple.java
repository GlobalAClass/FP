package com.ateam.checkMon.member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ManDAOImple implements ManDAO {

	private SqlSessionTemplate sqlMap;

	public ManDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//관리자 매장정보 인덱스
	public int getNextManIx() {
		int res=sqlMap.selectOne("getNextManIxSQL");
		return res;
	}
	
	//관리자 매장정보 등록
	public int addStoreManJoin(StoreDTO sdto) {
		int count = sqlMap.insert("addStoreManJoinSQL",sdto);
		return count;
	}
	
	//관리자 회원가입
	public int addManJoin(ManDTO mdto) {
		int count = sqlMap.insert("addManJoinSQL",mdto);
		return count;
	}
	
	//관리자 자동로그인 랜덤비밀번호 생성
	public int addManPwd(ManDTO dto) {
		int temp=sqlMap.update("addManPwdSQL",dto);
		return temp;
	}
		
	//관리자 자동로그인
	public String manAutoLogin(String m_email) {
		String temp=sqlMap.selectOne("manAutoLoginSQL",m_email);
		return temp;
	}
	
	//관리자 아이디 체크
	public String manIdCheck(String m_email) {
		String res=sqlMap.selectOne("manIdCheckSQL",m_email);
		return res;
	}
	
	//관리자 로그인
	public List<ManDTO> manLogin(Map<String, String> map) {
		List<ManDTO> list=sqlMap.selectList("manLoginSQL",map);
		return list;
	}
	
	//관리자 이름
	public String manName(String m_email) {
		String res=sqlMap.selectOne("manNameSQL",m_email);
		return res;
	}
	
}
