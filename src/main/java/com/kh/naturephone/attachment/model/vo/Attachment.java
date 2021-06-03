package com.kh.naturephone.attachment.model.vo;

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
public class Attachment {
	private int gaNo;
	private int goodsNo;
	private int gaOrder;
	private String gaFileName;
	private String gaFilePath;
	private String gaRename;
}
