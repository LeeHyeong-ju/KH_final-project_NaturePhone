package com.kh.naturephone.goods.model.vo;

import java.sql.Date;

import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.support.model.vo.Phone;

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
public class GoodsInfo {
	private Goods goods;
	private Member member;
	private Phone phone;
}
