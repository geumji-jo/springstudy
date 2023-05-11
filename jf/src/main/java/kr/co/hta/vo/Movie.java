package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Movie {
   private int no;
   private double reservationRate;
   private int gpa;
   private int realMembers;
   private int ageLimit;
   private int runningTime;
   private int wishList;
   private int price;
   private String korTitle;
   private String engTitle;
   private String director;
   private String genre;
   private String country;
   private String info;
   private String trailer;
   private String steelCut;
   private String screenYn;
   private String poster;
   private String actors;
   private int goldenEgg;
   private Date createDate;
   private Date releaseDate;
   
   public String getActors() {
      return actors;
   }
   public void setActors(String actors) {
      this.actors = actors;
   }
   public String getPoster() {
      return poster;
   }
   public void setPoster(String poster) {
      this.poster = poster;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public double getReservationRate() {
      return reservationRate;
   }
   public void setReservationRate(double reservationRate) {
      this.reservationRate = reservationRate;
   }
   public int getGpa() {
      return gpa;
   }
   public void setGpa(int gpa) {
      this.gpa = gpa;
   }
   public int getRealMembers() {
      return realMembers;
   }
   public void setRealMembers(int realMembers) {
      this.realMembers = realMembers;
   }
   public int getAgeLimit() {
      return ageLimit;
   }
   public void setAgeLimit(int ageLimit) {
      this.ageLimit = ageLimit;
   }
   public int getRunningTime() {
      return runningTime;
   }
   public void setRunningTime(int runningTime) {
      this.runningTime = runningTime;
   }
   public int getWishList() {
      return wishList;
   }
   public void setWishList(int wishList) {
      this.wishList = wishList;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getKorTitle() {
      return korTitle;
   }
   public void setKorTitle(String korTitle) {
      this.korTitle = korTitle;
   }
   public String getEngTitle() {
      return engTitle;
   }
   public void setEngTitle(String engTitle) {
      this.engTitle = engTitle;
   }
   public String getDirector() {
      return director;
   }
   public void setDirector(String director) {
      this.director = director;
   }
   public String getGenre() {
      return genre;
   }
   public void setGenre(String genre) {
      this.genre = genre;
   }
   public String getCountry() {
      return country;
   }
   public void setCountry(String country) {
      this.country = country;
   }
   public String getInfo() {
      return info;
   }
   public void setInfo(String info) {
      this.info = info;
   }
   public String getTrailer() {
      return trailer;
   }
   public void setTrailer(String trailer) {
      this.trailer = trailer;
   }
   public String getSteelCut() {
      return steelCut;
   }
   public void setSteelCut(String steelCut) {
      this.steelCut = steelCut;
   }
   public String getScreenYn() {
      return screenYn;
   }
   public void setScreenYn(String screenYn) {
      this.screenYn = screenYn;
   }
   public Date getReleaseDate() {
      return releaseDate;
   }
   public void setReleaseDate(Date releaseDate) {
      this.releaseDate = releaseDate;
   }
   public int getGoldenEgg() {
      return goldenEgg;
   }
   public void setGoldenEgg(int goldenEgg) {
      this.goldenEgg = goldenEgg;
   }
   public Date getCreateDate() {
      return createDate;
   }
   public void setCreateDate(Date createDate) {
      this.createDate = createDate;
   }
   
   
}