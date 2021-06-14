package com.kh.naturephone.common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Search {
	private String searchCondition;		// 항목(전체, 작성자, 제목, 내용) 
	private String searchValue;			// 검색 내용
}
