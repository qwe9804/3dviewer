package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.member.MemberDTO;

public interface MemberMapper {

	List<MemberDTO> list(Map map);
	int total(Map map);
	int create(MemberDTO dto);
	MemberDTO read(String id);
	int update(MemberDTO dto);
	int delete(String id);
	int emailcheck(String email);
	int idcheck(String id);
	int updateFile(Map map);
	int updatePw(Map map);
	int loginCheck(Map map);
	String findID(Map<String,String> map);
	String findPW(Map map);
	String getGrade(String id);
	int updatemoney(Map map);
}
