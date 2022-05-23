package ptit.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

//tìm chuyến
	@RequestMapping("timchuyen")
	public String timchuyen(ModelMap model) {

		return "KhachHang/timchuyen";
	}

//chọn chuyến
	@RequestMapping(value = "chonchuyen", method = RequestMethod.POST)
	public String chonchuyen(@ModelAttribute("chuyenxe") ChuyenXe cx, ModelMap model) {

		model.addAttribute("dschuyenxe", this.getdsChuyenXe(cx.getTuyen().getDiemDi().getMaDD(),
				cx.getTuyen().getDiemDen().getMaDD(), cx.getNgKH()));

		return "KhachHang/chonchuyen";
	}

//chọn ghế
	@RequestMapping(value = "chonghe", method = RequestMethod.POST)
	public String chonghe(HttpServletRequest request, HttpSession ss, ModelMap model) {

		PhieuDat pd = new PhieuDat();
		pd.setMaPD(taoMa("PD", "PhieuDat", "maPD"));
		pd.setTrangThai(0);
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		pd.setKH(kh);
		String machuyen = request.getParameter("machuyen");
		Session session = factory.getCurrentSession();
		ChuyenXe cx = (ChuyenXe) session.get(ChuyenXe.class, machuyen);
		this.cx = cx;
		pd.setChuyen(this.cx);
		pd.setTongtien(new BigDecimal(0));
		ss.setAttribute("PhieuDat", pd);

		return "KhachHang/chonghe";

	}

// điền thông tin
	@RequestMapping(value = "dienthongtin", method = RequestMethod.POST)
	public String dienthongtin(ModelMap model, HttpServletRequest request, HttpSession ss) {
		String[] dsghe = request.getParameterValues("ghe");
		dsve = new ArrayList<VeXe>();

		for (String ghe : dsghe) {
			VeXe vexe = new VeXe();
			VeXePK id = new VeXePK();
			id.setSoGhe(ghe);
			id.setPd(((PhieuDat) ss.getAttribute("PhieuDat")).getMaPD());
			vexe.setId(id);
			dsve.add(vexe);
		}

		model.addAttribute("phieudat", new PhieuDat());

		return "KhachHang/dienthongtin";
	}

//thanh toán

	@RequestMapping(value = "thanhtoan", method = RequestMethod.POST)
	public String thanhtoan(@ModelAttribute("phieudat") PhieuDat pd, HttpSession ss, ModelMap model) {

		PhieuDat pdss = (PhieuDat) ss.getAttribute("PhieuDat");
		pdss.setEmail(pd.getEmail());
		pdss.setSdt(pd.getSdt());
		ss.setAttribute("PhieuDat", pdss);
		model.addAttribute("chuyenxe", cx);
		model.addAttribute("dsve", dsve);

		return "KhachHang/thanhtoan";
	}

	@RequestMapping(value = "trangchu", params = "btnDatVe", method = RequestMethod.POST)
	public String datve(HttpSession ss, HttpServletRequest request, ModelMap model) {
		PhieuDat pd = (PhieuDat) ss.getAttribute("PhieuDat");
		System.out.println(pd.getMaPD());
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
			model.addAttribute("message", "Đặt vé thành công!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Đặt vé thất bại!");
			System.out.println(e.getCause());
		} finally {
			session.close();
		}

		return "KhachHang/trangchu";
	}

	public List<ChuyenXe> getdsChuyenXe(String ddi, String dden, Date ngaykh) {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe where tuyen.diemDi.maDD=:ddi and tuyen.diemDen.maDD=:dden and ngKH=:ngaykh";
		Query query = session.createQuery(hql);
		query.setParameter("ddi", ddi);
		query.setParameter("dden", dden);
		query.setParameter("ngaykh", ngaykh);
		List<ChuyenXe> list = query.list();

		return list;
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

	/// account
	@RequestMapping("thongtincanhan")
	public String canhan(ModelMap model, HttpSession ss) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		model.addAttribute("khachhang", kh);
		return "KhachHang/thongtincanhan";
	}

	@RequestMapping(value = "thongtincanhan", method = RequestMethod.POST)
	public String ttcanhan(@ModelAttribute("khachhang") KhachHang khachhang) {
		System.out.println(khachhang.getMaKH());
		Session ss = factory.getCurrentSession();

		TaiKhoan tk = (TaiKhoan) ss.get(TaiKhoan.class, khachhang.getTkkh().getUserName());

		KhachHang khachhangcu = (KhachHang) ss.get(KhachHang.class, khachhang.getMaKH());
		System.out.println(khachhangcu.getMaKH() + " " + khachhangcu.getHoKH());
		tk.setEmail(khachhang.getTkkh().getEmail());
		System.out.println("hihi "+tk.getUserName());

		khachhangcu.getTkkh().setEmail(khachhang.getTkkh().getEmail());
		khachhang.setMaKH(khachhangcu.getMaKH());
		khachhang.setTkkh(khachhangcu.getTkkh());
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(tk); 
			
			session.merge(khachhang);
			
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println(e.getCause());
			t.rollback();
		} finally {
			session.close();
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
		if (tkkh.getMatKhau().equals(PW) == false) {
			model.addAttribute("message", "Sai mật khẩu!");
		} else {
			if (nPW.equals(rnPW) == false) {
				model.addAttribute("message2", "Mật khẩu không trùng khớp!");
			} else {
				Session session2 = factory.openSession();
				Transaction t = session2.beginTransaction();
				tkkh.setMatKhau(nPW);
				try {
					session2.update(tkkh);
					t.commit();
					model.addAttribute("message3", "Đổi mật khẩu thành công!");
				} catch (Exception e) {
					t.rollback();
				} finally {
					session2.close();
				}

			}
		}
		return "KhachHang/doimatkhau";
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
	@RequestMapping(value="phieudat")
	public String phieudat(ModelMap model,HttpSession ss) {
		
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		 model.addAttribute("dsphieudat", this.getds_pdkh(kh.getMaKH()));
		return "KhachHang/phieudat";
	}
	
	@RequestMapping(value="phieudat/huy/{id}.html")
	public String huypd(ModelMap model,HttpSession ss) {
		KhachHang kh = (KhachHang) ss.getAttribute("user");
		 model.addAttribute("dsphieudat", this.getds_pdkh(kh.getMaKH()));
		 model.addAttribute("idModal", "modalHuy");
		return "KhachHang/phieudat";
	}
	@RequestMapping(value = "phieudat/huy/{id}.html",params="btnHuyPhieu")
	public String huyPhieudat(@PathVariable("id") String maPD,ModelMap model,HttpSession ss){
		System.out.println("ok");
		Session session =  factory.getCurrentSession();
		PhieuDat pd = (PhieuDat)session.get(PhieuDat.class, maPD);
		pd.setTrangThai(2);
		PhieuDat pdm = pd;
		Session session2 = factory.openSession();
		Transaction t = session2.beginTransaction();
		 try {
			 session2.update(pdm);
			 t.commit();
		 }catch(Exception e) {
			 t.rollback();
			 System.out.println(e);
		 }finally {
			 session2.close();
		 }
		 KhachHang kh = (KhachHang) ss.getAttribute("user");
		 model.addAttribute("dsphieudat", this.getds_pdkh(kh.getMaKH()));
		return "redirect:/phieudat.html";
	}
	@RequestMapping("hoadon")
	public String hoadon() {
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
}
