 package ptit.interceptor;
 
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import javax.servlet.http.HttpSession;
 import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptit.entity.KhachHang;
import ptit.entity.TaiKhoan;
 
 
 public class KhachHangInterceptor extends HandlerInterceptorAdapter {
 	@Override
 	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
 			throws Exception {
 		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/dangnhap.html");
			return false;
		}else {
			KhachHang khachhang = (KhachHang) session.getAttribute("user");
			if(khachhang != null) {
				
				if(!khachhang.getTkkh().getVaiTro().getMaVT().trim().equals("KH")) {
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
