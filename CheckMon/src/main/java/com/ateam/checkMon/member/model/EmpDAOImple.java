package com.ateam.checkMon.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class EmpDAOImple implements EmpDAO {

	private SqlSessionTemplate sqlMap;

	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//근무자 등록되려는 인덱스 가져오기
	public int getNextEmpIx() {
		int res = sqlMap.selectOne("getNextEmpIxSQL");
		return res;
	}
	
	//근무자 회원가입
	public int addEmpJoin(EmpDTO dto) {
		int count = sqlMap.insert("addEmpJoinSQL", dto);
		return count;
	}
	
	//근무자 자동로그인 랜덤비밀번호 생성
	public int addEmpPwd(EmpDTO dto) {
		int temp=sqlMap.update("addEmpPwdSQL",dto);
		return temp;
	}
	
	//근무자 자동로그인
	public String empAutoLogin(String e_email) {
		String temp=sqlMap.selectOne("empAutoLoginSQL",e_email);
		return temp;
	}
	
	//근무자 아이디 체크
	public String empIdCheck(String e_email) {
		String res=sqlMap.selectOne("empIdCheckSQL",e_email);
		return res;
	}
	
	//근무자 로그인
	public EmpDTO empLogin(Map<String, String> map) {
		EmpDTO list=sqlMap.selectOne("empLoginSQL",map);
		return list;
	}
	
	//근무자 인덱스
	public int empIx(String e_email) {
		int temp=sqlMap.selectOne("empIxSQL",e_email);
		return temp;
	}
	
	//근무자 이름
	public String empName(String e_email) {
		String res=sqlMap.selectOne("empNameSQL",e_email);
		return res;
	}
	
	//근무자 출근 - 근무자가 출근하는 매장 위도,경도 가져옴
	public HashMap<String, String> getStoreLocation(int emp_ix) {
		HashMap<String, String> res = sqlMap.selectOne("getStoreLocationSQL",emp_ix);
		return res;
	}
	
	// 근무자 출근 - QR정보와 매장IX 일치 확인
	public boolean checkQRAndStorIx(String e_email, String store_ix) {
		Map<String, String> temp = new HashMap<String, String>();
		temp.put("eemail", e_email);
		temp.put("storeIx", store_ix);
		
		boolean res = sqlMap.selectOne("checkQRAndStorIxSQL", temp) == null ? false : true;
		return res;
	}
	
	//근무자 - 매장정보 선택 시 매장 리스트 불러옴
	public List<StoreDTO> getStoreList(String searchStore){
		List<StoreDTO> list = sqlMap.selectList("getStoreListSQL",searchStore);
		return list;
	}
	
	//근무자 프로필 페이지 이동 선택시 DB값 전송
	public EmpDTO modEmpProfileForm(int emp_ix) {
		EmpDTO list=sqlMap.selectOne("modEmpProfileFormSQL",emp_ix);
		return list;
	}
		
	//근무자 프로필 수정
	public int modEmpProfile(EmpDTO dto) {
		int res=sqlMap.update("modEmpProfileSQL",dto);
		return res;
	}

}
