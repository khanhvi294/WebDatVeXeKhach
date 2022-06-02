package ptit.controller;

import java.math.BigDecimal;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.commons.codec.digest.DigestUtils;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import ptit.entity.ChuyenXe;
import ptit.entity.DiaDiem;
import ptit.entity.KhachHang;
import ptit.entity.PhieuDat;
import ptit.entity.TaiKhoan;
import ptit.entity.VeXe;
import ptit.entity.VeXePK;


@Controller
@Transactional
public class KhachHangController {
	@Autowired
	SessionFactory factory;
	public List<VeXe> dsve;
	public ChuyenXe cx = new ChuyenXe();
	
	

	@ModelAttribute("chuyenxe")
	public ChuyenXe chuyenxe() {
		return new ChuyenXe();
	}

	@ModelAttribute("dschuyenxe")
	public List<ChuyenXe> getDSChuyenXe() {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe";
		Query query = session.createQuery(hql);

		List<ChuyenXe> list = query.list();

		return list;
	}

	@RequestMapping("trangchu")
	public String index(ModelMap model) {
		/* model.addAttribute("chuyenxe",new ChuyenXe()); */
		return "KhachHang/trangchu";
	}
	
//tìm chuyến
	@RequestMapping("timchuyen")
	public String timchuyen(ModelMap model) {

		return "KhachHang/timchuyen";
	}

//chọn chuyến
	@RequestMapping(value = "chonchuyen")
	public String chonchuyen(@ModelAttribute("chuyenxe") ChuyenXe cx, ModelMap model,HttpServletRequest request) {
System.out.println("ihi");
System.out.println(cx.getNgKH());
		String referer = request.getHeader("Referer");
		String r = referer.substring(referer.lastIndexOf("/") + 1);
		if(r.equals("timchuyen.html") || r.equals("trangchu.html")) {
			Session session = factory.getCurrentSession();
			List<ChuyenXe> list = this.getdsChuyenXe(cx.getTuyen().getDiemDi().getMaDD(),
					cx.getTuyen().getDiemDen().getMaDD(), cx.getNgKH());
			model.addAttribute("dschuyenxe", list);
			model.addAttribute("diemdi", (DiaDiem) session.get(DiaDiem.class, cx.getTuyen().getDiemDi().getMaDD()));
			model.addAttribute("diemden", (DiaDiem) session.get(DiaDiem.class, cx.getTuyen().getDiemDen().getMaDD()));

		}else {
			
		}
		
	
		return "KhachHang/chonchuyen";
	}

//chọn ghế
	@RequestMapping(value = "chonghe")
	public String chonghe(HttpServletRequest request, HttpSession ss, ModelMap model,
			@ModelAttribute("dschuyenxe") List<ChuyenXe> dscx,RedirectAttributes redirectAttributes,
			@ModelAttribute("diemdi") String diemdi,@ModelAttribute("diemden") String diemden) {

		String referer = request.getHeader("Referer");
		String r = referer.substring(referer.lastIndexOf("/") + 1);

		if (r.equals("chonchuyen.html")) {

			PhieuDat pd = new PhieuDat();
			pd.setMaPD(taoMa("PD", "PhieuDat", "maPD"));
			pd.setTrangThai(0);
			KhachHang kh = (KhachHang) ss.getAttribute("user");
			pd.setKH(kh);
			String machuyen = request.getParameter("machuyen");
			if(machuyen==null) {
				redirectAttributes.addFlashAttribute("message","Vui lòng chọn chuyến xe!");
				redirectAttributes.addFlashAttribute("dschuyenxe",dscx);
				redirectAttributes.addFlashAttribute("diemdi",diemdi);
				redirectAttributes.addFlashAttribute("diemden",diemden);
				return "redirect: chonchuyen.html";
			}
			Session session = factory.getCurrentSession();
			ChuyenXe cx = (ChuyenXe) session.get(ChuyenXe.class, machuyen);
			this.cx = cx;
			pd.setChuyen(this.cx);
			pd.setTongtien(new BigDecimal(0));
			ss.setAttribute("PhieuDat", pd);
		}
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(this.cx.getMaChuyen());
		List<PhieuDat> dspd = getdsphieudatbycx(this.cx.getMaChuyen());

		for (PhieuDat phieudat : dspd) {
			for (VeXe ve : phieudat.getVexe()) {
				String soghe = ve.getId().getSoGhe();
				map.put(soghe, "disabled");
			}
		}

		model.addAttribute("map", map);

		return "KhachHang/chonghe";

	}

// điền thông tin
	@RequestMapping(value = "dienthongtin")
	public String dienthongtin(ModelMap model, HttpServletRequest request, HttpSession ss,
			RedirectAttributes redirectAttributes) {

		String referer = request.getHeader("Referer");
		String r = referer.substring(referer.lastIndexOf("/") + 1);
		if (r.equals("chonghe.html")) {
			String[] dsghe = request.getParameterValues("ghe");
			if (dsghe == null) {
				redirectAttributes.addFlashAttribute("message",
						new Message("error", "Vui lòng chọn ghế!"));

				return "redirect:chonghe.html";
			}
			dsve = new ArrayList<VeXe>();

			for (String ghe : dsghe) {
				VeXe vexe = new VeXe();
				VeXePK id = new VeXePK();
				id.setSoGhe(ghe);
				id.setPd(((PhieuDat) ss.getAttribute("PhieuDat")).getMaPD());
				vexe.setId(id);
				dsve.add(vexe);
			}
			PhieuDat phieudat = (PhieuDat) ss.getAttribute("PhieuDat");
			KhachHang kh = (KhachHang) ss.getAttribute("user");
			phieudat.setEmail(kh.getTkkh().getEmail());
			phieudat.setSdt(kh.getSdt());

			model.addAttribute("phieudat", phieudat);

		}

		return "KhachHang/dienthongtin";
	}

//thanh toán

