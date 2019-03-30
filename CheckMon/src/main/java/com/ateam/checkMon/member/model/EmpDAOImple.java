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
	
	//근무자 회원가입
	public int addEmpJoin(EmpDTO dto) {
		int count = sqlMap.insert("addEmpJoinSQL", dto);
		return count;
	}
	
	//근무자 아이디 체크
	public String empIdCheck(String e_email) {
		String res=sqlMap.selectOne("empIdCheckSQL",e_email);
		return res;
	}
	
	//근무자 로그인
	public List<EmpDTO> empLogin(Map<String, String> map) {
		List<EmpDTO> list=sqlMap.selectList("empLoginSQL",map);
		return list;
	}
	
	//근무자 이름
	public String empName(String e_email) {
		String res=sqlMap.selectOne("empNameSQL",e_email);
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

}
