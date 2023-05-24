package com.gdu.app13.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlogDTO {
  private int blogNo;
  private String title;
  private String content;
  private String hit;
  private Date createdAt;
  private Date modifiedAt;
  private int memberNo;
  private MemberDTO memberDTO; // private int memberNo;
  

}