	@RequestMapping(value = "thanhtoan", method = RequestMethod.POST)
	public String thanhtoan(@ModelAttribute("phieudat") PhieuDat pd, HttpSession ss, ModelMap model,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		boolean check = false;

		if (pd.getSdt().length() != 10) {
			redirectAttributes.addFlashAttribute("ersdt", "Vui lòng nhập đúng định dạng số điện thoại!");
			check = true;
		}
		if (!pd.getSdt().trim().matches("^[0-9]*$") || pd.getSdt().length() != 10) {
			redirectAttributes.addFlashAttribute("ersdt", "Vui lòng nhập đúng định dạng số điện thoại!");
			check = true;
		}
		if (!pd.getEmail().trim().matches(
				"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			redirectAttributes.addFlashAttribute("eremail", "Vui lòng nhập đúng định dạng email!");
			check = true;
		}
		if (pd.getSdt().length() == 0) {
			redirectAttributes.addFlashAttribute("ersdt", "Dữ liệu này không được để trống!");

			check = true;
		}
		if (pd.getEmail().isEmpty()) {
			redirectAttributes.addFlashAttribute("eremail", "Dữ liệu này không được để trống!");
			check = true;
		}
		if (request.getParameter("dongy") == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đồng ý điều khoản để tiếp tục!");
			check = true;
		}

		if (check) {

			redirectAttributes.addFlashAttribute("phieudat", pd);
			redirectAttributes.addFlashAttribute("message",new Message("error", "Vui lòng đồng ý với điều khoản!"));
			return "redirect:dienthongtin.html";
		}
		PhieuDat pdss = (PhieuDat) ss.getAttribute("PhieuDat");

		pdss.setEmail(pd.getEmail());
		pdss.setSdt(pd.getSdt());

		BigDecimal tongtien = (pdss.getChuyen().getGia()).multiply(BigDecimal.valueOf(dsve.size()));
		System.out.println(tongtien);
		model.addAttribute("tongtien", tongtien);
		ss.setAttribute("PhieuDat", pdss);
		model.addAttribute("chuyenxe", cx);
		model.addAttribute("dsve", dsve);

		return "KhachHang/thanhtoan";
	}

	@RequestMapping(value = "trangchu", params = "btnDatVe", method = RequestMethod.POST)
	public String datve(HttpSession ss, HttpServletRequest request, ModelMap model) {
		PhieuDat pd = (PhieuDat) ss.getAttribute("PhieuDat");

		pd.setPttt(Boolean.valueOf(request.getParameter("pttt")));
		pd.setNgaydat(new Date());
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pd);
			for (VeXe ve : dsve) {
				session.save(ve);
			}
			t.commit();
			model.addAttribute("message",
					new Message("success","Đặt vé thành công!"));
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message",new Message("error", "Đặt vé thất bại!"));
			System.out.println(e.getCause());
		} finally {
			session.close();
		}

