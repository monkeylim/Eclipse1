package member;

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

import crypt.BCrypt;
import member.dao.MemberDAO;
import member.dto.MemberDTO;
import page.Pager;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		System.out.println(uri+"접근...");
		String contextPath = request.getContextPath();
		
		MemberDAO dao = new MemberDAO();
		
		if(uri.indexOf("join.do") != -1) {
			String page = "/member/client.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("login.do") != -1) {
			String page = "/member/login.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("myPage.do") != -1) {
			String page = "/member/myPage.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);	
		
		} else if(uri.indexOf("myinfo.do") != -1) {
			String page = "/member/myinfo.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);	
		
		} 
		
			
		else if(uri.indexOf("joinCheck.do") != -1) {
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String email = request.getParameter("email");
			String userpasswd = request.getParameter("userpasswd");
			
			MemberDTO dto = new MemberDTO();
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
		
		// member loginCheck		
		else if(uri.indexOf("loginCheck.do")!=-1) {
			System.out.println("loginCheck.do 호출...");
			String userid = request.getParameter("userid");
			String userpasswd = request.getParameter("userpasswd");
			
			System.out.println(userid);
			System.out.println(userpasswd);
			
			String message = "";
			String page = "";
			
			if(userid == "") {
				message = "아이디를 입력해주세요.";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member_servlet/login.do?message="+message;
			} else if(userpasswd == "") {
				message = "패스워드를 입력해주세요.";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member_servlet/login.do?message="+message;
			} else {
				MemberDTO dto = new MemberDTO();
				dto.setUserid(userid);
				dto.setUserpasswd(userpasswd);
				
				String name = dao.loginCheck(dto);
				
				if(name=="") {
					message = "error";
					message = URLEncoder.encode(message, "utf-8");
					page = "/member_servlet/login.do?message="+message;
				} else {
					System.out.println(name+"님 환영합니다.");
					HttpSession session = request.getSession();
					dto = dao.view(userid);
					String email = dto.getEmail();
					Date join_date = dto.getJoin_date();
					
					
					session.setAttribute("id", userid);
					session.setAttribute("email", email);
					session.setAttribute("name", name);
					session.setAttribute("join_date", join_date);
					
					/*request.setAttribute("welcome", name);*/
					
					page = "/main/index.jsp";
				}
			}
			response.sendRedirect(contextPath+page);
			
		} 
		
		// myinfo_check 
		else if(uri.indexOf("myinfoCheck.do") != -1) {
			String userid = request.getParameter("id");
			String userpasswd = request.getParameter("passwd");
			
			System.out.println(userid);
			System.out.println(userpasswd);
			
			String message = "";
			String page = "";
			
			if(userpasswd == "") {
				message = "비밀번호를 입력해주세요.";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member_servlet/login.do?message="+message;
			} else {
				MemberDTO dto = new MemberDTO();
				dto.setUserid(userid);
				dto.setUserpasswd(userpasswd);
				
				String name = dao.loginCheck(dto);
				
				if(name=="") {
					message = "error";
					message = URLEncoder.encode(message, "utf-8");
					page = "/member/myinfo.jsp?message="+message;
				} else {
					System.out.println(name+"님 개인정보 수정에 접근");
					page = "/member/myinfo_view.jsp";
				}
			}
			response.sendRedirect(contextPath+page);
		}
		
		// member logout		
		else if(uri.indexOf("logout.do")!=-1) {
			System.out.println("로그아웃 접근");
			HttpSession session = request.getSession();
			session.invalidate();
			String message = URLEncoder.encode("logout", "utf-8");
			response.sendRedirect(contextPath+"/member/login.jsp?message="+message);
			
		} 
		
		/*// member_view		
		else if(uri.indexOf("member_view.do") != -1 ) {
			String id = request.getParameter("id");
			MemberDTO dto = dao.view(id);
			request.setAttribute("dto", dto);
			String page="/member/member_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		// member_update
		else if(uri.indexOf("member_update.do") != -1) {
			System.out.println("member_update.do호출...");
			String userid = request.getParameter("id");
			String email = request.getParameter("email");
			String userpasswd = BCrypt.hashpw(request.getParameter("passwd"), BCrypt.gensalt());
			String name = request.getParameter("name");
			

		
			
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setEmail(email);
			dto.setUserpasswd(userpasswd);
			dto.setName(name);
			

			HttpSession session = request.getSession();
			
			session.setAttribute("id", userid);
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
			String userid = request.getParameter("id");
			dao.delete(userid);
			HttpSession session = request.getSession();
			session.invalidate();
			String message = URLEncoder.encode("withdraw", "utf-8");
			response.sendRedirect(contextPath+"/member/login.jsp?message="+message);
		}*/
	
		
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
			
			MemberDTO dto = new MemberDTO();
			dto.setEmail(email);
			dto.setName(name);
				
			String id = dao.idCheck(dto);
				
			if(id=="") {
				message = "error";
				message = URLEncoder.encode(message, "utf-8");
				page = "/member/find_id.jsp?message="+message;
			} else {
				System.out.println(name+"님  아이디 검색 성공 : "+id);
				request.setAttribute("id", id);
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
