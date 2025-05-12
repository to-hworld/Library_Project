package listener;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class MysqlLeak implements ServletContextListener{
// refactoring 필요
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
			AbandonedConnectionCleanupThread.checkedShutdown();
			
			// 현재 웹 애플리케이션의 classloader 반환
	        ClassLoader cl = Thread.currentThread().getContextClassLoader();
	        // 등록된 JDBC driver 순회
	        Enumeration<Driver> drivers = DriverManager.getDrivers();
	        
	        while (drivers.hasMoreElements()) {
	        	
	            Driver driver = drivers.nextElement();
	            // driver가 웹 애플리케이션의 classloader에 의해서 로드되었는지 확인
	            if (driver.getClass().getClassLoader() == cl) {
	                try {
	                    DriverManager.deregisterDriver(driver);
	                } catch (SQLException ex) {
	                    System.err.println("Error deregistering driver " + driver + ": " + ex.getMessage());
	                }
	            // false시, webapp classloader에 미포함.
	            }
	        }
	        
	}
	
}


