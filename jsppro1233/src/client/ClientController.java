package client;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.dao.ClientDAO;
import client.dto.ClientDTO;
import crypt.BCrypt;

@WebServlet("/client_servlet/*")
public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI().toString();
		System.out.println(uri+"접근...");
		String contextPath = request.getContextPath();
		
		ClientDAO dao = new ClientDAO();
		
		if(uri.indexOf("join.do") != -1) {
			String page = "/member/client.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("login.do") != -1) {
			String page = "/member/login.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} 	
		
		 /*else if(uri.indexOf("client_info.do") != -1) {
			String page = "/member/client_info.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);	
		
		}*/ 
				
		else if(uri.indexOf("joinCheck.do") != -1) {
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String email = request.getParameter("email");
			String userpasswd = request.getParameter("userpasswd");
			
			ClientDTO dto = new ClientDTO();
			dto.setUserid(userid);
			dto.setEmail(email);
			dto.setUserpasswd(userpasswd);
			dto.setName(name);
			
			System.out.println(dto);
			dao.insert(dto);
			
			request.setAttribute("dto", dto);
			
			String page = "/member/client_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} 			
		else if(uri.indexOf("loginCheck.do")!=-1) {
			String userid = request.getParameter("userid");
			String userpasswd= request.getParameter("userpasswd");

			ClientDTO dto = new ClientDTO();
			dto.setUserid(userid);
			dto.setUserpasswd(userpasswd);
			
			String name = dao.loginCheck(dto);
			String page = "/member/login.jsp";
			
			System.out.println("dto:"+dto);
			System.out.println("name:"+name);
			
			if(name != null){
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("message", name+"님 환영합니다.");
				session.setAttribute("name", name);
				page = "/board/main.jsp";
				response.sendRedirect(request.getContextPath()+page+"?message=success");
			}else {
				page = "/member/login.jsp";
				response.sendRedirect(request.getContextPath()+page+"?message=error");
			}
		}	
		// member logout		
		else if(uri.indexOf("logout.do")!=-1) {
			System.out.println("로그아웃 접근");
			HttpSession session = request.getSession();
			session.invalidate();
			String message = URLEncoder.encode("logout", "utf-8");
			response.sendRedirect(contextPath+"/member/login.jsp?message="+message);
			
		} 
		// member_view		
		else if(uri.indexOf("member_view.do") != -1 ) {
			String userid = request.getParameter("userid");
			ClientDTO dto = dao.view(userid);
			request.setAttribute("dto", dto);
			String page="/member/client_info.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// member_update
		else if(uri.indexOf("member_update.do") != -1) {
			System.out.println("member_update.do호출...");
			String userid = request.getParameter("userid");
			String email = request.getParameter("email");
			String userpasswd = BCrypt.hashpw(request.getParameter("passwd"), BCrypt.gensalt());
			String name = request.getParameter("name");
			
			ClientDTO dto = new ClientDTO();
			dto.setUserid(userid);
			dto.setEmail(email);
			dto.setUserpasswd(userpasswd);
			dto.setName(name);
	
			HttpSession session = request.getSession();
			
			session.setAttribute("userid", userid);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			
			System.out.println("member update의 dto : "+dto);
			dao.update(dto);
			request.setAttribute("dto", dto);	
		}
		// member_delete
		else if(uri.indexOf("member_delete.do") != -1) {
			System.out.println("member_delete.do호출...");
			String userid = request.getParameter("id");
			dao.delete(userid);
			response.sendRedirect(contextPath+"/member/memberManage.jsp");
		}
		
		// member_withdraw		
		else if(uri.indexOf("withdraw.do") != -1) {
			System.out.println("withdraw.do호출...");
			String userid = request.getParameter("userid");
			dao.delete(userid);
			HttpSession session = request.getSession();
			session.invalidate();
			String message = URLEncoder.encode("withdraw", "utf-8");
			response.sendRedirect(contextPath+"/member/login.jsp?message="+message);
		}
			
// ***** 회원 아이디, 비밀번호 찾기 *****
		
		// member_finding id
		else if(uri.indexOf("findingId.do") != -1) {
			String page = "/member/find_id.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// id_check 
		else if(uri.indexOf("idCheck.do") != -1) {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			
			String message = "";
			String page = "";
			
			ClientDTO dto = new ClientDTO();
			dto.setEmail(email);
			dto.setName(name);
				
			String userid = dao.idCheck(dto);
				
			if(userid=="") {
				message = "error";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member/find_id.jsp?message="+message;
			} else {
				System.out.println(name+"님  아이디 검색 성공 : "+userid);
				request.setAttribute("userid", userid);
				page = "/member/find_id_result.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
