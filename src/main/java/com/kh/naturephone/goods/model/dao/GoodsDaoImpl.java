package com.kh.naturephone.goods.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.attachment.model.vo.Attachment;
import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.goods.model.vo.Goods;
import com.kh.naturephone.support.model.vo.Phone;

@Repository
public class GoodsDaoImpl implements GoodsDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertGoods(Goods g) {
		
		
		int result = sqlSession.insert("goodsMapper.insertGoods", g);
		
		if(result == 1) {
			result += g.getGoodsNo();
		}
		
		
		return result;
		
	}

	@Override
	public List<Phone> productName(String keyword) {

		List<Phone> list = sqlSession.selectList("goodsMapper.productName", keyword);
		
		
		return list;
	}

	@Override
	public Phone selectPFN(String modelName) {

		return sqlSession.selectOne("goodsMapper.selectPFN", modelName);
	}

	@Override
	public int insertAtt(Attachment att) {
		
		return sqlSession.insert("goodsMapper.insertAtt", att);
	}
	
	// 물품 게시글 갯수 조회
	@Override
	public int selectGoodsListCount() {
		
		return sqlSession.selectOne("goodsMapper.selectGoodsListCount");
	}
	

	


	@Override
	public List<Map<String, String>> selectGoodsList(PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Map<String, String>> list = sqlSession.selectList("goodsMapper.selectGoodsList", null, rowBounds);
		return list;
	}

	// 첨부사진 가져오기
	@Override
	public List<Attachment> selectAttList() {
		
		return sqlSession.selectList("goodsMapper.selectAttList");
	}

	@Override
	public Phone selectPhoneNameList(int proNo) {
		
		Phone phoneName = sqlSession.selectOne("goodsMapper.selectPhoneNameList", proNo);

		
		return phoneName;
	}


	
	

}
