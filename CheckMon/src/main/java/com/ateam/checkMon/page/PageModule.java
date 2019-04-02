package com.ateam.checkMon.page;

public class PageModule {

	public static String getMakePage(String pagename, int totalcnt, int listsize, int pagesize, int cp) {
		
		StringBuffer sb = new StringBuffer();

		int totalpage=totalcnt/listsize+1; //총 페이지 갯수 계산 (게시글 아래에 출력할 총 페이지 갯수)
		if(totalcnt%listsize==0){ //나누어 떨어지는 경우에는 나머지 리스트가 없으므로 -1
		   totalpage--;
		}

		int usergroup=cp/pagesize; //user가 위치한 그룹 번호 계산 (그룹번호 0부터 시작)
		if(cp%pagesize==0){ //현재 위치하는 페이지와 나타내고자 하는 페이지의 마지막 번호가 동일할 경우 나누어떨어짐. 그룹에 넣어주기 위해 -1
		   usergroup--;
		}
		
		//페이지 아무것도 없을 때 default 값 설정
		if(totalpage==0) totalpage=1;
		
		sb.append("<ul class=\"pagination\">");
		
	    if(usergroup!=0){
	    	sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"");
	    	sb.append(pagename);
	    	sb.append("?cp="+((usergroup-1)*pagesize+pagesize)+"\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>\r\n" + 
	    			"<span class=\"sr-only\">Previous</span>\r\n" + 
	    			"</a></li>");
	    }
	    
	    for(int i=usergroup*pagesize+1;i<=usergroup*pagesize+pagesize;i++){
	    	sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"");
	    	sb.append(pagename);
	    	sb.append("?cp="+i+"\">"+i+"</a></li>");
	    
	    	if(i==totalpage){ 
	    		break;
	    	}
	    }
	    
	    if(usergroup!=(totalpage/pagesize+(totalpage%pagesize==0?1:0))){
	       sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"");
	       sb.append(pagename);
	       sb.append("?cp="+((usergroup+1)*pagesize+1)+"\"" + 
	       		"aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>\r\n" + 
	       		"<span class=\"sr-only\">Next</span>\r\n" + 
	       		"</a></li>");	       
	    }
	    
	    
	    sb.append("</ul>");
	    
	    System.out.println(sb.toString());
	    
	    return sb.toString();
	}
	
}