		return "KhachHang/trangchu";
	}

	/// account
	@RequestMapping("thongtincanhan")
	public String canhan(ModelMap model, HttpSession ss) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		model.addAttribute("khachhang", kh);
		return "KhachHang/thongtincanhan";
	}

	@RequestMapping(value = "thongtincanhan", method = RequestMethod.POST)
	public String ttcanhan(HttpSession sess, @ModelAttribute("khachhang") KhachHang khachhang, BindingResult errors,ModelMap model) {
		System.out.println(khachhang.getMaKH());
		if (khachhang.getHoKH().isEmpty()) {
			 errors.rejectValue("hoKH", "KhachHang", "Dữ liệu không được để trống!"); 
		}
		if (khachhang.getTenKH().isEmpty()) {
			errors.rejectValue("tenKH", "KhachHang", "Dữ liệu không được để trống!");
		}
		if (khachhang.getTkkh().getEmail().isEmpty()) {
			errors.rejectValue("tkkh.email", "KhachHang", "Dữ liệu không được để trống!");
		}
		if (!khachhang.getTkkh().getEmail().trim().matches(
				"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			errors.rejectValue("tkkh.email", "KhachHang", "Vui lòng nhập đúng định dạng email!");
		}
		if (khachhang.getSdt().isEmpty()) {
			errors.rejectValue("sdt", "KhachHang", "Dữ liệu không được để trống!");
		}
		if (khachhang.getNgSinh() == null) {
			errors.rejectValue("ngSinh", "KhachHang", "Dữ liệu không được để trống!");
		}
		if (!khachhang.getSdt().trim().matches("^[0-9]*$") || khachhang.getSdt().length() != 10) {
			errors.rejectValue("sdt", "KhachHang", "Vui lòng nhập đúng định dạng số điện thoại!");
		}

		if (khachhang.getNgSinh().after(new Date())) {
			errors.rejectValue("ngSinh", "KhachHang", "Ngày sinh phải bé hơn ngày hiện tại!");
		}

		
		if (!errors.hasErrors()) {
			Session ss = factory.getCurrentSession();

			TaiKhoan tk = (TaiKhoan) ss.get(TaiKhoan.class, khachhang.getTkkh().getUserName());

			KhachHang khachhangcu = (KhachHang) ss.get(KhachHang.class, khachhang.getMaKH());
			System.out.println(khachhangcu.getMaKH() + " " + khachhangcu.getHoKH());
			tk.setEmail(khachhang.getTkkh().getEmail());

			khachhangcu.getTkkh().setEmail(khachhang.getTkkh().getEmail());
			khachhang.setMaKH(khachhangcu.getMaKH());
			khachhang.setTkkh(khachhangcu.getTkkh());
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();

			try {
				session.update(tk);

				session.merge(khachhang);

				t.commit();
				sess.setAttribute("user", khachhang);
				model.addAttribute("message",new Message("success", "Cập nhật thông tin thành công"));
			} catch (Exception e) {
				System.out.println(e);
				System.out.println(e.getCause());
				t.rollback();
				model.addAttribute("message",new Message("error", "Cập nhật thông tin thất bại!"));
			} finally {
				session.close();
			}

			return "KhachHang/thongtincanhan";
		}
		return "KhachHang/thongtincanhan";

	}

//đổi mật khẩu
	@RequestMapping("doimatkhau")
	public String doimk() {
		return "KhachHang/doimatkhau";
	}

	@RequestMapping(value = "doimatkhau", method = RequestMethod.POST)
	public String doimatkhau(HttpSession ss, @RequestParam("cpassword") String PW,
			@RequestParam("npassword") String nPW, @RequestParam("rnpassword") String rnPW, ModelMap model) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		System.out.println(kh.getTenKH());
		Session session = factory.getCurrentSession();
		TaiKhoan tkkh = (TaiKhoan) session.get(TaiKhoan.class, kh.getTkkh().getUserName());

		boolean check = false;
		if (PW.isEmpty()) {
			model.addAttribute("message1", "Dữ liệu không được để trống!");
			check = true;
		}
		if (nPW.isEmpty()) {
			model.addAttribute("message2", "Dữ liệu không được để trống!");
			check = true;
		}
		if (rnPW.isEmpty()) {
			model.addAttribute("message3", "Dữ liệu không được để trống!");
			check = true;
		}

		if (check) {
			return "KhachHang/doimatkhau";
		}

		String matkhau = hashPass(PW);
		if (tkkh.getMatKhau().equals(matkhau) == false) {
			model.addAttribute("message1", "Sai mật khẩu!");
		} else {
			if (nPW.equals(rnPW) == false) {
				model.addAttribute("message3", "Mật khẩu không trùng khớp!");
			} else {
				Session session2 = factory.openSession();
				Transaction t = session2.beginTransaction();
				String matkhaumoi = hashPass(nPW);
				tkkh.setMatKhau(matkhaumoi);
				try {
					session2.update(tkkh);
					t.commit();
					model.addAttribute("message",new Message("success", "Đổi mật khẩu thành công!"));
					kh.setTkkh(tkkh);
					ss.setAttribute("user", kh);
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message",new Message("error", "Đổi mật khẩu thất bại!"));
				} finally {
					session2.close();
				}

			}
		}
		return "KhachHang/doimatkhau";
	}

	@RequestMapping(value = "phieudat")
	public String phieudat(ModelMap model, HttpSession ss) {

		KhachHang kh = (KhachHang) ss.getAttribute("user");
		model.addAttribute("dsphieudat", this.getds_pdkh(kh.getMaKH()));
		return "KhachHang/phieudat";
	}

	@RequestMapping(value = "phieudat/huy/{id}.html")
	public String huypd(ModelMap model, HttpSession ss) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		model.addAttribute("dsphieudat", this.getds_pdkh(kh.getMaKH()));
		model.addAttribute("idModal", "modalHuy");
		
		return "KhachHang/phieudat";
	}

	@RequestMapping(value = "phieudat/huy/{id}.html", params = "btnHuyPhieu")
	public String huyPhieudat(@PathVariable("id") String maPD, ModelMap model, HttpSession ss,RedirectAttributes redirectAttributes) {
		System.out.println("ok");
		Session session = factory.getCurrentSession();
		PhieuDat pd = (PhieuDat) session.get(PhieuDat.class, maPD);
		pd.setTrangThai(2);
		PhieuDat pdm = pd;
		Session session2 = factory.openSession();
		Transaction t = session2.beginTransaction();
		try {
			session2.merge(pdm);
			t.commit();
			System.out.println("hihivi");
			redirectAttributes.addFlashAttribute("message",new Message("success", "Hủy vé thành công!"));
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
			redirectAttributes.addFlashAttribute("message",new Message("error", "Hủy vé thất bại!"));
		} finally {
			session2.close();
		}
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		model.addAttribute("dsphieudat", this.getds_pdkh(kh.getMaKH()));
		return "redirect:/phieudat.html";
	}

	@RequestMapping("phieudat/chitietphieudat/{id}")
	public String hoadon(@PathVariable("id") String id, ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat where maPD=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		PhieuDat pd = (PhieuDat) query.list().get(0); /* (PhieuDat)session.get(PhieuDat.class, id); */
		System.out.println(pd.getMaPD() + pd.getEmail());
		model.addAttribute("phieudat", pd);

		return "KhachHang/hoadon";
	}

	public List<PhieuDat> getds_pdkh(String maKH) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat where KH.maKH=:maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List<PhieuDat> list = query.list();

		return list;
	}

	public TaiKhoan gettaikhoan(String usern, String mk) {
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

	@ModelAttribute("dsdiadiem")
	public List<DiaDiem> getdsDiaDiem() {
		Session session = factory.getCurrentSession();
		String hql = "from DiaDiem";
		Query query = session.createQuery(hql);
		List<DiaDiem> list = query.list();

		return list;
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

	public List<ChuyenXe> getdsChuyenXe(String ddi, String dden, Date ngaykh) {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe where tuyen.diemDi.maDD=:ddi and tuyen.diemDen.maDD=:dden and ngKH=:ngaykh and trangthai=false and sochotrong!=0";
		Query query = session.createQuery(hql);
		query.setParameter("ddi", ddi);
		query.setParameter("dden", dden);
		query.setParameter("ngaykh", ngaykh);
		List<ChuyenXe> list = query.list();

		return list;
	}

	public List<PhieuDat> getdsphieudatbycx(String maCX) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat where chuyen.maChuyen=:maCX and trangThai!=2";
		Query query = session.createQuery(hql);
		query.setParameter("maCX", maCX);
		List<PhieuDat> list = query.list();

		return list;
	}
	public String hashPass(String matKhau) {
		String hashpw = DigestUtils.md5Hex(matKhau).toUpperCase();
		return hashpw;
	}

}
