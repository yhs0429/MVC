package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BbsDAO;
import model.BbsDTO;
import utility.Utility;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//검색관련--------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if(col.equals("total"))word = "";

		//페이징 관련---------------
		int nowPage = 1;
		if(request.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5;

		int sno = ((nowPage -1) * recordPerPage);
		int eno = recordPerPage;
		//1.model 사용
		Map map = new HashMap();
		map.put("col",col);
		map.put("word",word);
		map.put("sno",sno);
		map.put("eno",eno);
		
		BbsDAO dao = new BbsDAO();
		List<BbsDTO> list = dao.list(map);
		int total = dao.total(map);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		//2.request 저장(view페이지에서 사용할 내용을 저장)
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		//3.view 선택 (리턴)
		
		return "/view/list.jsp";
	}

}
