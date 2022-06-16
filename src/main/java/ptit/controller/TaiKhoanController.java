package ptit.controller;

import org.apache.commons.codec.digest.DigestUtils;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javassist.expr.NewArray;
import ptit.entity.KhachHang;
import ptit.entity.NhanVien;
import ptit.entity.TaiKhoan;
import ptit.entity.VaiTro;

@Controller
@Transactional
public class TaiKhoanController {
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;
	
	String referer = "";
	@RequestMapping(value="dangnhap.html",method = RequestMethod.GET) 
	public String getDangNhap(ModelMap model,HttpSession ss, HttpServletRequest request) {

		System.out.println("ihihihi");
		model.addAttribute("taikhoan",new TaiKhoan());
		
		referer = request.getHeader("Referer");
		return "TaiKhoan/dangnhap";
	}
	@RequestMapping(value="dangnhap.html",method = RequestMethod.POST)
	public String postDangNhap(HttpSession ss,ModelMap model, HttpServletRequest request,
			@ModelAttribute("taikhoan") TaiKhoan tk, BindingResult errors) {
		System.out.println("vitesst");
		//b1: ktra lỗi
		
		if(tk.getUserName().isEmpty()) {
			errors.rejectValue("userName", "tk","Dữ liệu không được để trống!");
		}
		if(tk.getMatKhau().isEmpty()) {
			errors.rejectValue("matKhau","tk","Dữ liệu không được để trống!");
		}
		//b2: check tk
		if(errors.hasErrors()) {
			return "TaiKhoan/dangnhap";
		}
		String matkhau = hashPass(tk.getMatKhau());
		TaiKhoan tkdn = this.KTtaikhoan(tk.getUserName(),matkhau);
		if(tkdn == null){
			model.addAttribute("message",new Message("error", "Sai thông tin đăng nhập!"));
			
			return "TaiKhoan/dangnhap";
		}
		
		if(tkdn.getTrangThai() == 0) {
			model.addAttribute("message", new Message("error","Tài khoản đang bị khóa!"));

			
			return "TaiKhoan/dangnhap";
		}
		Session session = factory.getCurrentSession();
	
		TaiKhoan taikhoan = (TaiKhoan)session.get(TaiKhoan.class, tkdn.getUserName());
		ss.setAttribute("tkdn", taikhoan);
		
		//b3: check vai tro táº¡o phiÃªn Ä‘nagÆ° nháº­p
		if (tkdn.getVaiTro().getMaVT().trim().equals("KH")) {
			KhachHang kh = this.getKhachHang(tkdn.getUserName());
			if(kh != null) {
				ss.setAttribute("user", kh);
				
				
				if(referer != null) {
					System.out.println("refer " + referer);
					if(referer.contains("chonchuyen.html")) {
						return "redirect:" + referer;
					}
					
				}
				return "redirect:/trangchu.html";
			}else {
				model.addAttribute("message", new Message("error", "Tài khoản không tồn tại!"));
				return "TaiKhoan/dangnhap";
			}
		} 
		else if(tkdn.getVaiTro().getMaVT().trim().equals("NV")) {
			NhanVien nv = this.getNhanVien(tkdn.getUserName());
			if(nv != null) {
				ss.setAttribute("user", nv);

				return "redirect:quanly/trangchu.html";
			}
			else {
				model.addAttribute("message","Tài khoản không!");
				return "TaiKhoan/dangnhap";
			}
		}
		else if(tkdn.getVaiTro().getMaVT().trim().equals("QL")) {
			NhanVien ql = this.getNhanVien(tkdn.getUserName());
			if(ql != null) {
				ss.setAttribute("user", ql);
				return "redirect:quanly/trangchu.html";
			}
			else {
				model.addAttribute("message", new Message("error", "Tài khoản không tồn tại!"));
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
			ss.removeAttribute("tkdn");
		
			return "redirect:/dangnhap.html";
	
	}

	//đăng kí

	@RequestMapping("dangki") 
	public String showdangki(ModelMap model){
		
		KhachHang kh = new KhachHang();
		TaiKhoan tk = new TaiKhoan();
		kh.setTkkh(tk);
		model.addAttribute("khachhang", kh);
		
		return "TaiKhoan/dangki";
	}
	@RequestMapping(value="dangki.html",method= RequestMethod.POST)
	public String dangki(HttpServletRequest request,ModelMap model,
			@RequestParam("pw") String pw,@RequestParam("rpw") String rpw,
			@ModelAttribute("khachhang") KhachHang kh,BindingResult errors,RedirectAttributes redirectAttributes){
		
		
		  if(kh.getHoKH().isEmpty()) { 

			  errors.rejectValue("hoKH","khachhang", "Dữ liệu không được để trống!"); } 
		  if(kh.getTenKH().isEmpty()) {
		  errors.rejectValue("tenKH","khachhang", "Dữ liệu không được để trống!"); }
		  if(kh.getNgSinh()==null) { 
			  errors.rejectValue("ngSinh","khachhang","Dữ liệu không được để trống!"); } 
		  if(kh.getTkkh().getEmail().isEmpty()) {
		  errors.rejectValue("tkkh.email", "khachhang","Dữ liệu không được để trống!"); }
		  if (!kh.getTkkh().getEmail().trim().matches(
					"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			  errors.rejectValue("tkkh.email", "khachhang","Vui lòng nhập đúng định dạng email!");

		  }
		  System.out.println(gettkbyemail(kh.getTkkh().getEmail()));
		  System.out.println(kh.getTkkh().getUserName());
		  if(gettkbyemail(kh.getTkkh().getEmail())!=null) {

			  errors.rejectValue("tkkh.email", "khachhang","Email đã được sử dụng!");
		  }
		  if(checkusername(kh.getTkkh().getUserName()) == false) {
			  errors.rejectValue("tkkh.userName", "khachhang","Tên đăng nhập đã được sử dụng!");
		  }
		  if (kh.getSdt().length() == 0) {
			  errors.rejectValue("sdt","khachhang", "Dữ liệu này không được để trống!");
			}
		  if (! kh.getSdt().trim().matches("^[0-9]*$") || kh.getSdt().length() != 10) {
			  errors.rejectValue("sdt","khachhang", "Vui lòng nhập đúng định dạng số điện thoại!");
			
			}
		  if(kh.getTkkh().getUserName().isEmpty()) {
		  errors.rejectValue("tkkh.userName", "khachhang","Dữ liệu không được để trống!"); }
		  
		  System.out.println(pw);
		  System.out.println(rpw);
		  if(pw.equals("")) {

			  errors.rejectValue("tkkh.matKhau","KhachHang", "Dữ liệu không được để trống!"); }
		 
		  if(rpw.equals("")) {
			model.addAttribute("messageer","Dữ liệu không được để trống!");
		}
		  if(!rpw.equals(pw)){
			  model.addAttribute("messageer","Mật khẩu không trùng khớp!");
		  }
		if(!errors.hasErrors()) {
			Session session = factory.getCurrentSession();
			VaiTro vt = (VaiTro)session.get(VaiTro.class,"KH");
			System.out.println(vt.getMaVT());
			kh.setMaKH(taoMa("KH","KhachHang","maKH"));
			kh.getTkkh().setTrangThai(1);
			kh.getTkkh().setVaiTro(vt);
			String password = request.getParameter("pw");
			kh.getTkkh().setMatKhau(hashPass(password));
			Session session2 = factory.openSession();
			Transaction t = session2.beginTransaction();
			try {
				session2.save(kh.getTkkh());
				session2.save(kh);
				t.commit();
				redirectAttributes.addFlashAttribute("message",new Message("success", "Đăng kí thành công!"));
			}catch(Exception e) {
				System.out.println(e);
				System.out.println(e.getCause());
				t.rollback();
				return "TaiKhoan/dangki";
			}finally {
				session2.close();
			}
			return "redirect:dangnhap.html";
		}
		
		
		return "TaiKhoan/dangki";
	}
	
	@RequestMapping("quenmatkhau")
	public String formquenmatkhau(ModelMap model) {
		
		return "TaiKhoan/quenmatkhau";
	}
	
	@RequestMapping(value="dangnhap.html",method=RequestMethod.POST,params="btnlaymatkhau")
	public String quenmatkhau(@RequestParam("email") String email,ModelMap model,RedirectAttributes redirectAttributes) {
	
		if(email.isEmpty()) {
			redirectAttributes.addFlashAttribute("ms1","Email không được để trống!");
			
			return "redirect:quenmatkhau.html";
		 }
		 if (!email.trim().matches(
					"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			 redirectAttributes.addFlashAttribute("ms1","Email không hợp lệ!");
			 return "redirect:quenmatkhau.html";

		  }
		
		TaiKhoan tk = gettkbyemail(email);
		
		if(tk == null) {
			redirectAttributes.addFlashAttribute("ms1","Email không tồn tại.Vui lòng kiểm tra lại!");
			redirectAttributes.addFlashAttribute("email", email);
			return "redirect:quenmatkhau.html";
		}
		 
		Random random = new Random();
		int ranNum = random.nextInt(999999)+100000;
		String matkhaumoi = Integer.toString(ranNum);
		String mkhash = hashPass(matkhaumoi);
		tk.setMatKhau(mkhash);
		tk.setTrangThai(2);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			
			session.update(tk);
			t.commit();
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);

			try {

				helper.setFrom("no-reply-email");
				helper.setTo(/* email */"n19dccn223@student.ptithcm.edu.vn");

				helper.setSubject("Đặt lại mật khẩu");
				helper.setText(" <div style=\"padding-bottom: 10rem;background-color: #f1f1f1; font-family: 'Roboto', sans-serif;\r\n"
						+ "    box-sizing: border-box;\">\r\n"
						+ "        <div style=\" width: 100%;\r\n"
						+ "        padding: 1rem 0;\">\r\n"
						+ "            <div style=\"margin: 0 auto;\r\n"
						+ "            width: 200px;\r\n"
						+ "            height: 100px;\r\n"
						+ "            background-image: url('https://futabus.vn/_nuxt/img/logo-img.c178602.png');\r\n"
						+ "            background-position: center center;\r\n"
						+ "            background-size: contain;\r\n"
						+ "            background-repeat: no-repeat;\"></div>\r\n"
						+ "        </div>\r\n"
						+ "        <div style=\"  margin: 0 auto;\r\n"
						+ "        border-radius: 0.2rem;\r\n"
						+ "        border: 2px solid rgba(175, 168, 168, 0.473);\r\n"
						+ "        max-width: 40rem;\r\n"
						+ "        background-color: #fff;\r\n"
						+ "        padding: 4rem;\">\r\n"
						+ "            <p style=\"margin: 1rem 0;\">Xin chào Vi!</p>\r\n"
						+ "            <p style=\"margin: 1rem 0 0.3rem 0;\">Bạn nhận được email này vì lí do quên mật khẩu. </p>\r\n"
						+ "            <p> Mật khẩu mới của bạn là:\r\n"
						+                 matkhaumoi+". Click vào nút bên dưới để quay lại trang web\r\n"
						+ "            </p>\r\n"
						+ "            <div style=\"margin-top: 30px; width: 100%;\r\n"
						+ "            margin-bottom: 3rem;\r\n"
						+ "            text-align: center;\"><a href=\"http://localhost:8080/CNPM/dangnhap.html\" style=\" display: inline-block;\r\n"
						+ "            padding: 18px 20px;\r\n"
						+ "            background-color: #1890ff;\r\n"
						+ "            border-radius: 3px;\r\n"
						+ "            text-decoration: none;\r\n"
						+ "            color: #fff;\r\n"
						+ "            font-weight: 600;\r\n"
						+ "            font-size: 16px;\" target=\"_blank\">Trang\r\n"
						+ "                    chủ</a></div>\r\n"
						+ "\r\n"
						+ "            <p style=\"font-size: 14px;margin: 1rem 0;\"> Chúc bạn một ngày tốt lành!</p>\r\n"
						+ "\r\n"
						+ "        </div>\r\n"
						+ "    </div>", true);

			} catch (MessagingException e) {
				e.printStackTrace();
			}
			mailer.send(mail);

			model.addAttribute("message", new Message("success", "Mật khẩu mới đã được gửi vào Email"));
			
		}catch(Exception e) {
			t.rollback();
			redirectAttributes.addFlashAttribute("message", new Message("error", "Lấy lại mật khẩu thất bại!"));
			return "redirect:quenmatkhau.html";
		
		}finally {
			session.close();
		}
		model.addAttribute("taikhoan",new TaiKhoan());
		return "TaiKhoan/dangnhap";
	}

	@RequestMapping("doimatkhau") 
	public String hiendoimatkhau(){
		return "TaiKhoan/doimatkhau";
	}
	@RequestMapping(value="doimatkhau.html",method=RequestMethod.POST) 
	public String doimatkhau(@RequestParam("pw") String pw,@RequestParam("rpw") String rpw,
			ModelMap model,HttpServletRequest request,RedirectAttributes redirectAttributes){
		
		boolean check = false;
		if(!rpw.equals(pw)) {
			model.addAttribute("messrpw","Mật khẩu không trùng khớp!");
			check = true;
		}
		if(rpw.length()<6) {
			model.addAttribute("messpw","Mật khẩu không được bé hơn 6 kí tự!");
			check=true;
		}
		
		if(rpw.isEmpty()) {
			model.addAttribute("messrpw","Dữ liệu không được để trống!");
			check = true;
		}
		if(pw.isEmpty()) {
			model.addAttribute("messpw","Dữ liệu không được để trống!");
			check = true;
		}
		if(check) {
			return "TaiKhoan/doimatkhau";
		}
		HttpSession ss = request.getSession();
		TaiKhoan tk = (TaiKhoan)ss.getAttribute("tkdn");
		String matkhaumoi = hashPass(pw);
		tk.setMatKhau(matkhaumoi);
		tk.setTrangThai(1);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(tk);
			t.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Đổi mật khẩu thành công"));
			
			if(!tk.getVaiTro().getMaVT().equals("KH")) {
				return "redirect:quanly/trangchu.html";
				
			}
		}catch(Exception e) {
			System.out.println(e.getCause());
			t.rollback();
			model.addAttribute("message",new Message("error", "Đổi mật khẩu thất bại!"));
			return "TaiKhoan/doimatkhau";
		}finally {
			session.close();
		}
		return "redirect:trangchu.html";
	}

	// tạo mã tự động

	public String taoMa(String refix, String table, String columnId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + table;
		Query query = session.createQuery(hql);
		int number = query.list().size() + 1;
		boolean isInValid = true;
		String id = refix;
		DecimalFormat df = new DecimalFormat("000000");
		while (isInValid) {
			String pkTemp = id + df.format(number);
			String hqlwhere = hql + " WHERE " + columnId + " = '" + pkTemp + "'";
			query = session.createQuery(hqlwhere);
			if (query.list().size() > 0)
				number++;
			else {
				id = pkTemp;
				isInValid = false;
			}
		}
		return id;
	}

//mã hóa mật khẩu

	public String hashPass(String matKhau) {
		String hashpw = DigestUtils.md5Hex(matKhau).toUpperCase();
		return hashpw;
	}
	public TaiKhoan gettkbyemail(String email) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan where email=:email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		List<TaiKhoan> list = query.list();
		if(list.size() == 0) {
			return null;
		}
		System.out.println(list.get(0).getUserName());
		return list.get(0);
	}
	public boolean checkusername(String username) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan where userName=:username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		List<String> list = query.list();
		if(list.size() != 0) {
			return false;
		}
		return true;
	}

}