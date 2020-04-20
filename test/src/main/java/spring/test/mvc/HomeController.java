package spring.test.mvc;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cglib.core.internal.LoadingCache;
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
	@GetMapping(value="/test3")
	public String test3() {
		
		return "test3";
	}
	
	@PostMapping(value = "/test3")
	public String test3(HttpServletRequest request,MultipartHttpServletRequest mre) {
		String text = request.getParameter("output");
		MultipartFile mf = mre.getFile("filename");
		MultipartFile rmf = mre.getFile("red");
		MultipartFile bmf = mre.getFile("blue");
		MultipartFile gmf = mre.getFile("green");
		String uploadPath = "";
		
		String path = "D:\\"+"oin\\"+"uploadfile\\";
		String ori = mf.getOriginalFilename();
		String red = rmf.getOriginalFilename();
		String blue = bmf.getOriginalFilename();
		String green = gmf.getOriginalFilename();
	
		Path path2 = Paths.get("D:\\"+"oin\\"+"uploadfile\\"+ori);
		 Charset cs = StandardCharsets.UTF_8;
		 System.out.println(path2);
		List<String> listTest = new ArrayList<String>();

		int i = 0;
		int r = 0;
		int g = 0;
		int b = 0;
		try {
	
			listTest = Files.readAllLines(path2,cs);


			while(r>1920) {
				
				listTest.set(r,listTest.get(r).replaceAll("NaN", ""));
				listTest.set(r,listTest.get(r).replaceAll("nan", ""));
				listTest.set(r,listTest.get(r).replaceAll("\\r?\\n?\\s", ","));
				r++;
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		}			
			
		request.setAttribute("list", listTest);
		
		return "test";
	}
	
	@PostMapping(value="/test")
	public String Ptest(HttpServletRequest request,MultipartHttpServletRequest mre) {
		String text = request.getParameter("output");
		MultipartFile mf = mre.getFile("filename");
		MultipartFile rmf = mre.getFile("red");
		MultipartFile bmf = mre.getFile("blue");
		MultipartFile gmf = mre.getFile("green");
		String uploadPath = "";
		String path = "D:\\"+"oin\\"+"uploadfile\\";
		String ori = mf.getOriginalFilename();
		String red = rmf.getOriginalFilename();
		String blue = bmf.getOriginalFilename();
		String green = gmf.getOriginalFilename();
		
		
		
		uploadPath = path+ori;
		
		try {
			mf.transferTo((new File(uploadPath)));
			rmf.transferTo((new File(path+red)));
			bmf.transferTo((new File(path+blue)));
			gmf.transferTo((new File(path+green)));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();
		ArrayList<String> rlist = new ArrayList<String>();
		ArrayList<String> glist = new ArrayList<String>();
		ArrayList<String> blist = new ArrayList<String>();
		File file = new File(uploadPath);
		File redfile = new File(path+red);
		File bluefile = new File(path+blue);
		File greenfile = new File(path+green);
		int i = 0;
		int r = 0;
		int g = 0;
		int b = 0;
		try {
			FileReader filereader = new FileReader(file);
			FileReader rfilereader = new FileReader(redfile);
			FileReader gfilereader = new FileReader(greenfile);
			FileReader bfilereader = new FileReader(bluefile);
			BufferedReader bufreader = new BufferedReader(filereader);
			BufferedReader rbufreader = new BufferedReader(rfilereader);
			BufferedReader gbufreader = new BufferedReader(gfilereader);
			BufferedReader bbufreader = new BufferedReader(bfilereader);
			
			String line = "";
			String redline = "";
			String greenline = "";
			String blueline ="";
			while((redline = rbufreader.readLine()) != null) {
				rlist.add(redline);

				rlist.set(r,rlist.get(r).replaceAll("\\r?\\n?\\s", ","));

				r++;
			}
			rbufreader.close();
			while((greenline = gbufreader.readLine()) != null) {
				
				
				glist.add(greenline);
				
				
				glist.set(g,glist.get(g).replaceAll("\\r?\\n?\\s", ","));

				g++;
				
			}

			gbufreader.close();
			
			while((blueline = bbufreader.readLine()) != null) {
				
				blist.add(blueline);
				
				
				blist.set(b,blist.get(b).replaceAll("\\r?\\n?\\s", ","));

				b++;
				
			}
			bbufreader.close();
			while((line = bufreader.readLine()) != null) {
				
				
				list2.add(line);
				
				list2.set(i,list2.get(i).replaceAll("NaN", ""));
				list2.set(i,list2.get(i).replaceAll("nan", ""));
				list2.set(i,list2.get(i).replaceAll("\\r?\\n?\\s", ","));

				i++;
				
			}
			bufreader.close();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		}			
		
		request.setAttribute("list", list2);
		request.setAttribute("red", rlist);
		request.setAttribute("blue", blist);
		request.setAttribute("green", glist);
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
	@GetMapping(value="test11")
		public String ptest11() {
		
		return "test11";
	}
	@PostMapping(value = "test11")
	public String test11(){
		String path = "E:\\"+"oin\\"+"uploadfile\\";
		BufferedImage image = loadImage(path+"face.jpg");
		int x = 100; 

		int y = 100;  
		Color color = null;
		int red,blue,green,alpha;
		
		int i[] = image.getRGB(0, 0, 100, 100, null, 0, 100);
		System.out.println(image.getData());
		System.out.println(image.toString());
		System.out.println(i[0]+"--"+i[1]);
		ArrayList<Integer> list = new ArrayList<Integer>();
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		ArrayList<Integer> list3 = new ArrayList<Integer>();
		

		color = new Color(image.getRGB(x, y));
		
		red = color.getRed();
		list.add(red);
		blue = color.getBlue();
		list2.add(blue);
		green = color.getGreen();
		list3.add(green);

		
		System.out.println(list);
		
		System.out.println("x : " + x+ ", y : " + y);
		
		
		return "test11";
	}
	
	public static BufferedImage loadImage(String url) {
		BufferedImage image = null;
		
		try {
			image = ImageIO.read(new File(url));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	
	
}
