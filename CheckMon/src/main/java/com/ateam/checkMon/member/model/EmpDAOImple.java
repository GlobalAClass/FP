package com.ateam.checkMon.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ateam.checkMon.PayRoll.model.WorkTimeDTO;
import com.ateam.checkMon.empCommute.model.EmpCommuteDTO;

public class EmpDAOImple implements EmpDAO {

	private SqlSessionTemplate sqlMap;

	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//근무자 출근 중인지 확인 - 출근중이라면 출근한 테이블 인덱스, 출근시간 반환
	public EmpCommuteDTO checkWorking(int emp_ix) {
		EmpCommuteDTO res = sqlMap.selectOne("checkWorkingSQL", emp_ix);
		return res;
	}
	
	//근무자 출근하지 않았지만 관리자가 확인하여 테이블이 생성됬을 때, 출근시간 업데이트
	public int setWorktime(int emp_commute_ix) {
		int res = sqlMap.update("setWorktimeSQL", emp_commute_ix);
		return res;
	}
	
	//근무자 출근하기
	public int goToWork(int emp_ix) {
		int res = sqlMap.insert("goToWorkSQL", emp_ix);
		return res;
	}
	
	//근무자 퇴근하
	public int getOffWork(int emp_ix, int emp_commute_ix) {
		HashMap<String, Integer> temp = new HashMap<String, Integer>();
		temp.put("emp_ix", emp_ix);
		temp.put("emp_commute_ix", emp_commute_ix);

		int res = sqlMap.update("getOffWorkSQL", temp);
		
		return res;
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
	public boolean checkQRAndStorIx(CheckQRDTO temp) {
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

	//근무자 일한 시간 구하기
	public int getWorkTime(int emp_ix, String startday, String endday) {
		WorkTimeDTO temp = new WorkTimeDTO(emp_ix, startday, endday);
		//총근무시간 기록을 위해 출근 시간, 퇴근 시간 가져오기.
		List<WorkTimeDTO> cal = sqlMap.selectOne("getWorkLeaveTimeSQL", temp);
		
		int cal_len = cal.size();
		for(int i=0; i<cal_len; i++) {
			//시, 분으로 나누기
			String w_time = cal.get(i).getWorktime();
			String w[] = w_time.split(":");
			String l_time = cal.get(i).getLeavetime();
			String l[] = l_time.split(":");
			
			//나눈 시분 숫자로 치환하기
			Integer w_i[] = {Integer.parseInt(w[0]), Integer.parseInt(w[1])}; 
			Integer l_i[] = {Integer.parseInt(l[0]), Integer.parseInt(l[1])}; 
			
			//일반 근무시간 구하기(단위 : 분)
			Integer nomal = 0;
			//초과 근무시간 구하기(단위 : 분)
			Integer overtime = 0; 
			Integer night = 0;
	
			/*
			//퇴근 시간의 분이 출근 시간의 분보다 클 경우
			if(l_i[1]>=w_i[1]) {
				daytime = l_i[1]-w_i[1];
			}else { //작을 경우
				l_i[0] -= 1;
				daytime = l_i[1]-(60-w_i[1]);
			}
			*/
			
			//야간 근무시간인지 판단하기
			//출근 시간이 야간 근무 시간일 경우
			//22시에서 24시 사이
			if(w_i[0]>=22 && w_i[0]<=24) {
				
			}else if(0<w_i[0] && w_i[0]<6) {
				
			}
			//출근 시간은 야간 시간이 아니고
			else { 
				if((l_i[0]>=22 && l_i[0]<=24)) {
					int nomal_time = 22-w_i[0];
					int a= l_i[0] - 22;
				}else if((0<=l_i[0] && l_i[0]<=6)) {
					
				}
			}
		}
		
		return 1;
	}
}
