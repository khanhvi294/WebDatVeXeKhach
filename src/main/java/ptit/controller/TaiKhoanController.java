package ptit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptit.entity.KhachHang;
import ptit.entity.NhanVien;
import ptit.entity.TaiKhoan;

@Controller
@Transactional
public class TaiKhoanController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="dangnhap.html",method = RequestMethod.GET) 
	public String getDangNhapKH(ModelMap model) {
		model.addAttribute("taikhoan",new TaiKhoan());
		return "TaiKhoan/dangnhap";
	}
	@RequestMapping(value="dangnhap.html",method = RequestMethod.POST)
	public String postDangNhapKH(HttpSession ss,ModelMap model,
			@ModelAttribute("taikhoan") TaiKhoan tk, BindingResult errors) {
		//b1: ktra lỗi
		
		//b2: check tk
		TaiKhoan tkdn = this.KTtaikhoan(tk.getUserName(),tk.getMatKhau());
		if(tkdn == null){
			model.addAttribute("message", "Sai thông tin đăng nhập!");
			
			return "TaiKhoan/dangnhap";
		}
		
		if(tkdn.isTrangThai() == false) {
			model.addAttribute("message", "Tài khoản đang bị khóa!");
			
			return "TaiKhoan/dangnhap";
		}
		
		//b3: check vai tro tạo phiên đnagư nhập
		if (tkdn.getVaiTro().getMaVT().trim().equals("KH")) {
			KhachHang kh = this.getKhachHang(tkdn.getUserName());
			if(kh != null) {
				ss.setAttribute("user", kh);
				ss.setAttribute("vaitro", tkdn.getVaiTro().getMaVT());
				return "redirect:/trangchu.html";
			}else {
				model.addAttribute("message", "Tài khoản không tồn tại!");
				return "TaiKhoan/dangnhap";
			}
		} 
		else if(tkdn.getVaiTro().getMaVT().trim().equals("NV")) {
			NhanVien tknv = this.getNhanVien(tkdn.getUserName());
			if(tknv != null) {
				ss.setAttribute("user", tknv);
				ss.setAttribute("tkdn", tkdn);
				ss.setAttribute("vaitro", tkdn.getVaiTro().getMaVT());
				return "redirect:/QL_TrangChu.html";
			}
			else {
				model.addAttribute("message","Tài khoản không tồn tại!");
				return "TaiKhoan/dangnhap";
			}
		}
		else if(tkdn.getVaiTro().getMaVT().trim().equals("QL")) {
			NhanVien tknv = this.getNhanVien(tkdn.getUserName());
			if(tknv != null) {
				ss.setAttribute("user", tknv);
				ss.setAttribute("vaitro", tkdn.getVaiTro().getMaVT());
				return "QuanLy/trangchu";
			}
			else {
				model.addAttribute("message","Tài khoản không tồn tại!");
				return "TaiKhoan/dangnhap";
			}
		}
		return "TaiKhoan/dangnhap";
	}
	
	public TaiKhoan KTtaikhoan(String usern, String mk) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan t where t.userName =:usern and t.matKhau=:mk";
		Query query = session.createQuery(hql);
		query.setParameter("usern", usern);
		query.setParameter("mk", mk);

		List<TaiKhoan> list = query.list();
		if (list.size() == 0) {
			return null;
		}

		TaiKhoan tk = list.get(0);
		return tk;
		
	}

	public KhachHang getKhachHang(String usn) {
		Session session = factory.getCurrentSession();
		String hql = "from KhachHang where Username=:usn";
		Query query = session.createQuery(hql);
		query.setParameter("usn", usn);
		List<KhachHang> list = query.list();
		if(list.size()==0) {
			return null;
		}
		KhachHang kh = list.get(0);
		return kh;
	}
	public NhanVien getNhanVien(String usn) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien where Username=:usn";
		Query query = session.createQuery(hql);
		query.setParameter("usn", usn);
		List<NhanVien> list = query.list();
		if(list.size()==0) {
			return null;
		}
		NhanVien nv = list.get(0);
		return nv;
	}
	@RequestMapping("dangxuat")
	public String dangxuat(HttpSession ss) {
	
			ss.removeAttribute("user");
			ss.removeAttribute("vaitro");
		
			return "redirect:/dangnhap.html";
	
	}
}