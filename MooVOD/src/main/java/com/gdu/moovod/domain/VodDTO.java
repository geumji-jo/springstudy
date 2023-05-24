package com.gdu.moovod.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class VodDTO {

  private int vodNo;
  private String vodTitle;
  private String vodContent;
  private Date vodDate;
  private int vodPrice;
  private int vodStar;
  private String vodActor;
  private String vodDirector;
  private String vodCategory;
  private String vodCompany;
  private String vodPhoto;
  private String vodYoutube;
  private String vodShot;

  
}
