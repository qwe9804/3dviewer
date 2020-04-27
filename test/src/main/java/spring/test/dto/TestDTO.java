package spring.test.dto;

public class TestDTO {
	  private int num;
	  private String	content ;
	  private String  filename  ;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	@Override
	public String toString() {
		return "TestDTO [num=" + num + ", content=" + content + ", filename=" + filename + "]";
	}
	public void setContent(String content) {
		this.content = content;
	}
	public TestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	

}
