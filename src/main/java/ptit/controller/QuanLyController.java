package ptit.controller;

import java.sql.Time;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ptit.entity.*;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("QuanLy")
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
	public List<KhachHang> dskh(){
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		return list;
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
	
	public float layGia(String matuyen, String LoaiXe) {
		Session session = factory.getCurrentSession();
		String hql = "from BangGia where Tuyen = '" + matuyen + "' and loaixe = '" + LoaiXe + "'";
		Query query = session.createQuery(hql);
		List<BangGia> list = query.list();
		float gia = list.get(0).getGia();
		return  gia;
	}
	
	
	@RequestMapping(value = "QL_TrangChu")
	public String TrangChu() {
		return "QuanLy/trangchu";
	}

	@RequestMapping("QL_ChuyenXe")
	public String ChuyenXe(ModelMap model) {
		List<ChuyenXe> list = dscx();
		model.addAttribute("list", list);
		model.addAttribute("chuyenxe", new ChuyenXe());
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "QL_ChuyenXe/{machuyen}", params = "info")
	public String ChuyenXeInfo(ModelMap model, @PathVariable("machuyen") String ma) {
		model.addAttribute("idModal", "modalShow");
		List<ChuyenXe> list = dscx();
		ChuyenXe chuyen = xetheoid(ma);
		model.addAttribute("list", list);
		model.addAttribute("chuyen", chuyen);
		model.addAttribute("chuyenxe", new ChuyenXe());
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "QL_ChuyenXe/{machuyen}", params = "update", method = RequestMethod.GET)
	public String ChuyenXeUpdate(ModelMap model, @PathVariable("machuyen") String ma) {
		ChuyenXe chuyen = xetheoid(ma);
		model.addAttribute("idModal", "modalUpdate");
		List<ChuyenXe> listcx = dscx();
		model.addAttribute("list", listcx);
		List<TuyenXe> listtx = dstx();
		Map<String, String> tenXK = new HashMap<>();
		for(int i = 0;i<listtx.size();i++) {
			tenXK.put(listtx.get(i).getMaTuyen(), listtx.get(i).getDiemDi().getDiaDiem() + " - " + listtx.get(i).getDiemDen().getDiaDiem());
		}
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
		model.addAttribute("listtemp", tenXK);
		model.addAttribute("chuyenxe", chuyen);
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "/QL_ChuyenXe/{machuyen}", params = "update", method = RequestMethod.POST)
	public String ChuyenXeUpdate(ModelMap model, @PathVariable("machuyen") String ma,HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction transaction = session.getTransaction();
		try {
			ChuyenXe chuyen =xetheoid(ma);
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
			float gia = layGia(chuyen.getTuyen().getMaTuyen(), xk.getLx().getMaLX());
			session.update(chuyen);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
		}

		return "redirect: /CNPM/QuanLy/QL_ChuyenXe.html";
	}

	@RequestMapping(value = "QL_ChuyenXe/insert", method = RequestMethod.GET)
	public String ChuyenXeInsert(ModelMap model) {
		System.out.println("l3333oi");
		model.addAttribute("idModal", "modalCreate");
		List<ChuyenXe> listcx = dscx();
		List<TuyenXe> listtx = dstx();
		List<NhanVien> listnv = dsnv();
		List<XeKhach> listxk = dsxk();
		Map<String, String> tenXK = new HashMap<>();
		for(int i = 0;i<listtx.size();i++) {
			tenXK.put(listtx.get(i).getMaTuyen(), listtx.get(i).getDiemDi().getDiaDiem() + " - " + listtx.get(i).getDiemDen().getDiaDiem());
		}
		model.addAttribute("listnv", listnv);
		model.addAttribute("listxk", listxk);
		model.addAttribute("listtx", listtx);
		model.addAttribute("listtemp", tenXK);
		model.addAttribute("list", listcx);
		ChuyenXe chuyen = new ChuyenXe();
		chuyen.setMaChuyen(taoMa("CX","ChuyenXe","maChuyen"));
		model.addAttribute("chuyenxe", chuyen);
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "QL_ChuyenXe/insert", method = RequestMethod.POST)
	public String ChuyenXeInsertpost(ModelMap model, @ModelAttribute("chuyexe") ChuyenXe chuyen,HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		System.out.println("lo123i");
		try {
//			ChuyenXe xe = new ChuyenXe();
//			xe.setMaChuyen(request.getParameter("MaChuyen"));
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			Date parsed = format.parse(request.getParameter("ngKH"));
//			java.sql.Date sql = new java.sql.Date(parsed.getTime());
//			xe.setNgKH(sql);
//			SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
//			Date d1 = sdf.parse(request.getParameter("tgKH"));
//			xe.setTgKh(new Time(d1.getTime()));
//			xe.setTuyen(tuyentheoid(request.getParameter("tuyenxe")));
//			xe.setXekhach(xekhachtheoid(request.getParameter("xekhach")));
//			xe.setNv(nvtheoid(request.getParameter("nhanvien")));
//			xe.setGia(Float.parseFloat(request.getParameter("money")));
			chuyen.setMaChuyen(taoMa("CX","ChuyenXe","maChuyen"));
			chuyen.setTrangthai(false);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = format.parse(request.getParameter("ngKH"));
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			chuyen.setNgKH(sql);
			XeKhach xk = xekhachtheoid(chuyen.getXekhach().getBienXe());
			float gia = layGia(chuyen.getTuyen().getMaTuyen(), xk.getLx().getMaLX());
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
		return "redirect: /CNPM/QuanLy/QL_ChuyenXe.html";
	}

	@RequestMapping("/QL_TuyenXe")
	public String TuyenXe(ModelMap model) {
		List<TuyenXe> list = dstx();
		model.addAttribute("list", list);
		model.addAttribute("tuyen", new TuyenXe());
		return "QuanLy/tuyenxe";
	}

	@RequestMapping(value = "/QL_TuyenXe/insert", method = RequestMethod.GET)
	public String TuyenXeInsert(ModelMap model) {
		List<TuyenXe> list = dstx();
		model.addAttribute("list", list);
		model.addAttribute("idModal", "modalCreate");
		List<DiaDiem> listdd = dsdd();
		model.addAttribute("listdd", listdd);
		model.addAttribute("tuyen", new TuyenXe());
		return "QuanLy/tuyenxe";
	}

	@RequestMapping(value = "/QL_TuyenXe/insert", method = RequestMethod.POST)
	public String TuyenXeInsert(HttpServletRequest request, @ModelAttribute("tuyen") TuyenXe tuyen) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
//			tuyen = new TuyenXe();
//			tuyen.setMaTuyen(request.getParameter("matuyen"));
//			tuyen.setDiemDi(diadiemtheoid(request.getParameter("ddi")));
//			tuyen.setDiemDen(diadiemtheoid(request.getParameter("dden")));
//			tuyen.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
			session.save(tuyen);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
		}
		return "redirect: /CNPM/QuanLy/QL_TuyenXe.html";
	}

	@RequestMapping(value = "/QL_TuyenXe/{matuyen}", params = "update", method = RequestMethod.GET)
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

	@RequestMapping(value = "/QL_TuyenXe/{matuyen}", params = "update", method = RequestMethod.POST)
	public String TuyenXeUpdate(@PathVariable("matuyen") String ma, HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			TuyenXe tuyen = tuyentheoid(ma);
			tuyen.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
			session.save(tuyen);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
		}
		return "redirect: /CNPM/QuanLy/QL_TuyenXe.html";
	}

	@RequestMapping("/QL_NhanVien")
	public String NhanVien(ModelMap model) {
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien",nhanviens);
		model.addAttribute("nv", new NhanVien());
		return "QuanLy/nhanvien";
	}
	
	@RequestMapping(value = "/QL_NhanVien/{manv}", params = "info")
	public String NhanVienInfo(ModelMap model, @PathVariable("manv") String ma, @ModelAttribute("nv") NhanVien nv) {
		model.addAttribute("idModal", "modalShow");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien",nhanviens);
		nv = nvtheoid(ma);
		model.addAttribute("nv", nv);
		return "QuanLy/nhanvien";
	}
	
	@RequestMapping("/QL_KhachHang")
	public String KhachHang(ModelMap model) {
		List<KhachHang> khachhangs = dskh();
		model.addAttribute("kh",khachhangs);
		return "KhachHang/Trangchu";
	}
}