package ptit.controller;

import java.math.BigDecimal;
import java.sql.Time;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import ptit.entity.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
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

@Controller
@Transactional
@RequestMapping("quanly")
public class QuanLyController {
	@Autowired
	SessionFactory factory;
	
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
			System.out.println(pkTemp);
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
	
	public List<ChuyenXe> dscx() {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe";
		Query query = session.createQuery(hql);
		List<ChuyenXe> list = query.list();
		return list;
	}
	
	public List<TuyenXe> dstx() {
		Session session = factory.getCurrentSession();
		String hql = "from TuyenXe";
		Query query = session.createQuery(hql);
		List<TuyenXe> list = query.list();
		return list;
	}
	
	public List<TuyenXe> dstxhd() {
		Session session = factory.getCurrentSession();
		String hql = "from TuyenXe where trangThai = 'True'";
		Query query = session.createQuery(hql);
		List<TuyenXe> list = query.list();
		return list;
	}

	public List<NhanVien> dsnv() {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		return list;
	}

	public List<XeKhach> dsxk() {
		Session session = factory.getCurrentSession();
		String hql = "from XeKhach";
		Query query = session.createQuery(hql);
		List<XeKhach> list = query.list();
		return list;
	}

	public List<DiaDiem> dsdd() {
		Session session = factory.getCurrentSession();
		String hql = "from DiaDiem";
		Query query = session.createQuery(hql);
		List<DiaDiem> list = query.list();
		return list;
	}
	
	public List<LoaiXe> dslx() {
		Session session = factory.getCurrentSession();
		String hql = "from LoaiXe";
		Query query = session.createQuery(hql);
		List<LoaiXe> list = query.list();
		return list;
	}
	public List<KhachHang> dskh(){
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		return list;
	}
	
	public List<BangGia> dsbg(){
		Session session = factory.getCurrentSession();
		String hql = "FROM BangGia";
		Query query = session.createQuery(hql);
		List<BangGia> list = query.list();
		return list;
	}
	
	public List<PhieuDat> dspd(){
		Session session = factory.getCurrentSession();
		String hql = "FROM PhieuDat";
		Query query = session.createQuery(hql);
		List<PhieuDat> list = query.list();
		return list;
	}
	
	public BangGia bgtheoid(String matuyen, String LoaiXe) {
		Session session = factory.getCurrentSession();
		String hql = "from BangGia where Tuyen = '" + matuyen + "' and loaixe = '" + LoaiXe + "'";
		Query query = session.createQuery(hql);
		List<BangGia> list = query.list();
		return list.get(0);
	}
	
	public ChuyenXe xetheoid(String machuyen) {
		Session session = factory.getCurrentSession();
		ChuyenXe chuyen = (ChuyenXe) session.load(ChuyenXe.class, machuyen);
		return chuyen;
	}

	public TuyenXe tuyentheoid(String ma) {
		Session session = factory.getCurrentSession();
		TuyenXe tuyen = (TuyenXe) session.load(TuyenXe.class, ma);
		return tuyen;

	}
	
	public VaiTro vaitrotheoid(String ma) {
		Session session = factory.getCurrentSession();
		VaiTro vt = (VaiTro) session.load(VaiTro.class, ma);
		return vt;

	}
	
	public KhachHang khtheoid(String ma) {
		Session session = factory.getCurrentSession();
		KhachHang kh = (KhachHang) session.load(KhachHang.class, ma);
		return kh;

	}
	
	public LoaiXe lxtheoid(String ma) {
		Session session = factory.getCurrentSession();
		LoaiXe lx = (LoaiXe) session.load(LoaiXe.class, ma);
		return lx;

	}
	
	public XeKhach xekhachtheoid(String ma) {
		Session session = factory.getCurrentSession();
		XeKhach xe = (XeKhach) session.load(XeKhach.class, ma);
		return xe;
	}

	public DiaDiem diadiemtheoid(String ma) {
		Session session = factory.getCurrentSession();
		DiaDiem dd = (DiaDiem) session.load(DiaDiem.class, ma);
		return dd;
	}

	public NhanVien nvtheoid(String ma) {
		Session session = factory.getCurrentSession();
		NhanVien nv = (NhanVien) session.load(NhanVien.class, ma);
		return nv;
	}
	
	public BigDecimal layGia(String matuyen, String LoaiXe) {
		Session session = factory.getCurrentSession();
		String hql = "from BangGia where Tuyen = '" + matuyen + "' and loaixe = '" + LoaiXe + "'";
		Query query = session.createQuery(hql);
		List<BangGia> list = query.list();
		BigDecimal gia = list.get(0).getGia();
		return  gia;
	}
	
	public TaiKhoan tktheousername(String ma) {
		Session session = factory.getCurrentSession();
		TaiKhoan tk = (TaiKhoan) session.load(TaiKhoan.class, ma);
		return tk;
	}
	
	public PhieuDat phieudattheoma(String ma) {
		Session session = factory.getCurrentSession();
		PhieuDat pd = (PhieuDat) session.load(PhieuDat.class, ma);
		return pd;
	}
	
	public List<VeXe> vexetheomapd(String ma) {
		Session session = factory.getCurrentSession();
		String hql = "from VeXe where pd = '" + ma + "'";
		Query query = session.createQuery(hql);
		List<VeXe> list = query.list();
		return list;
	}
	
	@RequestMapping(value = "trangchu")
	public String TrangChu() {
		return "QuanLy/trangchu";
	}

