package mysqlPrivate;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Properties;


public class GetPrivate {
	
	private String driverClassName;
	private String jdbcUrl;
	private String username;
	private String password;
	
	public GetPrivate() throws FileNotFoundException,IOException {
		
//		classpath로부터 읽기 위함
		InputStream is = GetPrivate.class.getClassLoader().getResourceAsStream("properties/datasourcePrivate/mysqlPrivate.properties");
		Reader r=new InputStreamReader(is);
//		Reader r = new FileReader("src/main/resources/properties/datasourcePrivate/mysqlPrivate.properties");
		Properties p=new Properties();
		p.load(r);
		driverClassName=p.getProperty("driverClassName");
		jdbcUrl=p.getProperty("jdbcUrl");
		username=p.getProperty("username");
		password=p.getProperty("password");
		is.close();
		
	}

	public String getDriverClassName() {
		return driverClassName;
	}
	
	public String getJdbcUrl() {
		return jdbcUrl;
	}
	
	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	
}
