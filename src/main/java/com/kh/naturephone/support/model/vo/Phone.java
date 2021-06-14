package com.kh.naturephone.support.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Phone {
	private int prono;
	private String proname;
	private String modelname;
	private String carrname;
	private String maker;
	private Date releaseDate;
	private int releasePrice;
	private String os;
	private String appearance;
	private String display;
	private String spec;
	private String camera;
	private String battery;
	private String com;
	private String point;
	private String fileOrigin;
	private String fileRename;
	private String filePath;
	
	
}



