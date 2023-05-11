package kr.co.hta.util;

import kr.co.hta.movies.dao.ReviewDao;

public class calcaulator {
	public static void main(String[] args) throws Exception {
		
		ReviewDao reviewDao = new ReviewDao();
		int reviewsCountByMovie = reviewDao.getReviewsCountByMovie(3);
		int getGPAByMovie = reviewDao.getGPAByMovie(3);
		double goldenEggScore = (double)((double)getGPAByMovie/(double)(reviewsCountByMovie*5.0))*100.0;
		
		System.out.println(goldenEggScore);
	}
}
