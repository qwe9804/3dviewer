package spring.sts.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.mapper.MemberMapper;
import spring.model.member.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		System.out.println("id:" +map.get("m_id"));
		System.out.println("passwd:" +map.get("m_passwd"));
		int flag = mapper.loginCheck(map);
		
		if (flag == 1) {
			String grade = mapper.getGrade(map.get("m_id"));
			session.setAttribute("id", map.get("m_id"));
			session.setAttribute("grade", grade);

			Cookie cookie = null;

			String c_id = request.getParameter("c_id");

			if (c_id != null) {
				cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(120);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", map.get("m_id"));
				cookie.setMaxAge(120);
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			return "redirect:/";
		} else {
			request.setAttribute("id", map.get("m_id"));
			return "/preProc2";
		}

	}

	@GetMapping("/login")
	public String login(HttpServletRequest request) {
		String c_id = "";
		String c_id_val = "";

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();
				}
			}
		}
		return "/login";

	}

	@PostMapping("/create")
	public String create(MemberDTO dto, Model model, HttpServletRequest request) {

		int iflag = mapper.idcheck(dto.getM_id());
		int eflag = mapper.emailcheck(dto.getM_email());
		if (iflag == 1) {

			request.setAttribute("id", dto.getM_id());
			request.setAttribute("email", dto.getM_email());
			return "/preProc";

		} else if (eflag == 1) {
			request.setAttribute("id", dto.getM_id());
			request.setAttribute("email", dto.getM_email());
			return "/preProc";
		} else if (iflag == 0 && eflag == 0) {
			int flag = mapper.create(dto);
			if (flag == 1) {
				return "redirect:/";
			} else {
				request.setAttribute("id", dto.getM_id());
				request.setAttribute("email", dto.getM_email());
				return "/preProc";
			}
		} else {
			request.setAttribute("id", dto.getM_id());
			request.setAttribute("email", dto.getM_email());
			return "/preProc";
		}

	}

	@GetMapping("/create")
	public String create() {

		return "/create";
	}
	
	@GetMapping("/delete")
	public String delete(String id) {
		int flag = mapper.delete(id);
		
		if(flag==1) {
			
			return "redirect:/";
		}else {
			return "/preProc";
		}
	}

	@ResponseBody
	@GetMapping(value = "/idcheck", produces = "text/plain;charset=utf-8")
	public String idcheck(String id) {

		int flag = mapper.idcheck(id);
		String str = "";
		if (flag == 1) {
			str = id + " 중복된 아이디 입니다.";
		} else {
			str = id + " 사용하셔도 좋습니다.";
		}

		return str;

	}

	@ResponseBody
	@GetMapping(value = "/emailcheck", produces = "text/plain;charset=utf-8")
	public String emailcheck(String email) {
		int flag = mapper.emailcheck(email);

		String str = "";
		if (flag == 1) {
			str = email + " 중복된 이메일 입니다..";
		} else {
			str = email + " 사용하셔도 좋습니다.";
		}

		return str;
	}

	@GetMapping("/agree")
	public String agree() {

		return "/agree";
	}

	@RequestMapping("/mypage")
	public String mypage(String id,Model model) {
		
		MemberDTO dto = mapper.read(id);

		dto.setM_phone1(dto.getM_phone().substring(0,3));
		dto.setM_phone2(dto.getM_phone().substring(3,7));
		dto.setM_phone3(dto.getM_phone().substring(7,11));

		dto.setM_birth1(dto.getM_birth().substring(0,4));
		dto.setM_birth2(dto.getM_birth().substring(4,6));
		dto.setM_birth3(dto.getM_birth().substring(6,8));
		
		model.addAttribute("dto",dto);
		
		
		return "/mypage";
	}
	
	@PostMapping("/updatemypage")
	public String updatemypage(HttpServletRequest request,MemberDTO dto,HttpSession session) {
			
			dto.setM_id((String)session.getAttribute("id"));
			int flag = mapper.update(dto);
			if (flag == 1) {
				return "redirect:mypage?id="+dto.getM_id();
			} else {

				return "/preProc3";
			}
	 
		
	}
	
	@GetMapping("/updatemypage")
	public String updatemypage(String id,Model model) {
		
		MemberDTO dto = mapper.read(id);
		
		dto.setM_phone1(dto.getM_phone().substring(0,3));
		dto.setM_phone2(dto.getM_phone().substring(3,7));
		dto.setM_phone3(dto.getM_phone().substring(7,11));

		dto.setM_birth1(dto.getM_birth().substring(0,4));
		dto.setM_birth2(dto.getM_birth().substring(4,6));
		dto.setM_birth3(dto.getM_birth().substring(6,8));
		
		model.addAttribute("dto",dto);
		
		return "/updatemypage";
	}
	
	@PostMapping("/updatemoney")
	public String updatemypage(Map map,String m_id,String m_updatemoney,HttpSession session) {
		
		System.out.println(m_id);
		System.out.println(m_updatemoney);
		map.put("m_updatemoney", m_updatemoney);
		map.put("m_id", m_id);
	
		int flag = mapper.updatemoney(map);
		if(flag==1) {	
		return "redirect:mypage?id="+m_id;
		}else {
		return "/preProc";
		}
	}
	@GetMapping("/preProc")
	public String preProc() {
		return "/preProc";
	}
	
	@PostMapping("/findid")
	public String findid(String m_name,String m_email,Model model) {
		Map map = new HashMap();
		System.out.println(m_name +"\n"+ m_email);
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		
		String  id = mapper.findID(map);
		
		System.out.println(id);
		
		model.addAttribute("name",m_name);
		model.addAttribute("id",id);
		
		return "/findidproc";
	}
	
	@PostMapping("/findpw")
	public String findpw(String m_id,String m_email,Model model) {
		Map map = new HashMap();
		System.out.println(m_id +"\n"+ m_email);
		map.put("m_id", m_id);
		map.put("m_email", m_email);
		
		String  passwd = mapper.findPW(map);
		
		System.out.println(passwd);
		
		model.addAttribute("id",m_id);
		model.addAttribute("passwd",passwd);
		
		return "/findpwproc";
	}
	
	
	@GetMapping("/findpw")
	public String findpw() {
		
		return "/findpw";
	}
	
	@GetMapping("/findid")
	public String findid() {
		
		return "/findid";
	}
}
