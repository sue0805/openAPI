package booksearch;

import booksearch.Book;
import booksearch.Search;

public class App {
	public static void main(String[] args) {
		
		Search search = new Search();
		for(Book b : search.serachBook("기초", 10, 1))
			System.out.println(b);
	}
}
