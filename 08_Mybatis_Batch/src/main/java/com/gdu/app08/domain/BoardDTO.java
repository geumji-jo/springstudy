package com.gdu.app08.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
	private int BoardNo;
	private String title;
	private String content;
	private String writer;
	private String createdAt;
	private String modifiedAt;


}
