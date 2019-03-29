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
	public String empIdCheck(String eemail) {
		String res=sqlMap.selectOne("empIdCheckSQL",eemail);
		return res;
	}
	
	//근무자 로그인
	public List<EmpDTO> empLogin(Map<String, String> map) {
		List<EmpDTO> list=sqlMap.selectList("empLoginSQL",map);
		return list;
	}
	
	//근무자 이름
	public String empName(String eemail) {
		String res=sqlMap.selectOne("empNameSQL",eemail);
		return res;
	}
	
	// 근무자 출근 - QR정보와 매장IX 일치 확인
	public boolean checkQRAndStorIx(String eemail, String storeIx) {
		Map<String, String> temp = new HashMap<String, String>();
		temp.put("eemail", eemail);
		temp.put("storeIx", storeIx);
		
		boolean res = sqlMap.selectOne("checkQRAndStorIxSQL", temp) == null ? false : true;
		return res;
	}

}
