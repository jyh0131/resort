package com.khrd.service;

import java.util.List;

import com.khrd.dto.Notice;

public class NoticePage {
	private int total; //전체 게시글 개수
	private int currentPage; //사용자 요청 페이지 번호
	private List<Notice> nList; //보여질 게시글 리스트
	private int totalPages; ///전체 페이지 개수
	private int startPage; //페이지 시작 번호
	private int endPage; //페이지 마지막 번호
	
	public NoticePage() { }

	public NoticePage(int total, int currentPage, int size, List<Notice> nList) {
		super();
		this.total = total;
		this.currentPage = currentPage;
		this.nList = nList;
		
		if(total == 0) { //게시글이 0개면 모두 0
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		}else {
			totalPages = total / size;
			if(total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if(modVal == 0) {
				startPage -= 5;
			}
			endPage = startPage + 4;
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<Notice> getnList() {
		return nList;
	}

	public void setqList(List<Notice> nList) {
		this.nList = nList;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "NoticePage [total=" + total + ", currentPage=" + currentPage + ", nList=" + nList + ", totalPages="
				+ totalPages + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}
