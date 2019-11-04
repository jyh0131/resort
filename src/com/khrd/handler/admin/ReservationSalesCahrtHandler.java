package com.khrd.handler.admin;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ReservationDAO;
import com.khrd.dao.RoomNameDAO;
import com.khrd.dto.Reservation;
import com.khrd.dto.RoomName;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class ReservationSalesCahrtHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Connection conn = null;
		try{
			conn = ConnectionProvider.getConnection();
			ReservationDAO rsvDao = ReservationDAO.getnInstance();
			RoomNameDAO rmnDao = RoomNameDAO.getInstance();
			
			List<Reservation> rsvList = rsvDao.selectSalesInfo(conn);
			List<String> rmnList = new ArrayList<>();
			System.out.println("예약 정보 리스트 : " + rsvList);
			
			List<RoomName> rmNameList = rmnDao.selectRoomNameList(conn);
			for(RoomName rmn : rmNameList) {
				rmnList.add(rmn.getRnName());
			}
			
			System.out.println("모든 객실 이름 리스트 : " + rmnList);
			
			TreeMap<Integer, Integer> mSales = new TreeMap<>();
			
			//1월~12월을 키로, 맵을 값으로 하는 맵 생성
			for(int i=1; i<=12; i++){
				mSales.put(i, 0);
			}
			
			for(Reservation rsv : rsvList) {
				SimpleDateFormat sdf = new SimpleDateFormat("M");
				String sMonth = sdf.format(rsv.getRsvPaymentDate());
				int month = Integer.parseInt(sMonth);
				int mPrice = mSales.get(month);
				mPrice += rsv.getRsvPrice();
				mSales.put(month, mPrice);
			}
			
			Iterator<Integer> iteratorKey = mSales.keySet( ).iterator( );
			while(iteratorKey.hasNext()){
				iteratorKey.next();
			}
				
			req.setAttribute("mSales", mSales);
			req.setAttribute("rsvList", rsvList);
			req.setAttribute("rmnList", rmnList);
			return "/WEB-INF/view/admin/salesChart.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}	
		return null;
	}
}
