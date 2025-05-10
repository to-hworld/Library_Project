package forScan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import dto.BookSearching;

@Controller
public class SearchBook {
	
	@GetMapping(path = "searching")
	public String searching(BookSearching bookSearching) {
		
		System.out.println(bookSearching);
		
		return "afterSearchBook";
		
	}
	
}
