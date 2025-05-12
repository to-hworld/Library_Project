package forScan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import forScan.service.LibraryInsert;


@Controller
public class Home {
	
	@Autowired
	LibraryInsert ls;
	
	@GetMapping(path = "/")
	public String home() {
		System.out.println("insert result:"+ls.insert());
		return "home";
	}
	
	@GetMapping(path = "/data_searching/main")
	public String searchBook() {
		
		return "searchBook";
	}
}