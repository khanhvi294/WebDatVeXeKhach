package ptit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptit.entity.TaiKhoan;

public class DangNhapInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if (session.getAttribute("tkdn") != null) {
			TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("tkdn");

			if (taikhoan.getVaiTro().getMaVT().equals("KH")) {

				response.sendRedirect(request.getContextPath() + "/trangchu.html");
				return false;
			}

			else if (taikhoan.getVaiTro().getMaVT().equals("NV")) {

				response.sendRedirect(request.getContextPath() + "/nhanvien/trangchu.html");
				return false;
			}

			else if (taikhoan.getVaiTro().getMaVT().equals("QL")) {

				response.sendRedirect(request.getContextPath() + "/quanly/trangchu.html");
				return false;
			}
			
		}
		return true;
	}
}
