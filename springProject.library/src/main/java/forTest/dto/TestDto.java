package forTest.dto;

import java.net.URLClassLoader;

public class TestDto {
	
	private String LIB_NAME="nnlibrary";
	private String CLOSED="30시";
	private String CON_NUMBER="12658658";
	
	public String getLIB_NAME() {
		return LIB_NAME;
	}
	public String getCLOSED() {
		return CLOSED;
	}
	public String getCON_NUMBER() {
		return CON_NUMBER;
	}
	
	
	public static void main(String[] args) {
//		URL url = BookSearching.class.getClassLoader().getResource("mybatisConf/conf.xml");
//		System.out.println("Resource URL: " + url);
		System.out.println(new TestDto().getClass().getClassLoader());
		ClassLoader cl=ClassLoader.getSystemClassLoader();
		if (cl instanceof URLClassLoader) {
			System.out.println((URLClassLoader)cl);
			System.out.println("성공");
		}
		System.out.println("실패");
		System.out.println(cl.getDefinedPackages());
		System.out.println(cl.getUnnamedModule());
		

	}

}
