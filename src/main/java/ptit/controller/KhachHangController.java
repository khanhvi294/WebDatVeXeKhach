package ptit.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
import ptit.entity.TuyenXe;
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

	@ModelAttribute("tuyenrandom")
	public List<TuyenXe> gettuyenrandom() {
		Session session = factory.getCurrentSession();
		String hql = "from TuyenXe order by newid()";
		Query query = session.createQuery(hql);
		List<TuyenXe> list = query.list();

		List<TuyenXe> res = new ArrayList<TuyenXe>();
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (i == 6) {
					break;
				}

				res.add(list.get(i));
			}
		}

		return res;
	}

	@RequestMapping("trangchu")
	public String index(ModelMap model, HttpSession ss) {
		
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("tkdn");
		if(tk != null) {
			if(!tk.getVaiTro().getMaVT().equals("KH")) {
				return "redirect:/quanly/trangchu.html";
			}
			
		}
		
		return "KhachHang/trangchu";
	}
	
	@RequestMapping("403")
	public String get403(ModelMap model) {
		return "KhachHang/403";
	}

//t??m chuy???n
	@RequestMapping("timchuyen")
	public String timchuyen(ModelMap model, HttpSession ss) {
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("tkdn");
		if(tk != null) {
			if(!tk.getVaiTro().getMaVT().equals("KH")) {
				return "redirect:/quanly/trangchu.html";
			}
			
		}
		
		return "KhachHang/timchuyen";
	}

	@RequestMapping(value = "timchuyen.html", params = "chon")
	public String timchuyenget(@RequestParam("di") String di, @RequestParam("den") String den, ModelMap model) {

		Session session = factory.getCurrentSession();
		String hql = "from TuyenXe where diemDi.maDD=:diemdi and diemDen.maDD=:diemden";
		Query query = session.createQuery(hql);
		query.setParameter("diemdi", di);
		query.setParameter("diemden", den);
		TuyenXe tx = (TuyenXe) query.list().get(0);
		ChuyenXe chuyenxe = new ChuyenXe();
		chuyenxe.setTuyen(tx);
		model.addAttribute("chuyenxe", chuyenxe);

		return "KhachHang/timchuyen";
	}

	ChuyenXe cc = null;
	String refer = "";

	@RequestMapping(value = "chonchuyen", method = RequestMethod.GET)
	public String getChonChuyen(ModelMap model, HttpServletRequest request, RedirectAttributes redirectAttributes) {

		//String referer = request.getHeader("Referer");
		if(refer.trim().isEmpty()) {
			System.out.println("null chon chuyen");
			return "redirect:/trangchu.html";
		}
		String referer = refer.trim();
		if (cc == null) {
			redirectAttributes.addFlashAttribute("message",
					new Message("error", "Kh??ng t??m th???y b???t k?? chuy???n xe n??o m?? b???n mu???n t??m ki???m!"));
			return "redirect:" + refer ;

		}
		ChuyenXe cx = cc;
		String r = referer.substring(referer.lastIndexOf("/") + 1);

		System.out.println(r);
		if (!r.equals("chonghe.html")) {
			System.out.println("hihih");

			List<ChuyenXe> list = this.getdsChuyenXe(cx.getTuyen().getDiemDi().getMaDD(),
					cx.getTuyen().getDiemDen().getMaDD(), cx.getNgKH());
			List<ChuyenXe> listcx = list;
			listcx = list;
			if (listcx.size() == 0) {
				
				redirectAttributes.addFlashAttribute("message",
						new Message("error", "Kh??ng t??m th???y b???t k?? chuy???n xe n??o m?? b???n mu???n t??m ki???m!"));
				return "redirect:" + referer;
			}
			model.addAttribute("dschuyenxe", list);
			Session session = factory.getCurrentSession();
			DiaDiem ddi = (DiaDiem) session.get(DiaDiem.class, cx.getTuyen().getDiemDi().getMaDD());
			DiaDiem dden = (DiaDiem) session.get(DiaDiem.class, cx.getTuyen().getDiemDen().getMaDD());
	
			System.out.println(dden.getDiaDiem());
			System.out.println(ddi.getDiaDiem());
			model.addAttribute("diemdi", ddi.getDiaDiem());
			model.addAttribute("diemden", dden.getDiaDiem());
			
			  final DateFormat df2 = new SimpleDateFormat("dd-MM-yyyy"); 
			  String dateString2 = df2.format(cx.getNgKH());
			
			  model.addAttribute("ngkh",dateString2);
			

		} 
		return "KhachHang/chonchuyen";
	}

