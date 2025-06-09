package forTest.controller;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.DispatcherServlet;

import forTest.service.LibraryInsert;
import jakarta.servlet.http.HttpServletRequest;


@Controller
public class TestController {
	
//	transaction test
	@Autowired
	LibraryInsert libraryInsert;
	
//	@GetMapping(path = "/")
	public String transaction() {
		
		if (libraryInsert.insert() >= 1) {
			
			System.out.println("insert success");
			
		}
		
		
		return "home";
		
	}
	
	
	@GetMapping(path = "/")
	public String name(HttpServletRequest req) {
		
		
		return "home";
		
	}
	
	public static void main(String[] args) {
		
		char[] c= {'a','b','f'};
		Object o=(Object)c;
		char[] cc=(char[])o;
		
	}
	
	
}
