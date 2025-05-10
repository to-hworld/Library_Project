package dto;

import java.util.Objects;

public class BookSearching {
	
	private String searchOption;
	private String searchValue;
	private String search_library;
	
	public BookSearching() {
		super();
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearch_library() {
		return search_library;
	}

	public void setSearch_library(String search_library) {
		this.search_library = search_library;
	}

	@Override
	public String toString() {
		return "BookSearching [searchOption=" + searchOption + ", searchValue=" + searchValue + ", search_library="
				+ search_library + "]";
	}

	
	@Override
	public int hashCode() {
		return Objects.hash(getClass(),searchOption, searchValue, search_library);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		BookSearching other = (BookSearching) obj;
		return Objects.equals(searchOption, other.searchOption) && Objects.equals(searchValue, other.searchValue)
				&& Objects.equals(search_library, other.search_library);
	}
	
	
}
