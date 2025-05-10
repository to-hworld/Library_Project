package forScan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Home {
	
	@GetMapping(path = "/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping(path = "/data_searching/main")
	public String searchBook() {
		
		return "searchBook";
	}
}