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
<<<<<<< Updated upstream
		//b1: ktra lỗi
		
=======
		//b1: ktra lá»—i
		if(tk.getUserName().isEmpty()) {
			errors.rejectValue("userName", "tk","Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!");
		}
		if(tk.getMatKhau().isEmpty()) {
			errors.rejectValue("matKhau","tk","Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!");
		}
>>>>>>> Stashed changes
		//b2: check tk
		TaiKhoan tkdn = this.KTtaikhoan(tk.getUserName(),tk.getMatKhau());
		if(tkdn == null){
			model.addAttribute("message", "Sai thÃ´ng tin Ä‘Äƒng nháº­p!");
			
			return "TaiKhoan/dangnhap";
		}
		
		if(tkdn.getTrangThai() == 0) {
			model.addAttribute("message", "TÃ i khoáº£n Ä‘ang bá»‹ khÃ³a!");
			
			return "TaiKhoan/dangnhap";
		}
		
		//b3: check vai tro táº¡o phiÃªn Ä‘nagÆ° nháº­p
		if (tkdn.getVaiTro().getMaVT().trim().equals("KH")) {
			KhachHang kh = this.getKhachHang(tkdn.getUserName());
			if(kh != null) {
				ss.setAttribute("user", kh);
				ss.setAttribute("vaitro", tkdn.getVaiTro().getMaVT());
				return "redirect:/trangchu.html";
			}else {
				model.addAttribute("message", "TÃ i khoáº£n khÃ´ng tá»“n táº¡i!");
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
				model.addAttribute("message","TÃ i khoáº£n khÃ´ng tá»“n táº¡i!");
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
				model.addAttribute("message","TÃ i khoáº£n khÃ´ng tá»“n táº¡i!");
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
<<<<<<< Updated upstream
=======
	//Ä‘Äƒng kÃ­
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
			@ModelAttribute("khachhang") KhachHang kh,BindingResult errors){
		
		
		  if(kh.getHoKH().isEmpty()) { 
			  errors.rejectValue("hoKH","khachhang", "Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!"); } 
		  if(kh.getTenKH().isEmpty()) {
		  errors.rejectValue("tenKH","khachhang", "Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!"); }
		  if(kh.getNgSinh()==null) { 
			  errors.rejectValue("ngSinh","khachhang","Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!"); } 
		  if(kh.getTkkh().getEmail().isEmpty()) {
		  errors.rejectValue("tkkh.email", "khachhang","Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!"); }
		  if (!kh.getTkkh().getEmail().trim().matches(
					"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			  errors.rejectValue("tkkh.email", "khachhang","Vui lÃ²ng nháº­p Ä‘Ãºng Ä‘á»‹nh dáº¡ng email!");
		  }
		  System.out.println(gettkbyemail(kh.getTkkh().getEmail()));
		  System.out.println(kh.getTkkh().getUserName());
		  if(gettkbyemail(kh.getTkkh().getEmail())!=null) {
			  errors.rejectValue("tkkh.email", "khachhang","Email Ä‘Ã£ Ä‘Æ°á»£c sá»­ dá»¥ng!");
		  }
		  if(checkusername(kh.getTkkh().getUserName()) == false) {
			  errors.rejectValue("tkkh.userName", "khachhang","TÃªn Ä‘Äƒng nháº­p Ä‘Ã£ Ä‘Æ°á»£c sá»­ dá»¥ng!");
		  }
		  if (kh.getSdt().length() == 0) {
			  errors.rejectValue("sdt","khachhang", "Dá»¯ liá»‡u nÃ y khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!");
			}
		  if (! kh.getSdt().trim().matches("^[0-9]*$") || kh.getSdt().length() != 10) {
			  errors.rejectValue("sdt","khachhang", "Vui lÃ²ng nháº­p Ä‘Ãºng Ä‘á»‹nh dáº¡ng sá»‘ Ä‘iá»‡n thoáº¡i!");
			
			}
		  if(kh.getTkkh().getUserName().isEmpty()) {
		  errors.rejectValue("tkkh.userName", "khachhang","Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!"); }
		  
		  System.out.println(pw);
		  System.out.println(rpw);
		  if(pw.equals("")) {
			  errors.rejectValue("tkkh.matKhau","KhachHang", "Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!"); }
		 
		  if(rpw.equals("")) {
			model.addAttribute("messageer","Dá»¯ liá»‡u khÃ´ng Ä‘Æ°á»£c Ä‘á»ƒ trá»‘ng!");
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
			}catch(Exception e) {
				System.out.println(e);
				System.out.println(e.getCause());
				t.rollback();
			}finally {
				session2.close();
			}
			return "redirect: trangchu.html";
		}
		
		
		return "TaiKhoan/dangki";
	}
	
	@RequestMapping("quenmatkhau")
	public String formquenmatkhau(ModelMap model) {
		
		return "TaiKhoan/quenmatkhau";
	}
	
	@RequestMapping(value="dangnhap.html",method=RequestMethod.POST,params="btnlaymatkhau")
	public String quenmatkhau(@RequestParam("email") String email,ModelMap model) {
		System.out.println("vo");
		TaiKhoan tk = gettkbyemail(email);
		
		if(tk == null) {
			
			return "redirect:quenmatkhau.html";
		}
		System.out.println(tk.getUserName());
		Random random = new Random();
		int ranNum = random.nextInt(999999)+100000;
		String matkhaumoi = Integer.toString(ranNum);
		String mkhash = hashPass(matkhaumoi);
		tk.setMatKhau(mkhash);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			System.out.println("hihi");
			session.update(tk);
			t.commit();
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);

			try {
				System.out.println("khanhvigui");
				helper.setFrom("no-reply-email");
				helper.setTo(/* email */"n19dccn223@student.ptithcm.edu.vn");
				helper.setSubject("Ä�áº·t láº¡i máº­t kháº©u");
				helper.setText("Máº­t kháº©u má»›i cá»§a quÃ½ khÃ¡ch lÃ : " + matkhaumoi);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			mailer.send(mail);
			model.addAttribute("message", "Máº­t kháº©u má»›i Ä‘Ã£ Ä‘Æ°á»£c gá»­i vÃ o Email");
			
		}catch(Exception e) {
			t.rollback();
			System.out.println(e.getCause());
			System.out.println("huhu");
		}finally {
			session.close();
		}
		model.addAttribute("taikhoan",new TaiKhoan());
		return "TaiKhoan/dangnhap";
	}
	@RequestMapping(value="dangnhap.html",params="btnDatlaimatkhau")
	public String datlaimatkhau() {
		
		
		return "TaiKhoan/dangnhap";
	}
	// táº¡o mÃ£ tá»± Ä‘á»™ng
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
//mÃ£ hÃ³a máº­t kháº©u
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
>>>>>>> Stashed changes
}