//ch???n chuy???n
	@RequestMapping(value = "chonchuyen")
	public String chonchuyen(@ModelAttribute("chuyenxe") ChuyenXe cx, ModelMap model, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		System.out.println(cx.getMaChuyen());
		System.out.println("ihi");
		System.out.println(cx.getTuyen().getDiemDi().getMaDD());
		System.out.println(cx.getTuyen().getDiemDen().getMaDD());
		cc = cx;
		String referer = request.getHeader("Referer");
		System.out.println("chon chuyen " + referer);
		refer = referer;
		String r = referer.substring(referer.lastIndexOf("/") + 1);
		System.out.println(r);
		if (!r.equals("chonghe.html")) {
			System.out.println("hihih");

			List<ChuyenXe> list = this.getdsChuyenXe(cx.getTuyen().getDiemDi().getMaDD(),
					cx.getTuyen().getDiemDen().getMaDD(), cx.getNgKH());
			List<ChuyenXe> listcx = list;
			listcx = list;
			if (listcx.size() == 0) {
				redirectAttributes.addFlashAttribute("chuyenxe",cx);
				System.out.println("chuyenxe k th???y");
				redirectAttributes.addFlashAttribute("message",
						new Message("error", "Kh??ng t??m th???y b???t k?? chuy???n xe n??o m?? b???n mu???n t??m ki???m!"));
				return "redirect:" + referer;
			}
			model.addAttribute("dschuyenxe", list);
			Session session = factory.getCurrentSession();
			DiaDiem ddi = (DiaDiem) session.get(DiaDiem.class, cx.getTuyen().getDiemDi().getMaDD());
			DiaDiem dden = (DiaDiem) session.get(DiaDiem.class, cx.getTuyen().getDiemDen().getMaDD());
			System.out.println(dden.getDiaDiem());
			System.out.println(ddi.getDiaDiem());
			model.addAttribute("diemdi", ddi.getDiaDiem());
			model.addAttribute("diemden", dden.getDiaDiem());
			final DateFormat df2 = new SimpleDateFormat("dd-MM-yyyy");
			 String dateString2 = df2.format(cx.getNgKH());
			model.addAttribute("ngkh", dateString2);

		} 

		return "KhachHang/chonchuyen";
	}

//ch???n gh???
	@RequestMapping(value = "chonghe")
	public String chonghe(HttpServletRequest request, HttpSession ss, ModelMap model,
			@ModelAttribute("dschuyenxe") List<ChuyenXe> dscx, RedirectAttributes redirectAttributes,
			@ModelAttribute("diemdi") String diemdi, @ModelAttribute("diemden") String diemden) {

		
		String referer = request.getHeader("Referer");
		System.out.println("chon ghe " + referer);
		if (referer == null) {
			return "redirect:/chonchuyen.html";
		}
		String r = referer.substring(referer.lastIndexOf("/") + 1);

		if (r.equals("chonchuyen.html")) {

			PhieuDat pd = new PhieuDat();
			pd.setMaPD(taoMa("PD", "PhieuDat", "maPD"));
			pd.setTrangThai(0);
			KhachHang kh = (KhachHang) ss.getAttribute("user");
			pd.setKH(kh);
			String machuyen = request.getParameter("machuyen");
			if (machuyen == null) {
				redirectAttributes.addFlashAttribute("message", "Vui l??ng ch???n chuy???n xe!");
				redirectAttributes.addFlashAttribute("dschuyenxe", dscx);
				redirectAttributes.addFlashAttribute("diemdi", diemdi);
				redirectAttributes.addFlashAttribute("diemden", diemden);
				return "redirect:chonchuyen.html";
			}
			Session session = factory.getCurrentSession();
			ChuyenXe cx = (ChuyenXe) session.get(ChuyenXe.class, machuyen);
			this.cx = cx;
			/*
			 * Integer socho = cx.getXekhach().getLx().getSeat(); Integer phannguyen = socho
			 * / 6; Integer phandu = socho % 6; request.setAttribute("phannguyen",
			 * phannguyen.toString()); request.setAttribute("phandu", phandu.toString());
			 */
			pd.setChuyen(this.cx);
			pd.setTongtien(new BigDecimal(0));
			ss.setAttribute("PhieuDat", pd);
		}
	
		Integer socho =  this.cx.getXekhach().getLx().getSeat();
		Integer phannguyen = socho / 6;
		Integer phandu = socho % 6;
		request.setAttribute("phannguyen", phannguyen.toString());
		request.setAttribute("phandu", phandu.toString());
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(this.cx.getMaChuyen());
		List<PhieuDat> dspd = getdsphieudatbycx(this.cx.getMaChuyen());
		System.out.println("s1");
		for (PhieuDat phieudat : dspd) {
			for (VeXe ve : phieudat.getVexe()) {
				String soghe = ve.getId().getSoGhe();
				map.put(soghe, "disabled");
			}
		}
	

		model.addAttribute("map", map);
		System.out.println("s2");
		return "KhachHang/chonghe";

	}

