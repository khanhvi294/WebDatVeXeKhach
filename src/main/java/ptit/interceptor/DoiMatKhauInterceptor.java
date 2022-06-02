
package ptit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptit.entity.TaiKhoan;

public class DoiMatKhauInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		 String reqUrl = request.getRequestURL().toString();
		 
		 if( reqUrl.contains("dangxuat")) {
			 return true;
		 }
		 
		 if(reqUrl.contains("doimatkhau")) {
			 System.out.println("req " + reqUrl);
			 if(session.getAttribute("tkdn") == null) {
				 response.sendRedirect(request.getContextPath() + "/trangchu.html");
				 return false;
			 }else if(session.getAttribute("tkdn") != null){ 
				 
				 TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("tkdn");
					if(taikhoan.getTrangThai() != 2 ) {
						 response.sendRedirect(request.getContextPath() + "/trangchu.html");
						return false;
					}
			 }
			 
			 return true;
		 }
		 
		 if(session.getAttribute("tkdn") != null){
			 
			 TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("tkdn");
				if(taikhoan.getTrangThai() == 2 ) {
					response.sendRedirect(request.getContextPath() + "/doimatkhau.html");
					return false;
				}
		}


		return true;
	}

}
