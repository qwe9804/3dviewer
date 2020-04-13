package spring.test.mvc;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@GetMapping(value = "/test")
	public String test() {

		
		
		return "test";
	}
	
	@PostMapping(value="/test")
	public String Ptest(HttpServletRequest request,MultipartHttpServletRequest mre) {
		String text = request.getParameter("output");
		MultipartFile mf = mre.getFile("filename");
		String uploadPath = "";
		String path = "E:\\"+"oin\\"+"uploadfile\\";
		String ori = mf.getOriginalFilename();
		
		uploadPath = path+ori;
		
		try {
			mf.transferTo((new File(uploadPath)));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();
		File file = new File(uploadPath);
		int i = 0;
		try {
			FileReader filereader = new FileReader(file);
			BufferedReader bufreader = new BufferedReader(filereader);
			String line = "";
			
			
			
			while((line = bufreader.readLine()) != null) {
				
				list.add(line);
				list2.add(line);
				
				
				list2.set(i,list2.get(i).replaceAll("\\r?\\n?\\s", ","));
//				System.out.println(i+" : "+list.get(i));
//				System.out.println(i+" : "+list2.get(i));
//				System.out.println("-0------------------------------");
//				System.out.println(sb);
				i++;
				
			}
			bufreader.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		}
//		System.out.println("list:"+list2);
		System.out.println("size--"+list.size());
		System.out.println(i-1);
		request.setAttribute("list", list2);
		request.setAttribute("i", i);
		
		return "test5";
	}
	@GetMapping(value = "test2")
	public String test2() {
		
		return "test2";
	}
	@RequestMapping(value = "test5")
	public String test5(HttpServletRequest request) {
		System.out.println(request.getAttribute("text"));
		
		
		
		return "test5";
	}
}
