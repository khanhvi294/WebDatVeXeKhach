package ptit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptit.entity.NhanVien;
import ptit.entity.TaiKhoan;


public class NhanVienInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null && session.getAttribute("tkdn") == null) {
			response.sendRedirect(request.getContextPath() + "TaiKhoan/dangnhap.html");
			return false;
		}else {
			TaiKhoan nhanvien = (TaiKhoan) session.getAttribute("tkdn");
			if(nhanvien != null) {
				
				if(!nhanvien.getVaiTro().getMaVT().trim().equals("NV")) {
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
