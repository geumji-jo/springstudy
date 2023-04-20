package com.gdu.app07.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	private int BoardNo;
	private String title;
	private String content;
	private String writer;
	private String createdAt;
	private String modifiedAt;

}