	@RequestMapping("chuyenxe")
	public String ChuyenXe(ModelMap model) {
		List<ChuyenXe> list = dscx();
		model.addAttribute("list", list);
		model.addAttribute("chuyenxe", new ChuyenXe());
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "chuyenxe/{machuyen}", params = "info")
	public String ChuyenXeInfo(ModelMap model, @PathVariable("machuyen") String ma) {
		model.addAttribute("idModal", "modalShow");
		List<ChuyenXe> list = dscx();
		ChuyenXe chuyen = xetheoid(ma);
		model.addAttribute("list", list);
		model.addAttribute("chuyen", chuyen);
		model.addAttribute("chuyenxe", new ChuyenXe());
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "chuyenxe/{machuyen}", params = "update", method = RequestMethod.GET)
	public String ChuyenXeUpdate(ModelMap model, @PathVariable("machuyen") String ma) {
		ChuyenXe chuyen = xetheoid(ma);
		model.addAttribute("idModal", "modalUpdate");
		List<ChuyenXe> listcx = dscx();
		model.addAttribute("list", listcx);
		List<TuyenXe> listtx = dstxhd();
		for (int i = 0; i < listtx.size(); i++) {
			if (listtx.get(i).getMaTuyen().equals(chuyen.getTuyen().getMaTuyen())) {
				listtx.remove(i);
				break;
			}
		}
		
		List<XeKhach> listxk = dsxk();
		for (int i = 0; i < listxk.size(); i++) {
			if (listxk.get(i).getBienXe().equals(chuyen.getXekhach().getBienXe())) {
				listxk.remove(i);
				break;
			}
		}
		model.addAttribute("listxk", listxk);
		model.addAttribute("listtx", listtx);
		model.addAttribute("chuyenxe", chuyen);
		return "QuanLy/chuyenxe";
	}


