package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.StoreVO;
import com.spring.mapper.StoreMapper;

@Service("storeService")
public class StoreServiceImpl implements StoreService {
   
   @Autowired
   private SqlSession sqlSession;
   
   
   // taehyun start
   @Override
   public ArrayList<StoreVO> getList() {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
      storeList = storeMapper.getList();
      
      return storeList; 
   }
   
   @Override
   public List<StoreVO> getWaitList() {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      
      return storeMapper.getWaitList();
   }
    
   @Override
   public int confirmStore(int s_num) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      int res = storeMapper.confirmStore(s_num);
      
      return res;
   }

   @Override
   public int refuseStore(int s_num) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      int res = storeMapper.refuseStore(s_num);
      
      return res;
   }

   @Override
   public StoreVO storeInfo(int s_num) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      StoreVO vo = storeMapper.storeInfo(s_num);
      
      return vo;
   }


   @Override
   public int checkStore(StoreVO storeVO) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      int res = storeMapper.checkStore(storeVO);
      
      return res;
   }
   
   @Override
   public ArrayList<StoreVO> getWaitListWithPage(Criteria cri) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      
      return storeMapper.getWaitListWithPage(cri);
   }

   @Override
   public int getTotal(Criteria cri) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      System.out.println("impl" + storeMapper.getTotalCount(cri));
      return storeMapper.getTotalCount(cri);
   }
   
   @Override
   public Double getAvgStar(int s_num) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);

      return storeMapper.getAvgStar(s_num);
   }

   // taehyun end
   
   // soobin start
   @Override
      public int insertStore(StoreVO storeVO) {
         
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
         
         int res = storeMapper.insertStore(storeVO);
         System.out.println("res="+res);
         return res;
      }
   
   @Override
      public StoreVO selectStore(StoreVO storeVO) {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      StoreVO store = storeMapper.selectStore(storeVO);
         
         return store;
      }
   
   @Override
      public int updateStore(StoreVO storeVO) {
         
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
         
         int res = storeMapper.updateStore(storeVO);
         System.out.println("res="+res);
         return res;
      }

   // soobin end

   //dohyeong start
   @Override
   public ArrayList<StoreVO> getStoreList() {
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
      storeList = storeMapper.getStoreList();
      
      return storeList;
   }
   
   @Override
   public List<StoreVO> getStoreListAjax(Map<String, String[]> mapp) {

      
      StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
      
      List<StoreVO> storelistAjax = storeMapper.getStoreListAjax(mapp); 
      
      
      return storelistAjax;
   }
   //dohyeong end

	@Override
	public String getStoreId(int s_num) {
		StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
		String u_id = storeMapper.getStoreId(s_num);
		System.out.println("u_id = " + u_id);
		return u_id;
	}




}