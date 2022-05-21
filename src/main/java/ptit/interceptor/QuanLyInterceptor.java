package ptit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class QuanLyInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "TaiKhoan/dangnhap.html");
			return false;
		}else {
			String vaitro = (String) session.getAttribute("vaitro");
			if(vaitro != null) {
				
				if(!vaitro.trim().equals("QL")) {
					response.sendRedirect(request.getContextPath() + "/403.html");
					return false;
				}
			}else {
				response.sendRedirect(request.getContextPath() + "/dangnhap.html");
				return false;
			}
		}
		
		return true;
	}
}