// ??i???n th??ng tin
	@RequestMapping(value = "dienthongtin")
	public String dienthongtin(ModelMap model, HttpServletRequest request, HttpSession ss,
			RedirectAttributes redirectAttributes) {
		
		
		
		String referer = request.getHeader("Referer");
		System.out.println("dien thong tin " + referer);
		if(referer == null) {
			return "redirect:/chonghe.html";
		}
		
		String r = referer.substring(referer.lastIndexOf("/") + 1);
		if (r.equals("chonghe.html")) {
			String[] dsghe = request.getParameterValues("ghe");
			if (dsghe == null) {
				redirectAttributes.addFlashAttribute("message", new Message("error", "Vui l??ng ch???n gh???!"));

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

//thanh to??n

	@RequestMapping(value = "thanhtoan")
	public String thanhtoan(@ModelAttribute("phieudat") PhieuDat pd, HttpSession ss, ModelMap model,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		String referer = request.getHeader("Referer");
		
		if(referer == null) {
			return "redirect:/chonghe.html";
		}
		boolean check = false;

		if (pd.getSdt().length() != 10) {
			redirectAttributes.addFlashAttribute("ersdt", "Vui l??ng nh???p ????ng ?????nh d???ng s??? ??i???n tho???i!");
			check = true;
		}
		if (!pd.getSdt().trim().matches("^[0-9]*$") || pd.getSdt().length() != 10) {
			redirectAttributes.addFlashAttribute("ersdt", "Vui l??ng nh???p ????ng ?????nh d???ng s??? ??i???n tho???i!");
			check = true;
		}
		if (!pd.getEmail().trim().matches(
				"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			redirectAttributes.addFlashAttribute("eremail", "Vui l??ng nh???p ????ng ?????nh d???ng email!");
			check = true;
		}
		if (pd.getSdt().length() == 0) {
			redirectAttributes.addFlashAttribute("ersdt", "D??? li???u n??y kh??ng ???????c ????? tr???ng!");

			check = true;
		}
		if (pd.getEmail().isEmpty()) {
			redirectAttributes.addFlashAttribute("eremail", "D??? li???u n??y kh??ng ???????c ????? tr???ng!");
			check = true;
		}
		if (request.getParameter("dongy") == null) {
			redirectAttributes.addFlashAttribute("message", "Vui l??ng ?????ng ?? ??i???u kho???n ????? ti???p t???c!");
			check = true;
		}

		if (check) {

			redirectAttributes.addFlashAttribute("phieudat", pd);
			redirectAttributes.addFlashAttribute("message", new Message("error", "Vui l??ng ?????ng ?? v???i ??i???u kho???n!"));
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
		double d = pd.getChuyen().getGia().doubleValue();
		
		pd.setTongtien(new BigDecimal((dsve.size())*d));
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pd);
			for (VeXe ve : dsve) {
				session.save(ve);
			}
			System.out.println(dsve.size());
			t.commit();
			giamchotrong(pd.getChuyen().getMaChuyen(),dsve.size());
			
			model.addAttribute("message", new Message("success", "?????t v?? th??nh c??ng!"));
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", new Message("error", "?????t v?? th???t b???i!"));
			System.out.println(e.getCause());
		} finally {
			session.close();
		}

		return "KhachHang/trangchu";
	}

	public List<TuyenXe> getdstuyenbyddi(String ddi) {
		Session session = factory.getCurrentSession();
		String hql ="from TuyenXe as tuyen where tuyen.diemDi.maDD =:ddi";
		Query query = session.createQuery(hql);
		query.setParameter("ddi", ddi);
		List<TuyenXe> list = query.list();
		if(list.size()==0) {
			return null;
		}
		return list;
		
	}
	public List<DiaDiem> getdsmadiadiem(){
		Session session = factory.getCurrentSession();
		String hql ="from DiaDiem";
		Query query = session.createQuery(hql);
		List<DiaDiem> list = query.list();
		if(list.size()==0) {
			return null;
		}
		return list;
	}
	//cactuyen
	@RequestMapping("danhsachtuyen")
	public String cactuyen(ModelMap model, HttpSession ss) {
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("tkdn");
		if(tk != null) {
			if(!tk.getVaiTro().getMaVT().equals("KH")) {
				return "redirect:/quanly/trangchu.html";
			}
			
		}
		List<DiaDiem> dsdd = getdsmadiadiem();
		model.addAttribute("diadiem",dsdd);
		
		return "KhachHang/danhsachtuyen";
		
	}
	
	
	/// account
	@RequestMapping("thongtincanhan")
	public String canhan(ModelMap model, HttpSession ss) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");	
		model.addAttribute("khachhang", kh);
		return "KhachHang/thongtincanhan";
	}

	@RequestMapping(value = "thongtincanhan", method = RequestMethod.POST)
	public String ttcanhan(HttpSession sess, @ModelAttribute("khachhang") KhachHang khachhang, BindingResult errors,
			ModelMap model) {
		System.out.println(khachhang.getMaKH());
		if (khachhang.getHoKH().isEmpty()) {
			errors.rejectValue("hoKH", "KhachHang", "D??? li???u kh??ng ???????c ????? tr???ng!");
		}
		if (khachhang.getTenKH().isEmpty()) {
			errors.rejectValue("tenKH", "KhachHang", "D??? li???u kh??ng ???????c ????? tr???ng!");
		}
		if (khachhang.getTkkh().getEmail().isEmpty()) {
			errors.rejectValue("tkkh.email", "KhachHang", "D??? li???u kh??ng ???????c ????? tr???ng!");
		}
		if (!khachhang.getTkkh().getEmail().trim().matches(
				"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			errors.rejectValue("tkkh.email", "KhachHang", "Vui l??ng nh???p ????ng ?????nh d???ng email!");
		}
		if (khachhang.getSdt().isEmpty()) {
			errors.rejectValue("sdt", "KhachHang", "D??? li???u kh??ng ???????c ????? tr???ng!");
		}
		if (khachhang.getNgSinh() == null) {
			errors.rejectValue("ngSinh", "KhachHang", "D??? li???u kh??ng ???????c ????? tr???ng!");
		}
		if (!khachhang.getSdt().trim().matches("^[0-9]*$") || khachhang.getSdt().length() != 10) {
			errors.rejectValue("sdt", "KhachHang", "Vui l??ng nh???p ????ng ?????nh d???ng s??? ??i???n tho???i!");
		}

		if (khachhang.getNgSinh().after(new Date())) {
			errors.rejectValue("ngSinh", "KhachHang", "Ng??y sinh ph???i b?? h??n ng??y hi???n t???i!");
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
				sess.setAttribute("tkdn", tk);
				model.addAttribute("message", new Message("success", "C???p nh???t th??ng tin th??nh c??ng"));
			} catch (Exception e) {
				System.out.println(e);
				System.out.println(e.getCause());
				t.rollback();
				model.addAttribute("message", new Message("error", "C???p nh???t th??ng tin th???t b???i!"));
			} finally {
				session.close();
			}

			return "KhachHang/thongtincanhan";
		}
		return "KhachHang/thongtincanhan";

	}

//?????i m???t kh???u
	@RequestMapping("matkhau")
	public String doimk() {
		return "KhachHang/doimatkhau";
	}

	@RequestMapping(value = "matkhau", method = RequestMethod.POST)
	public String doimatkhau(HttpSession ss, @RequestParam("cpassword") String PW,
			@RequestParam("npassword") String nPW, @RequestParam("rnpassword") String rnPW, ModelMap model) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		System.out.println(kh.getTenKH());
		Session session = factory.getCurrentSession();
		TaiKhoan tkkh = (TaiKhoan) session.get(TaiKhoan.class, kh.getTkkh().getUserName());

		boolean check = false;
		if (PW.isEmpty()) {
			model.addAttribute("message1", "D??? li???u kh??ng ???????c ????? tr???ng!");
			check = true;
		}
		if (nPW.isEmpty()) {
			model.addAttribute("message2", "D??? li???u kh??ng ???????c ????? tr???ng!");
			check = true;
		}
		if (rnPW.isEmpty()) {
			model.addAttribute("message3", "D??? li???u kh??ng ???????c ????? tr???ng!");
			check = true;
		}

		if (check) {
			return "KhachHang/doimatkhau";
		}

		String matkhau = hashPass(PW);
		if (tkkh.getMatKhau().equals(matkhau) == false) {
			model.addAttribute("message1", "Sai m???t kh???u!");
		} else {
			if (nPW.equals(rnPW) == false) {
				model.addAttribute("message3", "M???t kh???u kh??ng tr??ng kh???p!");
			} else {
				Session session2 = factory.openSession();
				Transaction t = session2.beginTransaction();
				String matkhaumoi = hashPass(nPW);
				tkkh.setMatKhau(matkhaumoi);
				try {
					session2.update(tkkh);
					t.commit();
					model.addAttribute("message", new Message("success", "?????i m???t kh???u th??nh c??ng!"));
					kh.setTkkh(tkkh);
					ss.setAttribute("user", kh);
					ss.setAttribute("tkdn", tkkh);
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message", new Message("error", "?????i m???t kh???u th???t b???i!"));
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
	public String huypd(ModelMap model, HttpSession ss, @PathVariable("id") String id) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		model.addAttribute("dsphieudat", this.getds_pdkh(kh.getMaKH()));
		model.addAttribute("idModal", "modalHuy");
		model.addAttribute("idhuy",id );
		
		return "KhachHang/phieudat";
	}

	@RequestMapping(value = "phieudat/huy/{id}.html", params = "btnHuyPhieu")
	public String huyPhieudat(@PathVariable("id") String maPD, ModelMap model, HttpSession ss,
			RedirectAttributes redirectAttributes) {
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
			tangchotrong(pdm.getChuyen().getMaChuyen(),getslvebypd(pdm.getMaPD()));
			redirectAttributes.addFlashAttribute("message", new Message("success", "H???y v?? th??nh c??ng!"));
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
			redirectAttributes.addFlashAttribute("message", new Message("error", "H???y v?? th???t b???i!"));
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
		System.out.println(pd.getVexe().size());
		model.addAttribute("soluong", pd.getVexe().size());

		return "KhachHang/hoadon";
	}

	public List<PhieuDat> getds_pdkh(String maKH) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat as pd where pd.KH.maKH=:maKH order by pd.maPD desc";
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

	// t???o m?? t??? ?????ng
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
		String hql = "from ChuyenXe where tuyen.diemDi.maDD=:ddi and tuyen.diemDen.maDD=:dden and ngKH=:ngaykh and trangthai=0 and sochotrong!=0";
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

	public int giamchotrong(String machuyen,int sl) {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe where maChuyen=:machuyen";
		Query query = session.createQuery(hql);
		query.setParameter("machuyen", machuyen);
		int sochotrong=0;
		List<ChuyenXe> dscx = query.list();
		if(dscx!=null) {
			ChuyenXe chuyenxe = dscx.get(0);
			int sct = chuyenxe.getSochotrong();
			chuyenxe.setSochotrong(sct-sl);
			sochotrong = chuyenxe.getSochotrong();
			System.out.println(sochotrong);
		}
		return sochotrong;
	}
	public int tangchotrong(String machuyen,int sl) {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe where maChuyen=:machuyen";
		Query query = session.createQuery(hql);
		query.setParameter("machuyen", machuyen);
		int sochotrong=0;
		List<ChuyenXe> dscx = query.list();
		if(dscx!=null) {
			ChuyenXe chuyenxe = dscx.get(0);
			int sct = chuyenxe.getSochotrong();
			chuyenxe.setSochotrong(sct+sl);
			sochotrong = chuyenxe.getSochotrong();
			System.out.println(sochotrong);
		}
		return sochotrong;
	}
	public int getslvebypd(String mapd){
		Session session = factory.getCurrentSession();
		String hql = "from VeXe where id.pd=:mapd";
		Query query = session.createQuery(hql);
		query.setParameter("mapd", mapd);
		List<VeXe> list = query.list();
		return list.size();
	}
	public String hashPass(String matKhau) {
		String hashpw = DigestUtils.md5Hex(matKhau).toUpperCase();
		return hashpw;
	}

}
