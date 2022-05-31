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
		if(session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "TaiKhoan/dangnhap.html");
			return false;
		}else {
			NhanVien nhanvien = (NhanVien) session.getAttribute("user");
			if(nhanvien != null) {
				
				if(!nhanvien.getTknv().getVaiTro().getMaVT().trim().equals("NV")) {
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