	/*
	 * @RequestMapping(value = "/chuyenxe/{machuyen}", params = "update", method =
	 * RequestMethod.POST) public String ChuyenXeUpdate(ModelMap
	 * model, @PathVariable("machuyen") String ma,HttpServletRequest request) {
	 * Session session = factory.openSession();
	 * 
	 * Transaction transaction = session.beginTransaction();
	 * 
	 * try { d1 = sdf.parse("00:00"); } catch (ParseException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } Time t1 = new
	 * Time(d1.getTime()); int a=0; for(int i=0;i<list.size();i++) {
	 * if(list.get(i).getTgKh().compareTo(t1)>=0) { t1 = list.get(i).getTgKh(); a =
	 * i; } }
	 * 
	 * return list.get(a); }
	 */
	
	
	@RequestMapping(value = "/chuyenxe/{machuyen}", params = "update", method = RequestMethod.POST)
	public String ChuyenXeUpdate(ModelMap model, @PathVariable("machuyen") String ma,HttpServletRequest request, BindingResult errors) {
//		SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");
//		Date d = sdf1.parse(request.getParameter("tgKH"));
//		Time t1 = new Time(d.getTime());
//		Date d2 = sdf1.parse("04:00");
//		Time t2 = new Time(d2.getTime());
//		
	ChuyenXe chuyen =xetheoid(ma);
//		if(request.getParameter("ngKH") == "") {
//			errors.rejectValue("ngKH", "chuyen", "NgÃ y ThÃ¡ng KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
//		}
//		if(request.getParameter("thoigian") == "") {
//			errors.rejectValue("tgKh", "chuyen", "Thá»�i Gian KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
//		}
//		if(chuyen.get.equals(CheckChuyenXe(ma).getTuyen().getDiemDen().getMaDD()) ) {
//			
//		}
//		if(t1.compareTo(CheckChuyenXe(ma).getTgKh() + CheckChuyenXe(ma).getTuyen().getTgchay() + t2)<0)
		if(errors.hasErrors()) {
			chuyen = xetheoid(ma);
			model.addAttribute("idModal", "modalUpdate");
			List<ChuyenXe> listcx = dscx();
			model.addAttribute("list", listcx);
			List<TuyenXe> listtx = dstxhd();
			for (int i = 0; i < listtx.size(); i++) {
				if (listtx.get(i).getMaTuyen().equals(chuyen.getTuyen().getMaTuyen())) {
					listtx.remove(i);
					break;
				}
			}
			
			List<XeKhach> listxk = dsxk();
			for (int i = 0; i < listxk.size(); i++) {
				if (listxk.get(i).getBienXe().equals(chuyen.getXekhach().getBienXe())) {
					listxk.remove(i);
					break;
				}
			}
			model.addAttribute("listxk", listxk);
			model.addAttribute("listtx", listtx);
			return "QuanLy/chuyenxe";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				chuyen = xetheoid(ma);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngKH"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				chuyen.setNgKH(sql);
				SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
				Date d1 = sdf.parse(request.getParameter("tgKH"));
				chuyen.setTgKh(new Time(d1.getTime()));
				chuyen.setTuyen(tuyentheoid(request.getParameter("tuyenxe")));
				chuyen.setXekhach(xekhachtheoid(request.getParameter("xekhach")));
				XeKhach xk = xekhachtheoid(chuyen.getXekhach().getBienXe());
				BigDecimal gia = layGia(chuyen.getTuyen().getMaTuyen(), xk.getLx().getMaLX());
				session.update(chuyen);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}


			return "redirect: /CNPM/quanly/chuyenxe.html";
		}

	}

	@RequestMapping(value = "chuyenxe/insert", method = RequestMethod.GET)
	public String ChuyenXeInsert(ModelMap model) {
		System.out.println("l3333oi");
		model.addAttribute("idModal", "modalCreate");
		List<ChuyenXe> listcx = dscx();
		List<TuyenXe> listtx = dstxhd();
		List<NhanVien> listnv = dsnv();
		List<XeKhach> listxk = dsxk();
		Map<String, String> tenXK = new HashMap<>();
		for(int i = 0;i<listtx.size();i++) {
			tenXK.put(listtx.get(i).getMaTuyen(), listtx.get(i).getDiemDi().getDiaDiem() + " - " + listtx.get(i).getDiemDen().getDiaDiem());
		}
		model.addAttribute("listtemp", tenXK);
		model.addAttribute("listnv", listnv);
		model.addAttribute("listxk", listxk);
		model.addAttribute("listtx", listtx);
		model.addAttribute("list", listcx);
		ChuyenXe chuyen = new ChuyenXe();
		chuyen.setMaChuyen(taoMa("CX","ChuyenXe","maChuyen"));
		model.addAttribute("chuyenxe", chuyen);
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "chuyenxe/insert", method = RequestMethod.POST)
	public String ChuyenXeInsertpost(ModelMap model, @ModelAttribute("chuyenxe") ChuyenXe chuyen,HttpServletRequest request, BindingResult errors) {
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = null;
		try {
			parsed = format.parse(request.getParameter("ngKH"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		java.sql.Date sql = new java.sql.Date(parsed.getTime());
		if(request.getParameter("ngKH") == "") {
			errors.rejectValue("ngKH", "chuyen", "NgÃ y ThÃ¡ng KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}else if(sql.compareTo(date)<0) {
			errors.rejectValue("ngKH", "chuyen", "NgÃ y ThÃ¡ng KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Nhá»� HÆ¡n NgÃ y Hiá»‡n Táº¡i");
		}
		if(request.getParameter("thoigian") == "") {
			errors.rejectValue("tgKh", "chuyen", "Thá»�i Gian KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(errors.hasErrors()) {
			System.out.println("l3333oi");
			model.addAttribute("idModal", "modalCreate");
			List<ChuyenXe> listcx = dscx();
			List<TuyenXe> listtx = dstxhd();
			List<NhanVien> listnv = dsnv();
			List<XeKhach> listxk = dsxk();
			Map<String, String> tenXK = new HashMap<>();
			for(int i = 0;i<listtx.size();i++) {
				tenXK.put(listtx.get(i).getMaTuyen(), listtx.get(i).getDiemDi().getDiaDiem() + " - " + listtx.get(i).getDiemDen().getDiaDiem());
			}
			model.addAttribute("listtemp", tenXK);
			model.addAttribute("listnv", listnv);
			model.addAttribute("listxk", listxk);
			model.addAttribute("listtx", listtx);
			model.addAttribute("list", listcx);
			chuyen.setMaChuyen(taoMa("CX","ChuyenXe","maChuyen"));
			return "QuanLy/chuyenxe";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			System.out.println("lo123i");
			try {
//				ChuyenXe xe = new ChuyenXe();
//				xe.setMaChuyen(request.getParameter("MaChuyen"));
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				Date parsed = format.parse(request.getParameter("ngKH"));
//				java.sql.Date sql = new java.sql.Date(parsed.getTime());
//				xe.setNgKH(sql);
//				SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
//				Date d1 = sdf.parse(request.getParameter("tgKH"));
//				xe.setTgKh(new Time(d1.getTime()));
//				xe.setTuyen(tuyentheoid(request.getParameter("tuyenxe")));
//				xe.setXekhach(xekhachtheoid(request.getParameter("xekhach")));
//				xe.setNv(nvtheoid(request.getParameter("nhanvien")));
//				xe.setGia(Float.parseFloat(request.getParameter("money")));
				chuyen.setMaChuyen(taoMa("CX","ChuyenXe","maChuyen"));
				chuyen.setTrangthai(false);
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				Date parsed = format.parse(request.getParameter("ngKH"));
//				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				chuyen.setNgKH(sql);
				XeKhach xk = xekhachtheoid(chuyen.getXekhach().getBienXe());
				BigDecimal gia = layGia(chuyen.getTuyen().getMaTuyen(), xk.getLx().getMaLX());
				SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
				Date d1 = sdf.parse(request.getParameter("thoigian"));
				chuyen.setTgKh(new Time(d1.getTime()));
				chuyen.setGia(gia);
				chuyen.setSochotrong(36);
				session.save(chuyen);
				transaction.commit();
				System.out.println(chuyen.getNgKH());
				System.out.println(xk.getLx());
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}
			finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/chuyenxe.html";
			
			
		}
		
	}

	@RequestMapping("/tuyenxe")
	public String TuyenXe(ModelMap model) {
		List<TuyenXe> list = dstx();
		model.addAttribute("list", list);
		model.addAttribute("tuyen", new TuyenXe());
		return "QuanLy/tuyenxe";
	}

	@RequestMapping(value = "/tuyenxe/insert", method = RequestMethod.GET)
	public String TuyenXeInsert(ModelMap model) {
		List<TuyenXe> list = dstx();
		model.addAttribute("list", list);
		model.addAttribute("idModal", "modalCreate");
		List<DiaDiem> listdd = dsdd();
		model.addAttribute("listdd", listdd);
		model.addAttribute("tuyen", new TuyenXe());
		return "QuanLy/tuyenxe";
	}
	
	public int checkmatuyentrung(String ma) {
		Session session = factory.getCurrentSession();
		String hql = "from TuyenXe where maTuyen = '" + ma + "'";
		Query query = session.createQuery(hql);
		List<TuyenXe> list = query.list();
		if(list.size() == 0) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping(value = "/tuyenxe/insert", method = RequestMethod.POST)
	public String TuyenXeInsert(ModelMap model,HttpServletRequest request, @ModelAttribute("tuyen") TuyenXe tuyen, BindingResult errors) {
		int count = 0;
		if(tuyen.getMaTuyen().trim().length() == 0) {
			errors.rejectValue("maTuyen", "tuyen", "MÃ£ Tuyáº¿n KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
			count  = 1;
		}else if(checkmatuyentrung(tuyen.getMaTuyen())==0) {
			errors.rejectValue("maTuyen", "tuyen", "MÃ£ Tuyáº¿n Ä�Ã£ Tá»“n Táº¡i");
			count = 1;
		}
		if(count == 1) {
			List<TuyenXe> list = dstx();
			model.addAttribute("list", list);
			model.addAttribute("idModal", "modalCreate");
			List<DiaDiem> listdd = dsdd();
			model.addAttribute("listdd", listdd);
			System.out.println("vÃ´ Ä‘Ã¢y");
			return "QuanLy/tuyenxe";	
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
//				tuyen = new TuyenXe();
//				tuyen.setMaTuyen(request.getParameter("matuyen"));
//				tuyen.setDiemDi(diadiemtheoid(request.getParameter("ddi")));
//				tuyen.setDiemDen(diadiemtheoid(request.getParameter("dden")));
//				tuyen.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
				SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
				Date d1 = sdf.parse(request.getParameter("tgchay"));
				tuyen.setTgchay(new Time(d1.getTime()));
				session.save(tuyen);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/tuyenxe.html";
		}
	}

	@RequestMapping(value = "/tuyenxe/{matuyen}", params = "update", method = RequestMethod.GET)
	public String TuyenXeUpdate(ModelMap model, @PathVariable("matuyen") String ma) {
		TuyenXe tuyen = tuyentheoid(ma);
		List<DiaDiem> dsdi = dsdd();
		for (int i = 0; i < dsdi.size(); i++) {
			if (dsdi.get(i).getMaDD().equals(tuyen.getDiemDi().getMaDD())) {
				dsdi.remove(i);
			}
		}
		List<DiaDiem> dsden = dsdd();
		for (int i = 0; i < dsden.size(); i++) {
			if (dsden.get(i).getMaDD().equals(tuyen.getDiemDen().getMaDD())) {
				dsden.remove(i);
			}
		}
		model.addAttribute("dsdi", dsdi);
		model.addAttribute("dsden", dsden);
		model.addAttribute("idModal", "modalUpdate");
		model.addAttribute("tuyen", tuyen);
		List<TuyenXe> list = dstx();
		model.addAttribute("list", list);
		return "QuanLy/tuyenxe";
	}

	@RequestMapping(value = "/tuyenxe/{matuyen}", params = "update", method = RequestMethod.POST)
	public String TuyenXeUpdate(@PathVariable("matuyen") String ma, HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			TuyenXe tuyen = tuyentheoid(ma);
			tuyen.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
			SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
			Date d1 = sdf.parse(request.getParameter("tgchay"));
			tuyen.setTgchay(new Time(d1.getTime()));
			session.save(tuyen);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
		}finally {
			session.close();
		}
		return "redirect: /CNPM/quanly/tuyenxe.html";
	}

	@RequestMapping("/nhanvien")
	public String NhanVien(ModelMap model) {
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien",nhanviens);
		model.addAttribute("nv", new NhanVien());
		return "QuanLy/nhanvien";
	}
	
	@RequestMapping(value = "/nhanvien/{manv}", params = "info")
	public String NhanVienInfo(ModelMap model, @PathVariable("manv") String ma, @ModelAttribute("nv") NhanVien nv) {
		model.addAttribute("idModal", "modalShow");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien",nhanviens);
		nv = nvtheoid(ma);
		model.addAttribute("nv", nv);
		return "QuanLy/nhanvien";
	}
	
	@RequestMapping(value = "/nhanvien/{manv}", params = "update", method = RequestMethod.GET)
	public String NhanVienupdate(ModelMap model, @PathVariable("manv") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien",nhanviens);
		NhanVien nv = nvtheoid(ma);
		model.addAttribute("nv", nv);
		return "QuanLy/nhanvien";
	}
	
	public int checktrungcccd(String ma) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien where cccd = '" + ma + "'";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		if(list.size() == 0) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping(value = "/nhanvien/{manv}", params = "update", method = RequestMethod.POST)
	public String NhanVienupdate(ModelMap model,@PathVariable("manv") String ma, @ModelAttribute("nv") NhanVien nv, HttpServletRequest request,BindingResult errors) {
		if(request.getParameter("honv").length() == 0) {
			errors.rejectValue("hoNV", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(request.getParameter("tennv").trim().length() == 0) {
			errors.rejectValue("tenNV", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(Pattern.matches("[a-zA-Z]+", request.getParameter("sdt")) == true) {
			errors.rejectValue("sdt", "nv", "Sá»‘ Ä�iá»‡n Thoáº¡i KhÃ´ng CÃ³ KÃ­ Tá»± Chá»¯");
		}else if(request.getParameter("sdt").length() >10) {
			errors.rejectValue("sdt", "nv", "Sá»‘ Ä�iá»‡n Thoáº¡i KhÃ´ng QuÃ¡ 10 KÃ­ Tá»±");
		}
		if(request.getParameter("cccd").length() == 0) {
			errors.rejectValue("cccd", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}else if(Pattern.matches("[a-zA-Z]+", request.getParameter("cccd")) == true) {
			errors.rejectValue("cccd", "nv", "Má»¥c KhÃ´ng Chá»©a KÃ­ Tá»± Chá»¯");
		}else if(checktrungcccd(request.getParameter("cccd"))==0) {
			errors.rejectValue("cccd", "nv", "CCCD Ä�Ã£ Tá»“n Táº¡i");
		}
		if(request.getParameter("email").trim().length() == 0) {
			errors.rejectValue("phai", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(request.getParameter("ngaysinh") == "") {
			errors.rejectValue("ngaySinh", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(errors.hasErrors()) {
			model.addAttribute("idModal", "modalUpdate");
			List<NhanVien> nhanviens = dsnv();
			model.addAttribute("nhanvien",nhanviens);
			nv = nvtheoid(ma);
			return "QuanLy/nhanvien";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				nv = nvtheoid(ma);
				TaiKhoan tk = tktheousername(nv.getTknv().getUserName());
				nv.setHoNV(request.getParameter("honv"));
				nv.setTenNV(request.getParameter("tennv"));
				tk.setEmail(request.getParameter("email"));
				nv.setCccd(request.getParameter("cccd"));
				nv.setSdt(request.getParameter("sdt"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngSinh"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				nv.setNgaySinh(sql);
				nv.setPhai(Boolean.parseBoolean(request.getParameter("gridRadios")));
				tk.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
				session.update(tk);
				session.update(nv);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/nhanvien.html";
		}
		
	}
	
	@RequestMapping(value = "/nhanvien/insert", method = RequestMethod.GET)
	public String NhanVienInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien",nhanviens);
		NhanVien nv = new NhanVien();
		nv.setMaNV(taoMa("NV","NhanVien","maNV"));
		model.addAttribute("nv", nv);
		return "QuanLy/nhanvien";
	}
	
	@RequestMapping(value = "/nhanvien/insert", method = RequestMethod.POST)
	public String NhanVienInsert(ModelMap model,@ModelAttribute("nv") NhanVien nv, HttpServletRequest request,BindingResult errors) {
		if(nv.getHoNV().trim().length() == 0) {
			errors.rejectValue("hoNV", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(nv.getTenNV().trim().length() == 0) {
			errors.rejectValue("tenNV", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(Pattern.matches("[a-zA-Z]+", nv.getSdt()) == true) {
			errors.rejectValue("sdt", "nv", "Sá»‘ Ä�iá»‡n Thoáº¡i KhÃ´ng CÃ³ KÃ­ Tá»± Chá»¯");
		}else if(nv.getSdt().length() >10) {
			errors.rejectValue("sdt", "nv", "Sá»‘ Ä�iá»‡n Thoáº¡i KhÃ´ng QuÃ¡ 10 KÃ­ Tá»±");
		}
		if(nv.getCccd().trim().length() == 0) {
			errors.rejectValue("cccd", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}else if(Pattern.matches("[a-zA-Z]+", nv.getCccd()) == true) {
			errors.rejectValue("cccd", "nv", "Má»¥c KhÃ´ng Chá»©a KÃ­ Tá»± Chá»¯");
		}else if(checktrungcccd(nv.getCccd())==0) {
			errors.rejectValue("cccd", "nv", "CCCD Ä�Ã£ Tá»“n Táº¡i");
		}
		if(request.getParameter("username").trim().length() == 0) {
			errors.rejectValue("maNV", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(request.getParameter("email").trim().length() == 0) {
			errors.rejectValue("phai", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(request.getParameter("ngaysinh") == "") {
			errors.rejectValue("ngaySinh", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(errors.hasErrors()) {
			model.addAttribute("idModal", "modalCreate");
			List<NhanVien> nhanviens = dsnv();
			model.addAttribute("nhanvien",nhanviens);
			nv.setMaNV(taoMa("NV","NhanVien","maNV"));
			return "QuanLy/nhanvien";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				TaiKhoan tk = new TaiKhoan();
				VaiTro vt = vaitrotheoid("NV");
				tk.setUserName(request.getParameter("username"));
				tk.setTrangThai(true);
				tk.setVaiTro(vt);
				tk.setEmail(request.getParameter("email"));
				String[] words=request.getParameter("ngaysinh").split("-");
				String pw = words[0] + words[1] + words[2];
				tk.setMatKhau(pw);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngaysinh"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				nv.setNgaySinh(sql);
				nv.setTknv(tk);	
				session.save(tk);
				session.save(nv);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/nhanvien.html";
		}
		
	}
	
	@RequestMapping("/khachhang")
	public String KhachHang(ModelMap model) {
		List<KhachHang> khachhangs = dskh();
		model.addAttribute("dskh",khachhangs);
		model.addAttribute("kh", new KhachHang());
		return "QuanLy/khachhang";
	}
	
	@RequestMapping(value = "/khachhang/{makh}", params = "update", method = RequestMethod.GET)
	public String KhachHangupdate(ModelMap model, @PathVariable("makh") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<KhachHang> khachhangs = dskh();
		model.addAttribute("dskh",khachhangs);
		KhachHang kh = khtheoid(ma);
		model.addAttribute("kh", kh);
		return "QuanLy/khachhang";
	}
	
	@RequestMapping(value = "/khachhang/{makh}", params = "update", method = RequestMethod.POST)
	public String KhachHangupdate(ModelMap model,@PathVariable("makh") String ma, @ModelAttribute("kh") KhachHang kh, HttpServletRequest request,BindingResult errors) {
		if(request.getParameter("hoKH").trim().length() == 0) {
			errors.rejectValue("hoKH", "kh", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(request.getParameter("tenKH").trim().length() == 0) {
			errors.rejectValue("tenKH", "kh", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(Pattern.matches("[a-zA-Z]+", request.getParameter("sdt")) == true) {
			errors.rejectValue("sdt", "kh", "Sá»‘ Ä�iá»‡n Thoáº¡i KhÃ´ng CÃ³ KÃ­ Tá»± Chá»¯");
		}else if(request.getParameter("sdt").length() >10) {
			errors.rejectValue("sdt", "kh", "Sá»‘ Ä�iá»‡n Thoáº¡i KhÃ´ng QuÃ¡ 10 KÃ­ Tá»±");
		}
//		if(nv.getCccd().trim().length() == 0) {
//			errors.rejectValue("cccd", "nv", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
//		}else if(Pattern.matches("[a-zA-Z]+", nv.getCccd()) == false) {
//			errors.rejectValue("cccd", "nv", "Má»¥c KhÃ´ng Chá»©a KÃ­ Tá»± Chá»¯");
//		}
		if(request.getParameter("username").trim().length() == 0) {
			errors.rejectValue("maNV", "kh", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(request.getParameter("email").trim().length() == 0) {
			errors.rejectValue("phai", "kh", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(errors.hasErrors()) {
			model.addAttribute("idModal", "modalUpdate");
			List<KhachHang> khachhangs = dskh();
			model.addAttribute("dskh",khachhangs);
			kh = khtheoid(ma);
			return "QuanLy/khachhang";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();

			try {
				kh = khtheoid(ma);
				TaiKhoan tk = tktheousername(kh.getTkkh().getUserName());
				kh.setHoKH(request.getParameter("hoKH"));
				kh.setTenKH(request.getParameter("tenKH"));
				kh.setSdt(request.getParameter("sdt"));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngSinh"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				kh.setNgSinh(sql);
				kh.setPhai(Boolean.parseBoolean(request.getParameter("gridRadios")));
				tk.setEmail(request.getParameter("email"));
				tk.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
				session.update(tk);
				session.update(kh);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/khachhang.html";
		}
	}
	
	@RequestMapping("/diadiem")
	public String DiaDiem(ModelMap model) {
		List<DiaDiem> dsdd = dsdd();
		model.addAttribute("dsdd",dsdd);
		model.addAttribute("dd", new DiaDiem());
		return "QuanLy/diadiem";
	}
	
	@RequestMapping(value = "/diadiem/{madd}", params = "update", method = RequestMethod.GET)
	public String DDupdate(ModelMap model, @PathVariable("madd") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<DiaDiem> dsdd = dsdd();
		model.addAttribute("dsdd",dsdd);
		DiaDiem dd = diadiemtheoid(ma);
		model.addAttribute("dd", dd);
		return "QuanLy/diadiem";
	}
	
	@RequestMapping(value = "/diadiem/{madd}", params = "update", method = RequestMethod.POST)
	public String DDupdate(ModelMap model,@PathVariable("madd") String ma, @ModelAttribute("dd") DiaDiem dd, HttpServletRequest request,BindingResult errors) {
		if(dd.getDiaDiem().equals("")) {
			errors.rejectValue("diaDiem", "dd", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(errors.hasErrors()) {
			model.addAttribute("idModal", "modalUpdate");
			List<DiaDiem> dsdd = dsdd();
			model.addAttribute("dsdd",dsdd);
			dd = diadiemtheoid(ma);
			return "QuanLy/diadiem";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.update(dd);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/diadiem.html";
		}
	}
	
	@RequestMapping(value = "/diadiem/insert", method = RequestMethod.GET)
	public String DDInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<DiaDiem> dsdd = dsdd();
		model.addAttribute("dsdd",dsdd);
		DiaDiem dd = new DiaDiem();
		model.addAttribute("dd", dd);
		return "QuanLy/diadiem";
	}
	
	@RequestMapping(value = "/diadiem/insert", method = RequestMethod.POST)
	public String DDInsert(ModelMap model,@ModelAttribute("dd") DiaDiem dd, HttpServletRequest request,BindingResult errors) {
		if(dd.getDiaDiem().equals("")) {
			errors.rejectValue("diaDiem", "dd", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(dd.getMaDD().equals("")) {
			errors.rejectValue("maDD", "dd", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(errors.hasErrors()) {
			model.addAttribute("idModal", "modalCreate");
			List<DiaDiem> dsdd = dsdd();
			model.addAttribute("dsdd",dsdd);
			return "QuanLy/diadiem";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.save(dd);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/diadiem.html";
		}
		
	}
	
	@RequestMapping("/loaixe")
	public String LoaiXe(ModelMap model) {
		List<LoaiXe> dslx = dslx();
		model.addAttribute("dslx",dslx);
		model.addAttribute("lx", new LoaiXe());
		return "QuanLy/loaixe";
	}
	@RequestMapping(value = "/loaixe/{malx}", params = "update", method = RequestMethod.GET)
	public String LXupdate(ModelMap model, @PathVariable("malx") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<LoaiXe> dslx = dslx();
		model.addAttribute("dslx",dslx);
		LoaiXe lx = lxtheoid(ma);
		model.addAttribute("lx", lx);
		return "QuanLy/loaixe";
	}
	
	@RequestMapping(value = "/loaixe/{malx}", params = "update", method = RequestMethod.POST)
	public String LXupdate(ModelMap model,@PathVariable("malx") String ma, @ModelAttribute("lx") LoaiXe lx, HttpServletRequest request,BindingResult errors) {
		if(lx.getSeat()<=0) {
			errors.rejectValue("seat", "lx", "sá»‘ gháº¿ > 0");
		}else if(Pattern.matches("[a-zA-Z]+", Integer.toString(lx.getSeat())) == true) {
			errors.rejectValue("seat", "lx", "sá»‘ Gháº¿ KhÃ´ng Chá»©a KÃ­ Tá»± Chá»¯");
		}
		if(errors.hasErrors()) {
			model.addAttribute("idModal", "modalUpdate");
			List<LoaiXe> dslx = dslx();
			model.addAttribute("dslx",dslx);
			lx = lxtheoid(ma);
			return "QuanLy/loaixe";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.update(lx);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/loaixe.html";
		}
	}
	
	@RequestMapping(value = "/loaixe/insert", method = RequestMethod.GET)
	public String LXInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<LoaiXe> dslx = dslx();
		model.addAttribute("dslx",dslx);
		LoaiXe lx = new LoaiXe();
		model.addAttribute("lx", lx);
		return "QuanLy/loaixe";
	}
	
	public int checkmalxtrung(String ma) {
		Session session = factory.getCurrentSession();
		String hql1 = "from LoaiXe where maLX = '" + ma + "'";
		Query query1 = session.createQuery(hql1);
		List<LoaiXe> list1 = query1.list();
		if(list1.size()==0) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping(value = "/loaixe/insert", method = RequestMethod.POST)
	public String LXInsert(ModelMap model,@ModelAttribute("lx") LoaiXe lx, HttpServletRequest request,BindingResult errors) {
		if(lx.getMaLX().trim().length()==0) {
			errors.rejectValue("maLX", "lx", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}else if(checkmalxtrung(lx.getMaLX())==0) {
			errors.rejectValue("maLX", "lx", "MÃ£ Loáº¡i Xe Ä�Ã£ Tá»“n Táº¡i");
		}
		if(lx.getTenLX().trim().length()==0) {
			errors.rejectValue("tenLX", "lx", "KhÃ´ng Ä�Æ°á»£c Ä�á»ƒ Trá»‘ng");
		}
		if(lx.getSeat()<=0) {
			errors.rejectValue("seat", "lx", "sá»‘ gháº¿ > 0");
		}else if(Pattern.matches("[a-zA-Z]+", Integer.toString(lx.getSeat())) == true) {
			errors.rejectValue("seat", "lx", "sá»‘ Gháº¿ KhÃ´ng Chá»©a KÃ­ Tá»± Chá»¯");
		}
		if(errors.hasErrors()) {
			model.addAttribute("idModal", "modalCreate");
			List<LoaiXe> dslx = dslx();
			model.addAttribute("dslx",dslx);
			return "QuanLy/loaixe";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.save(lx);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/loaixe.html";
		}
		
	}
	
	@RequestMapping("/banggia")
	public String BangGia(ModelMap model) {
		List<BangGia> dsbg = dsbg();
		model.addAttribute("dsbg",dsbg);
		model.addAttribute("bg", new BangGia());
		System.out.println(dsbg.get(0).getId());
		return "QuanLy/banggia";
	}
	@RequestMapping(value = "/banggia/{tuyen}/{loaixe}", params = "update", method = RequestMethod.GET)
	public String BangGiaupdate(ModelMap model, @PathVariable("tuyen") String tuyen,@PathVariable("loaixe") String loaixe) {
		model.addAttribute("idModal", "modalUpdate");
		List<BangGia> dsbg = dsbg();
		model.addAttribute("dsbg",dsbg);
		List<LoaiXe> dslx = dslx();
		List<TuyenXe> dstx = dstx();
		Map<String, String> tenXK = new HashMap<>();
		for(int i = 0;i<dstx.size();i++) {
			tenXK.put(dstx.get(i).getMaTuyen(), dstx.get(i).getDiemDi().getDiaDiem() + " - " + dstx.get(i).getDiemDen().getDiaDiem());
		}
		model.addAttribute("listtemp", tenXK);
		model.addAttribute("dslx", dslx);
		model.addAttribute("dstx", dstx);
		BangGia bg = bgtheoid(tuyen,loaixe);
		model.addAttribute("bg", bg);
		return "QuanLy/banggia";
	}
	
	@RequestMapping(value = "/banggia/{tuyen}/{loaixe}", params = "update", method = RequestMethod.POST)
	public String BangGiaupdate(ModelMap model,@PathVariable("tuyen") String tuyen,@PathVariable("loaixe") String loaixe,HttpServletRequest request) {
		String s=""; int count = 0;
		if(Double.parseDouble(request.getParameter("gia"))<0) {
			s = "GiÃ¡ KhÃ´ng Ä�Æ°á»£c Nhá»� HÆ¡n 0";
			count = 1;
		}else if(Pattern.matches("[a-zA-Z]+", request.getParameter("gia")) == true) {
			s = "Má»¥c KhÃ´ng Ä�Æ°á»£c Chá»©a Chá»¯";
			count = 1;
		}
		if(count ==1) {
			model.addAttribute("idModal", "modalUpdate");
			List<BangGia> dsbg = dsbg();
			model.addAttribute("dsbg",dsbg);
			List<LoaiXe> dslx = dslx();
			List<TuyenXe> dstx = dstx();
			Map<String, String> tenXK = new HashMap<>();
			for(int i = 0;i<dstx.size();i++) {
				tenXK.put(dstx.get(i).getMaTuyen(), dstx.get(i).getDiemDi().getDiaDiem() + " - " + dstx.get(i).getDiemDen().getDiaDiem());
			}
			model.addAttribute("listtemp", tenXK);
			model.addAttribute("dslx", dslx);
			model.addAttribute("dstx", dstx);
			BangGia bg = bgtheoid(tuyen,loaixe);
			model.addAttribute("bg", bg);
			model.addAttribute("message", s);
			return "QuanLy/banggia";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				BangGia bg = bgtheoid(tuyen,loaixe);
				bg.setGia(new BigDecimal(request.getParameter("gia")));
				session.update(bg);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/banggia.html";
		}
		
	}
	
	@RequestMapping(value = "/banggia/insert", method = RequestMethod.GET)
	public String BangGiaInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<BangGia> dsbg = dsbg();
		model.addAttribute("dsbg",dsbg);
		List<LoaiXe> dslx = dslx();
		List<TuyenXe> dstx = dstx();
		model.addAttribute("dslx", dslx);
		model.addAttribute("dstx", dstx);
		return "QuanLy/banggia";
	}
	
	@RequestMapping(value = "/banggia/insert", method = RequestMethod.POST)
	public String BangGiaInsert( ModelMap model,HttpServletRequest request) {
		String s=""; int count = 0;
		if(Double.parseDouble(request.getParameter("gia"))<0) {
			s = "GiÃ¡ KhÃ´ng Ä�Æ°á»£c Nhá»� HÆ¡n 0";
			count = 1;
		}else if(Pattern.matches("[a-zA-Z]+", request.getParameter("gia")) == true) {
			s = "Má»¥c KhÃ´ng Ä�Æ°á»£c Chá»©a Chá»¯";
			count = 1;
		}
		if(count == 1) {
			model.addAttribute("idModal", "modalCreate");
			List<BangGia> dsbg = dsbg();
			model.addAttribute("dsbg",dsbg);
			List<LoaiXe> dslx = dslx();
			List<TuyenXe> dstx = dstx();
			model.addAttribute("dslx", dslx);
			model.addAttribute("dstx", dstx);
			model.addAttribute("message", s);
			return "QuanLy/banggia";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				BangGiaPK bgpk = new BangGiaPK();
				bgpk.setLoaixe(request.getParameter("loaixe"));
				bgpk.setTuyen(request.getParameter("tuyenxe"));
				BangGia bg = new BangGia();
				bg.setId(bgpk);
				bg.setLoaixe(lxtheoid(request.getParameter("loaixe")));
				bg.setTuyen(tuyentheoid(request.getParameter("tuyenxe")));
				bg.setGia(new BigDecimal(request.getParameter("gia")));
				session.save(bg);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}
			return "redirect: /CNPM/quanly/banggia.html";
		}
		
	}
	
	@RequestMapping("/phieudat")
	public String PhieuDat(ModelMap model) {
		List<PhieuDat> ds = dspd(); 
		model.addAttribute("dspd", ds);
		model.addAttribute("pd", new PhieuDat());
		return "QuanLy/phieudat";
	}
	
	@RequestMapping(value = "/phieudat/{mapd}", params = "info")
	public String PhieuDatInfo(ModelMap model, @PathVariable("mapd") String ma, @ModelAttribute("pd") PhieuDat pd) {
		model.addAttribute("idModal", "modalShow");
		List<PhieuDat> ds = dspd(); 
		model.addAttribute("dspd", ds);
		pd = phieudattheoma(ma);
		List<VeXe> dsvx = vexetheomapd(ma);
		model.addAttribute("pd", pd);
		Map<Integer, String> vx = new HashMap<Integer, String>();
		for(int i=0;i<dsvx.size();i++) {
			int k = i +1;
			vx.put(k, dsvx.get(i).getId().getSoGhe());
		}
		model.addAttribute("vx", vx);
		return "QuanLy/phieudat";
	}
	
	@RequestMapping(value = "/phieudat/{mapd}", params = "update", method = RequestMethod.GET)
	public String PhieuDatupdate(ModelMap model, @PathVariable("mapd") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<PhieuDat> ds = dspd(); 
		model.addAttribute("dspd", ds);
		PhieuDat pd = new PhieuDat();
		pd = phieudattheoma(ma);
		model.addAttribute("pd", pd);
		return "QuanLy/phieudat";
	}
	
	@RequestMapping(value = "/phieudat/{mapd}", params = "update", method = RequestMethod.POST)
	public String PhieuDatupdate(@PathVariable("mapd") String ma, HttpServletRequest request) {
		
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			PhieuDat pd = phieudattheoma(ma);
			pd.setTrangThai(Integer.parseInt(request.getParameter("trangthai")));
			session.update(pd);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
		}finally {
			session.close();
		}
		return "redirect: /CNPM/quanly/phieudat.html";
	}
	
//	@RequestMapping(value = "/phieudat/insert", method = RequestMethod.GET)
//	public String PhieuDatInsert(ModelMap model) {
//		model.addAttribute("idModal", "modalCreate");
//		List<PhieuDat> ds = dspd(); 
//		model.addAttribute("dspd", ds);
//		model.addAttribute("pd", new PhieuDat());
//		return "QuanLy/phieudat";
//	}
//	
//	@RequestMapping(value = "/phieudat/insert", method = RequestMethod.POST)
//	public String PhieuDatInsert( HttpServletRequest request) {
//		Session session = factory.openSession();
//		Transaction transaction = session.beginTransaction();
//		try {
//			BangGiaPK bgpk = new BangGiaPK();
//			bgpk.setLoaixe(request.getParameter("loaixe"));
//			bgpk.setTuyen(request.getParameter("tuyenxe"));
//			BangGia bg = new BangGia();
//			bg.setId(bgpk);
//			bg.setLoaixe(lxtheoid(request.getParameter("loaixe")));
//			bg.setTuyen(tuyentheoid(request.getParameter("tuyenxe")));
//			bg.setGia(new BigDecimal(request.getParameter("gia")));
//			session.save(bg);
//			transaction.commit();
//		} catch (Exception e) {
//			System.out.println(e.toString());
//			transaction.rollback();
//		}finally {
//			session.close();
//		}
//		return "redirect: /CNPM/quanly/phieudat.html";
//	}

	@RequestMapping(value = "/trangcanhan", method = RequestMethod.GET)
	public String Profile(ModelMap model, HttpSession ss) {
//		NhanVien nv = (NhanVien)ss.getAttribute("user");
		NhanVien nv = nvtheoid("NV01");
		System.out.println(nv.getHoNV());
		System.out.println(nv.getTknv());
		model.addAttribute("nv", nv);
		return "QuanLy/profile";
	}
	
	@RequestMapping(value = "/trangcanhan", method = RequestMethod.POST)
	public String ProfileUpdate(ModelMap model, @ModelAttribute("nv") NhanVien nv,HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			TaiKhoan tk = tktheousername(nv.getTknv().getUserName());
			tk.setEmail(request.getParameter("email"));
			session.update(tk);
			nv.setTknv(tk);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = format.parse(request.getParameter("ngaysinh"));
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			nv.setNgaySinh(sql);
			session.update(nv);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
		}finally {
			session.close();
		}

		return "redirect: /CNPM/quanly/trangcanhan.html";
	}
	
	@RequestMapping(value = "/trangcanhan/changepw")
	public String ChangePW(ModelMap model,HttpSession ss, HttpServletRequest request) {
		NhanVien nv = (NhanVien)ss.getAttribute("user"); int count =0;
		TaiKhoan tk = tktheousername(nv.getTknv().getUserName());
		String s = "";
		if(request.getParameter("password").equals(tk.getMatKhau())) {
			s = "Máº­t Kháº©u Hiá»‡n Táº¡i Bá»‹ Sai";
			count ++;
		}
		else if(request.getParameter("newpassword").equals("renewpassword") == false) {
			s = "Máº­t Kháº©u Má»›i KhÃ´ng Khá»›p Vá»›i Nhau";
			count ++;
		}
		if(count == 0) {
			model.addAttribute("message", s);
			return "QuanLy/profile";
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				tk.setMatKhau(request.getParameter("newpassword"));
				session.update(tk);
				transaction.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
			}finally {
				session.close();
			}

			return "redirect: /CNPM/quanly/trangcanhan.html";
		}
	}
	
}