package com.ateam.checkMon.manEmpRun.model;

import org.mybatis.spring.SqlSessionTemplate;

import com.ateam.checkMon.member.model.EmpDTO;

import java.util.*;

public class ManEmpRunDAOImple implements ManEmpRunDAO {

	private SqlSessionTemplate sqlMap;

	public ManEmpRunDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int addManEmpRun(ManEmpRunDTO rdto) {
		int res = sqlMap.insert("addManEmpRunSQL", rdto);
		return res;
	}

	public List<ReqListDTO> getReqList(int man_ix) {
		List<ReqListDTO> list = sqlMap.selectList("getReqListSQL", man_ix);
		return list;
	}

	public List<RunListDTO> getRunList(int man_ix) {
		List<RunListDTO> list = sqlMap.selectList("getRunListSQL", man_ix);
		return list;
	}

	public int refuseEmp(int req_ix) {
		int res = sqlMap.delete("refuseEmpSQL", req_ix);
		return res;
	}

	public List<GroupDTO> getGroupList(int man_ix) {
		List<GroupDTO> list = sqlMap.selectList("getGroupListSQL", man_ix);
		return list;
	}

	public List<PositionDTO> getPositionList(int man_ix) {
		List<PositionDTO> list = sqlMap.selectList("getPositionListSQL", man_ix);
		return list;
	}
	
	//직책 명, 그룹 명 조회
	public HashMap<String, String> getPGNameList(int man_ix) {
		List<String> p_list = sqlMap.selectList("getPositionNameListSQL", man_ix);
		List<String> g_list = sqlMap.selectList("getGroupNameListSQL", man_ix);
		
		HashMap<String, String> map = new HashMap<String, String>();
		int p_len = p_list.size();
		map.put("p_len", p_len+"");
		for(int i=0; i<p_len;i++) {
			map.put("e_position"+i, p_list.get(i));
		}
		
		int g_len = g_list.size();
		map.put("g_len", g_len+"");
		for(int i=0; i<g_len;i++) {
			map.put("e_group"+i, g_list.get(i));
		}
		
		return map;
	}

	// 그룹 이름 중복 확인 함수.
	public int checkGroupName(int man_ix, String e_group) {
		GroupDTO temp = new GroupDTO();
		temp.setMan_ix(man_ix);
		temp.setE_group(e_group);
		int res;
		if (sqlMap.selectOne("checkGroupNameSQL", temp) == null) {
			res = 1;
		} else {
			res = -1;
		}

		return res;
	}

	// 그룹 추가
	public int addGroup(int man_ix, String e_group) {
		GroupDTO temp = new GroupDTO();
		temp.setMan_ix(man_ix);
		temp.setE_group(e_group);

		int res = sqlMap.insert("addGroupSQL", temp);
		return res;
	}

	// 그룹 삭제
	public int delGroup(int group_ix) {
		int res = sqlMap.insert("delGroupSQL", group_ix);
		return res;
	}

	// 직책 이름 중복 확인 함수.
	public int checkPositionName(int man_ix, String e_Position) {
		PositionDTO temp = new PositionDTO();
		temp.setMan_ix(man_ix);
		temp.setE_position(e_Position);
		int res;
		if (sqlMap.selectOne("checkPositionNameSQL", temp) == null) {
			res = 1;
		} else {
			res = -1;
		}

		return res;
	}
	
	// 제일 높은 우선순위 숫자 가져오기
		public int getMaxPri(int man_ix) {
			int res;
			if(sqlMap.selectOne("getMaxPriSQL", man_ix) != null) {
				res = sqlMap.selectOne("getMaxPriSQL", man_ix);
				res++;
			}else {
				res = 1;
			}
			
			return res;
		}
	
	// 직책 추가
	public int addPosition(int man_ix, String e_position, int priority) {
		PositionDTO temp = new PositionDTO();
		temp.setMan_ix(man_ix);
		temp.setE_position(e_position);
		temp.setPriority(priority);

		int res = sqlMap.insert("addPositionSQL", temp);
		return res;
	}

	// 직책 삭제
	public int delPosition(int position_ix) {
		int res = sqlMap.insert("delPositionSQL", position_ix);
		return res;
	}
}
