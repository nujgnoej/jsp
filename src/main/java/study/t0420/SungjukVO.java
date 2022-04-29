package study.t0420;

import java.util.Arrays;

public class SungjukVO {
	private String name, gender, no, hakyun;
	private int kor, eng, mat, tot;
	private double avg;
	private String grade;
	private String[] sports;
	private String otherSports;
	private String[] language;
	
	private String strSports;
	private String strLanguage;
	
	public SungjukVO() {}
	
	public SungjukVO(String name, String gender, String no, String hakyun, int kor, int eng, int mat, int tot, double avg,
			String grade, String[] sports, String otherSports, String[] language, String strSports, String strLanguage) {
		this.name = name;
		this.gender = gender;
		this.no = no;
		this.hakyun = hakyun;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.tot = tot;
		this.avg = avg;
		this.grade = grade;
		this.sports = sports;
		this.otherSports = otherSports;
		this.language = language;
		this.strSports = strSports;
		this.strLanguage = strLanguage;
	}
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getHakyun() {
		return hakyun;
	}
	public void setHakyun(String hakyun) {
		this.hakyun = hakyun;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String[] getSports() {
		return sports;
	}
	public void setSports(String[] sports) {
		this.sports = sports;
	}
	public String getOtherSports() {
		return otherSports;
	}
	public void setOtherSports(String otherSports) {
		this.otherSports = otherSports;
	}
	public String[] getLanguage() {
		return language;
	}
	public void setLanguage(String[] language) {
		this.language = language;
	}
	public String getStrSports() {
		return strSports;
	}
	public void setStrSports(String strSports) {
		this.strSports = strSports;
	}
	public String getStrLanguage() {
		return strLanguage;
	}
	public void setStrLanguage(String strLanguage) {
		this.strLanguage = strLanguage;
	}
	@Override
	public String toString() {
		return "SungjukVO [name=" + name + ", gender=" + gender + ", no=" + no + ", hakyun=" + hakyun + ", kor=" + kor
				+ ", eng=" + eng + ", mat=" + mat + ", tot=" + tot + ", avg=" + avg + ", grade=" + grade + ", sports="
				+ Arrays.toString(sports) + ", otherSports=" + otherSports + ", language=" + Arrays.toString(language)
				+ ", strSports=" + strSports + ", strLanguage=" + strLanguage + "]";
	}
}
