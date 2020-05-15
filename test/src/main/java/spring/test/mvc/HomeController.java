package spring.test.mvc;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.ReadChannel;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import spring.test.dto.TestDTO;
import spring.test.mapper.MemberMapper;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	@Autowired
	MemberMapper mapper;
	
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

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@GetMapping(value = "/test")
	public String test() {

		return "test";
	}
	
	@GetMapping(value = "/test12")
	public String test12() {
		
		return "test12";
	}

	@GetMapping(value = "/test3")
	public String test3(HttpServletRequest re) throws FileNotFoundException, IOException {


		return "test3";
	}

	@PostMapping(value = "/test3")
	public String test3(HttpServletRequest request, MultipartHttpServletRequest mre) {
		String text = request.getParameter("output");
		MultipartFile mf = mre.getFile("filename");
		MultipartFile rmf = mre.getFile("red");
		MultipartFile bmf = mre.getFile("blue");
		MultipartFile gmf = mre.getFile("green");
		String uploadPath = "";
		String path = "D:\\" + "oin\\" + "uploadfile\\";
		String ori = mf.getOriginalFilename();
		String red = rmf.getOriginalFilename();
		String blue = bmf.getOriginalFilename();
		String green = gmf.getOriginalFilename();

		try {
			mf.transferTo(new File(path + ori));
			mf.transferTo(new File(path + red));
			mf.transferTo(new File(path + green));
			mf.transferTo(new File(path + blue));
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Path path0 = Paths.get(path + ori);
		Path path1 = Paths.get(path + red);
		Path path2 = Paths.get(path + green);
		Path path3 = Paths.get(path + blue);

		Charset cs = StandardCharsets.UTF_8;
		System.out.println(path0);
		List<String> XYZlist = new ArrayList<String>();
		List<String> Redlist = new ArrayList<String>();
		List<String> Greenlist = new ArrayList<String>();
		List<String> Bluelist = new ArrayList<String>();

		uploadPath = path + ori;

		try {

			XYZlist = Files.readAllLines(path0, cs);
			Redlist = Files.readAllLines(path1, cs);
			Greenlist = Files.readAllLines(path2, cs);
			Bluelist = Files.readAllLines(path3, cs);

			Iterator XYZiter = XYZlist.iterator();

			int i = 0;
			int XYZsize = XYZlist.size();

			while (XYZiter.hasNext()) {

				XYZlist.set(i, XYZlist.get(i).replaceAll("NaN", ""));
				XYZlist.set(i, XYZlist.get(i).replaceAll("nan", ""));
				XYZlist.set(i, XYZlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Redlist.set(i, Redlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Greenlist.set(i, Greenlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Bluelist.set(i, Bluelist.get(i).replaceAll("\\r?\\n?\\s", ","));

				if (i == (XYZsize - 1)) {
					XYZlist.set(i, XYZlist.get(i).replaceAll("NaN", ""));
					XYZlist.set(i, XYZlist.get(i).replaceAll("nan", ""));
					XYZlist.set(i, XYZlist.get(i).replaceAll("\\r?\\n?\\s", ","));

					Redlist.set(i, Redlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Greenlist.set(i, Greenlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Bluelist.set(i, Bluelist.get(i).replaceAll("\\r?\\n?\\s", ","));
					break;
				} else {
					i++;

				}
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("list", XYZlist);
		request.setAttribute("red", Redlist);
		request.setAttribute("blue", Bluelist);
		request.setAttribute("green", Greenlist);
//		request.setAttribute("i", i);

		return "test3";
	}

	@PostMapping(value = "/test")
	public String Ptest(HttpServletRequest request, MultipartHttpServletRequest mre) {
		String text = request.getParameter("output");
		MultipartFile mf = mre.getFile("filename");
		MultipartFile rmf = mre.getFile("red");
		MultipartFile bmf = mre.getFile("blue");
		MultipartFile gmf = mre.getFile("green");
		String uploadPath = "";
		String path = "D:\\" + "oin\\" + "uploadfile\\";
		String ori = mf.getOriginalFilename();
		String red = rmf.getOriginalFilename();
		String blue = bmf.getOriginalFilename();
		String green = gmf.getOriginalFilename();

		try {
			mf.transferTo(new File(path + ori));
			rmf.transferTo(new File(path + red));
			gmf.transferTo(new File(path + green));
			bmf.transferTo(new File(path + blue));
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Path path0 = Paths.get(path + ori);
		Path path1 = Paths.get(path + red);
		Path path2 = Paths.get(path + green);
		Path path3 = Paths.get(path + blue);
		Charset cs = StandardCharsets.UTF_8;
		System.out.println(path0);
		List<String> XYZlist = new ArrayList<String>();
		List<String> Redlist = new ArrayList<String>();
		List<String> Greenlist = new ArrayList<String>();
		List<String> Bluelist = new ArrayList<String>();

		uploadPath = path + ori;

		try {

			String content = readFile(uploadPath, StandardCharsets.UTF_8);
			XYZlist = Files.readAllLines(path0, cs);
			Redlist = Files.readAllLines(path1, cs);
			Greenlist = Files.readAllLines(path2, cs);
			Bluelist = Files.readAllLines(path3, cs);

			Iterator XYZiter = XYZlist.iterator();

			int i = 0;
			int XYZsize = XYZlist.size();

			while (XYZiter.hasNext()) {
				XYZlist.set(i, XYZlist.get(i).replaceAll("NaN", "0"));
				XYZlist.set(i, XYZlist.get(i).replaceAll("nan", "0"));
				XYZlist.set(i, XYZlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Redlist.set(i, Redlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Greenlist.set(i, Greenlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Bluelist.set(i, Bluelist.get(i).replaceAll("\\r?\\n?\\s", ","));

				if (i == (XYZsize - 1)) {
					XYZlist.set(i, XYZlist.get(i).replaceAll("NaN", "0"));
					XYZlist.set(i, XYZlist.get(i).replaceAll("nan", "0"));
					XYZlist.set(i, XYZlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Redlist.set(i, Redlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Greenlist.set(i, Greenlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Bluelist.set(i, Bluelist.get(i).replaceAll("\\r?\\n?\\s", ","));
					break;
				} else {
					i++;

				}
			}

			System.out.println(XYZlist.get(0).length());

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("list", XYZlist);
		request.setAttribute("red", Redlist);
		request.setAttribute("blue", Bluelist);
		request.setAttribute("green", Greenlist);
//		request.setAttribute("i", i);

		return "test5";
	}

	@GetMapping(value = "/test7")
	public String test7() {

		return "test7";
	}
	@GetMapping(value = "/test8")
	public String test8() {
				
		
		return "test8";
	}
	@PostMapping(value = "/test8")
	public String test8p(TestDTO dto,HttpServletRequest request, MultipartHttpServletRequest mre) {
		dto.setFilename(dto.getFilenameMF().getOriginalFilename());
		
		int flag = mapper.create(dto);
		if(flag == 1) {
			System.out.println("¼º°ø");
		}
		
		return "test8";
	}

	@PostMapping(value = "/test7")
	public String Ptest7(HttpServletRequest request, MultipartHttpServletRequest mre) {
		String text = request.getParameter("output");
		MultipartFile mf = mre.getFile("filename");
		MultipartFile rmf = mre.getFile("red");
		MultipartFile bmf = mre.getFile("blue");
		MultipartFile gmf = mre.getFile("green");
		String uploadPath = "";
		String path = "D:\\" + "oin\\" + "uploadfile\\";
		String ori = mf.getOriginalFilename();
		String red = rmf.getOriginalFilename();
		String blue = bmf.getOriginalFilename();
		String green = gmf.getOriginalFilename();

		try {
			mf.transferTo(new File(path + ori));
			rmf.transferTo(new File(path + red));
			gmf.transferTo(new File(path + green));
			bmf.transferTo(new File(path + blue));
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Path path0 = Paths.get(path + ori);
		Path path1 = Paths.get(path + red);
		Path path2 = Paths.get(path + green);
		Path path3 = Paths.get(path + blue);
		Charset cs = StandardCharsets.UTF_8;
		System.out.println(path0);
		List<String> XYZlist = new ArrayList<String>();
		List<String> Redlist = new ArrayList<String>();
		List<String> Greenlist = new ArrayList<String>();
		List<String> Bluelist = new ArrayList<String>();

		uploadPath = path + ori;

		try {

			XYZlist = Files.readAllLines(path0, cs);
			Redlist = Files.readAllLines(path1, cs);
			Greenlist = Files.readAllLines(path2, cs);
			Bluelist = Files.readAllLines(path3, cs);

			Iterator XYZiter = XYZlist.iterator();

			int i = 0;
			int XYZsize = XYZlist.size();

			while (XYZiter.hasNext()) {

				XYZlist.set(i, XYZlist.get(i).replaceAll("NaN", "0"));
				XYZlist.set(i, XYZlist.get(i).replaceAll("nan", "0"));
				XYZlist.set(i, XYZlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Redlist.set(i, Redlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Greenlist.set(i, Greenlist.get(i).replaceAll("\\r?\\n?\\s", ","));
				Bluelist.set(i, Bluelist.get(i).replaceAll("\\r?\\n?\\s", ","));

				if (i == (XYZsize - 1)) {
					XYZlist.set(i, XYZlist.get(i).replaceAll("NaN", "0"));
					XYZlist.set(i, XYZlist.get(i).replaceAll("nan", "0"));
					XYZlist.set(i, XYZlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Redlist.set(i, Redlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Greenlist.set(i, Greenlist.get(i).replaceAll("\\r?\\n?\\s", ","));
					Bluelist.set(i, Bluelist.get(i).replaceAll("\\r?\\n?\\s", ","));
					break;
				} else {
					i++;

				}
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("list", XYZlist);
		request.setAttribute("red", Redlist);
		request.setAttribute("blue", Bluelist);
		request.setAttribute("green", Greenlist);
//		request.setAttribute("i", i);

		return "test4";
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

	@GetMapping(value = "test11")
	public String ptest11() {

		return "test11";
	}

	@GetMapping(value = "test4")
	public String test4(Model model) {
		TestDTO dto = mapper.read(1);
		
		
		model.addAttribute("dto",dto);
		
		return "test4";
	}
	@GetMapping(value = "test9")
	public String test9(Model model) {
		
		
		List<TestDTO> list = mapper.list();
		
		model.addAttribute("list",list);
		
		return "test9";
	}
	
	@GetMapping(value = "test10")
	public String test10 () {
		String clientRegion = "ap-northeast-2";
		String bucketName = "haanstorage";
		String keyName = "3d(64).txt";
		AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
		.withCredentials(new ProfileCredentialsProvider()).withRegion(clientRegion).build();
		
		System.out.println(s3Client.doesBucketExistV2(bucketName));
		boolean flag = s3Client.doesBucketExistV2(bucketName);
		
		S3Object o = s3Client.getObject(bucketName,keyName);
		S3ObjectInputStream s3is = o.getObjectContent();
		String Z = s3Client.getObjectAsString(bucketName, keyName);
		String ALL = s3Client.getObjectAsString(bucketName, "ALL2.txt");
		
		Z = Z.replaceAll("NaN", "0");
		ALL = ALL.replaceAll("\\r?\\n?\\s", ",");
		ALL = ALL.replaceAll("\\r?\\n?\\s", ",");
		
		
		
		
		return "test3";
		}

	@PostMapping(value = "test11")
	public String test11() {
		String path = "E:\\" + "oin\\" + "uploadfile\\";
		BufferedImage image = loadImage(path + "face.jpg");
		int x = 100;

		int y = 100;
		Color color = null;
		int red, blue, green, alpha;

		int i[] = image.getRGB(0, 0, 100, 100, null, 0, 100);
		System.out.println(image.getData());
		System.out.println(image.toString());
		System.out.println(i[0] + "--" + i[1]);
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

		System.out.println("x : " + x + ", y : " + y);

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

	static String readFile(String path, Charset encoding) throws IOException {
		byte[] encoded = Files.readAllBytes(Paths.get(path));
		return new String(encoded, encoding);
	}

}
