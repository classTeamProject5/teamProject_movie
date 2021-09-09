package test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.sist.dao.MovieFinderVO;
import com.sist.service.MovieFinderService;

class MovieFinderTest {

	@Test
	void test() {
		MovieFinderService movieFinder = new MovieFinderService();
		
		List<MovieFinderVO> list = movieFinder.findMovie("세");
		for (MovieFinderVO vo: list) {
			System.out.println(vo.getTitle());
			System.out.println(vo.getPoster());
		}
	}

}
