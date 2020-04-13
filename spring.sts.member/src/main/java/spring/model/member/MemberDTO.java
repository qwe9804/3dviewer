package spring.model.member;

public class MemberDTO {
  private String	m_id ;
  private String  m_name  ;
  private String  m_email  ;
  private String  m_grade  ;
  private String  m_passwd  ;
  private String  m_phone  ;
  private String  m_phone1  ;
  private String  m_phone2  ;
  private String  m_phone3  ;
  public String getM_phone1() {
	return m_phone1;
}
public String getM_phone() {
	return m_phone;
}
public void setM_phone(String m_phone) {
	this.m_phone = m_phone;
}
public void setM_phone1(String m_phone1) {
	this.m_phone1 = m_phone1;
}
public String getM_phone2() {
	return m_phone2;
}
public void setM_phone2(String m_phone2) {
	this.m_phone2 = m_phone2;
}
public String getM_phone3() {
	return m_phone3;
}
public void setM_phone3(String m_phone3) {
	this.m_phone3 = m_phone3;
}
private String  m_addr1  ;
  private String  m_addr2  ;
  private String  m_addr3  ;
  private String  m_birth  ;
  private String  m_birth1  ;
  private String  m_birth2  ;
  private String  m_birth3  ;
  private String  m_date  ;
  public String getM_birth1() {
	return m_birth1;
}
public void setM_birth1(String m_birth1) {
	this.m_birth1 = m_birth1;
}
public String getM_birth2() {
	return m_birth2;
}
public void setM_birth2(String m_birth2) {
	this.m_birth2 = m_birth2;
}
public String getM_birth3() {
	return m_birth3;
}
public void setM_birth3(String m_birth3) {
	this.m_birth3 = m_birth3;
}
private String  m_money  ;
public String getM_id() {
	return m_id;
}
public void setM_id(String m_id) {
	this.m_id = m_id;
}
public String getM_name() {
	return m_name;
}
public void setM_name(String m_name) {
	this.m_name = m_name;
}
public String getM_email() {
	return m_email;
}
public void setM_email(String m_email) {
	this.m_email = m_email;
}
public String getM_grade() {
	return m_grade;
}
public void setM_grade(String m_grade) {
	this.m_grade = m_grade;
}
public String getM_passwd() {
	return m_passwd;
}
public void setM_passwd(String m_passwd) {
	this.m_passwd = m_passwd;
}

public String getM_addr1() {
	return m_addr1;
}
public void setM_addr1(String m_addr1) {
	this.m_addr1 = m_addr1;
}
public String getM_addr2() {
	return m_addr2;
}
public void setM_addr2(String m_addr2) {
	this.m_addr2 = m_addr2;
}
public String getM_addr3() {
	return m_addr3;
}
public void setM_addr3(String m_addr3) {
	this.m_addr3 = m_addr3;
}
public String getM_birth() {
	return m_birth;
}
public void setM_birth(String m_birth) {
	this.m_birth = m_birth;
}
public String getM_date() {
	return m_date;
}
public void setM_date(String m_date) {
	this.m_date = m_date;
}
public String getM_money() {
	return m_money;
}
public void setM_money(String m_money) {
	this.m_money = m_money;
}
@Override
public String toString() {
	return "MemberDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_email=" + m_email + ", m_grade=" + m_grade
			+ ", m_passwd=" + m_passwd + ", m_phone=" + m_phone + ", m_phone1=" + m_phone1 + ", m_phone2=" + m_phone2
			+ ", m_phone3=" + m_phone3 + ", m_addr1=" + m_addr1 + ", m_addr2=" + m_addr2 + ", m_addr3=" + m_addr3
			+ ", m_birth=" + m_birth + ", m_birth1=" + m_birth1 + ", m_birth2=" + m_birth2 + ", m_birth3=" + m_birth3
			+ ", m_date=" + m_date + ", m_money=" + m_money + "]";
}
public MemberDTO() {
	super();
	// TODO Auto-generated constructor stub
}
  
  
  
}
