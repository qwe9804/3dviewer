package spring.test.mapper;

import java.util.List;
import java.util.Map;

import spring.test.dto.TestDTO;

public interface MemberMapper {
  
	TestDTO read(int num);
	int create (TestDTO dto);
	
	List<TestDTO> list();
	
}
