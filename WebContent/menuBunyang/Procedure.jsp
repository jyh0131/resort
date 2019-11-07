<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="bunyang.jsp" %>
<style>
	#tab-1 > ul{
		width: 920px;
	    height: 134px;
	    padding-top: 108px;
		background: url(${pageContext.request.contextPath}/images/bg_process01.gif) no-repeat;
		margin: 50px 0;
		list-style: none;
	}
	#tab-1 > ul > li{
		float: left;
	    width: 151px;
	    height: 135px;
	    margin-right: 41px;
	    text-align: center;
	    font-family: Arial,'돋움', Dotum;
	    font-size: 12px;
	    color: #666;
	}
	#tab-1 > ul > li:last-child{
		margin: 0;
	}
	#tab-1 > ul > li > ul{
		width: 100%;
		text-align: center;
	}
	#tab-1 > ul > li > ul > li{
		height: 13px;
    	margin: 0 0 20px 0;
    	list-style: none;
	}
	#bottom{
		padding: 20px;
	    border-top: 2px solid #d4d4d4;
	    border-bottom: 1px solid #d4d4d4;
	}
	#bottom > h4{
		margin: 0 0 3px 0;
	    font-size: 17px;
	    font-weight: bold;
	    color: #335082;
	}
	#bottom > p{
		font-family: Arial,'돋움', Dotum;
	    font-size: 12px;
	    color: #666;
	}
</style>
		<div id = "tab-1">
			<ul>
				<li>
					<ul>
						<li>인터넷예약</li>
						<li>전화예약</li>
						<li>ARS예약</li>
						<li>예약번호 부여</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>리조트도착</li>
						<li>등록회원카드 제시</li>
						<li>객실키 수령</li>
						<li>등록카드 작성</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>비품확인</li>
						<li>객실 이용안내 숙지</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>숙박규정준수</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>객실 정리 후 퇴실</li>
						<li>객실키 프런트 반납</li>
						<li>요금정산</li>
					</ul>
				</li>
			</ul>
		</div>
		<div id = "bottom">
			<h4>ARS예약안내 1588-4888</h4>
			<p>
				1588-4888은 소노호텔&#38;리조트 대표 전화입니다. 예약에 관해 전화주시면 성의껏 답변해 드리겠습니다.
			</p>
		</div>
	</div>
</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>