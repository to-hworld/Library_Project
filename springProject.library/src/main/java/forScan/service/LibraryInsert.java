package forScan.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dto.Library;

@Service
public class LibraryInsert {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Transactional
	public int insert() {
		
		System.out.println("sqlSession:"+(sqlSession==null));
		return sqlSession.insert("dto.BookSearch.insertLibrary", new Library());
		
	}
	

}
