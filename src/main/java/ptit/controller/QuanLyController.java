package ptit.controller;

import java.math.BigDecimal;
import java.sql.Time;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

import ptit.entity.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.commons.codec.digest.DigestUtils;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Transactional
@RequestMapping("quanly")
public class QuanLyController {
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;

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

	public List<PhieuDat> getdspdbymachuyen(String machuyen) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat pd where pd.chuyen.maChuyen =:machuyen";
		Query query = session.createQuery(hql);
		query.setParameter("machuyen", machuyen);
		List<PhieuDat> list = query.list();
		if (list.size() == 0) {
			return null;
		}

		return list;
	}

	public int tangchotrong(String machuyen, int sl) {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe where maChuyen=:machuyen";
		Query query = session.createQuery(hql);
		query.setParameter("machuyen", machuyen);
		int sochotrong = 0;
		List<ChuyenXe> dscx = query.list();
		if (dscx != null) {
			ChuyenXe chuyenxe = dscx.get(0);
			int sct = chuyenxe.getSochotrong();
			chuyenxe.setSochotrong(sct + sl);
			sochotrong = chuyenxe.getSochotrong();
			System.out.println(sochotrong);
		}
		return sochotrong;
	}

	public BigDecimal layGia(String matuyen, String LoaiXe) {
		Session session = factory.getCurrentSession();
		String hql = "from TuyenXe where maTuyen = '" + matuyen + "'";
		Query query = session.createQuery(hql);
		List<TuyenXe> list = query.list();
		String hql1 = "from LoaiXe where maLX = '" + LoaiXe + "'";
		query = session.createQuery(hql1);
		List<LoaiXe> list2 = query.list();
		double gia = list.get(0).getGiatuyen().doubleValue() + list2.get(0).getGiaLX().doubleValue();
		return BigDecimal.valueOf(gia);
	}

	public List<ChuyenXe> dscx() {
		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe as cx order by cx.maChuyen DESC";
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

	public List<KhachHang> dskh() {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		return list;
	}

	public int getslvebypd(String mapd) {
		Session session = factory.getCurrentSession();
		String hql = "from VeXe where id.pd=:mapd";
		Query query = session.createQuery(hql);
		query.setParameter("mapd", mapd);
		List<VeXe> list = query.list();
		return list.size();
	}

	public List<PhieuDat> dspd() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhieuDat as pd order by pd.maPD desc";
		Query query = session.createQuery(hql);
		List<PhieuDat> list = query.list();
		return list;
	}

	public ChuyenXe xetheoid(String machuyen) {
		Session session = factory.getCurrentSession();
		ChuyenXe chuyen = (ChuyenXe) session.load(ChuyenXe.class, machuyen);
		return chuyen;
	}

	public TuyenXe tuyentheoid(String ma) {
		Session session = factory.getCurrentSession();
		TuyenXe tuyen = (TuyenXe) session.get(TuyenXe.class, ma);
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

	// controller show info
	@RequestMapping(value = "chuyenxe/{machuyen}", params = "info")
	public String ChuyenXeInfo(ModelMap model, @PathVariable("machuyen") String ma) {
		model.addAttribute("idModal", "modalShow");
		List<ChuyenXe> list = dscx();
		ChuyenXe chuyen = xetheoid(ma);
		String s = chuyen.getTgKh().toString().substring(0, 5);
		if (chuyen.getTrangthai() == 1) {
			model.addAttribute("gia", chuyen.getGia());
		} else {
			XeKhach xk = xekhachtheoid(chuyen.getXekhach().getBienXe());
			LoaiXe lx = lxtheoid(xk.getLx().getMaLX());
			BigDecimal gia = layGia(chuyen.getTuyen().getMaTuyen(), lx.getMaLX());
			model.addAttribute("gia", gia);
		}
		model.addAttribute("list", list);
		model.addAttribute("chuyen", chuyen);
		model.addAttribute("chuyenxe", new ChuyenXe());
		model.addAttribute("time", s);
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "chuyenxe/trangthai/{machuyen}.html")
	public String ChuyenXeTrangThai(ModelMap model, @PathVariable("machuyen") String ma) {
		System.out.println("test");
		model.addAttribute("idModal", "modalTT");
		List<ChuyenXe> list = dscx();
		model.addAttribute("list", list);
		ChuyenXe chuyen = xetheoid(ma);
		model.addAttribute("chuyenxe", chuyen);
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "chuyenxe/trangthai/{machuyen}.html", params = "btnDoitrangthai")
	public String ChuyenXetrangThai(@PathVariable("machuyen") String ma, @ModelAttribute("chuyenxe") ChuyenXe chuyen,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		System.out.println(chuyen.getTrangthai());
		ChuyenXe chuyenxe = xetheoid(ma);
		chuyenxe.setTrangthai(chuyen.getTrangthai());

		try {
			if (chuyenxe.getTrangthai() == 2) {
				List<PhieuDat> dspd = getdspdbymachuyen(ma);
				if (dspd != null) {
					for (PhieuDat phieudat : dspd) {
						phieudat.setTrangThai(2);
						try {
							MimeMessage mail = mailer.createMimeMessage();
							MimeMessageHelper helper = new MimeMessageHelper(mail);
							helper.setFrom("no-reply-email");
							helper.setTo(/* email */"n19dccn223@student.ptithcm.edu.vn");
							helper.setSubject("Hủy Chuyến");
							helper.setText("  <div style=\"padding-bottom: 10rem;background-color: #f1f1f1; font-family: 'Roboto', sans-serif;\r\n"
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
									+ "            <p style=\"margin: 1rem 0;\">Xin chào,</p>\r\n"
									+ "            <p style=\"margin: 1rem 0 0.3rem 0;\">Vé xe "+phieudat.getMaPD()+" đã bị hủy do chuyến xe <span style=\"color: red;\">"+phieudat.getChuyen().getMaChuyen()+"</span>\r\n"
									+ "                bị hủy\r\n"
									+ "            </p>\r\n"
									+ "            <p> Nếu có sự bất tiện nào, vui lòng liên hệ bộ phận hỗ trợ của chúng tôi qua email hotro@gmail.com hoặc\r\n"
									+ "                012344343\r\n"
									+ "            </p>\r\n"
									+ "            <p>Click vào nút bên dưới để quay lại trang web</p>\r\n"
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
									+ "    </div>",true);
							mailer.send(mail);
						} catch (MessagingException e) {
							System.out.println("thất bại");
							e.printStackTrace();
						}

						session.merge(phieudat);
					}

				}
			}

			session.merge(chuyenxe);
			transaction.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Thay đổi trạng thái thành công!"));
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thay đổi trạng thái thất bại!"));
		} finally {
			session.close();
		}
		return "redirect:/quanly/chuyenxe.html";

	}

	// controller update chuyenxe get
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
		if (chuyen.getTrangthai() == 1) {
			model.addAttribute("gia", chuyen.getGia());
		} else {
			XeKhach xk = xekhachtheoid(chuyen.getXekhach().getBienXe());
			LoaiXe lx = lxtheoid(xk.getLx().getMaLX());
			BigDecimal gia = layGia(chuyen.getTuyen().getMaTuyen(), lx.getMaLX());
			model.addAttribute("gia", gia);
		}
		model.addAttribute("listxk", listxk);
		model.addAttribute("listtx", listtx);
		model.addAttribute("chuyenxe", chuyen);
		return "QuanLy/chuyenxe";
	}

	@RequestMapping(value = "/chuyenxe/{machuyen}", params = "update", method = RequestMethod.POST)
	public String ChuyenXeUpdate(ModelMap model, @PathVariable("machuyen") String ma, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
//		if (request.getParameter("ngKH") == "") {
//			errors.rejectValue("ngKH", "chuyen", "Ngày Tháng Không Được Để Trống");
//		}
//		if (request.getParameter("thoigian") == "") {
//			errors.rejectValue("tgKh", "chuyen", "Thời Gian Không Được Để Trống");
//		}
//
//		if (errors.hasErrors()) {
//			ChuyenXe chuyen = xetheoid(ma);
//			model.addAttribute("idModal", "modalUpdate");
//			List<ChuyenXe> listcx = dscx();
//			model.addAttribute("list", listcx);
//			List<TuyenXe> listtx = dstxhd();
//			for (int i = 0; i < listtx.size(); i++) {
//				if (listtx.get(i).getMaTuyen().equals(chuyen.getTuyen().getMaTuyen())) {
//					listtx.remove(i);
//					break;
//				}
//			}
//
//			List<XeKhach> listxk = dsxk();
//			for (int i = 0; i < listxk.size(); i++) {
//				if (listxk.get(i).getBienXe().equals(chuyen.getXekhach().getBienXe())) {
//					listxk.remove(i);
//					break;
//				}
//			}
//			model.addAttribute("listxk", listxk);
//			model.addAttribute("listtx", listtx);
//			return "QuanLy/chuyenxe";
//		} else {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			System.out.println(ma);
			ChuyenXe chuyen = xetheoid(ma);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = format.parse(request.getParameter("ngKH"));
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			
			SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
			
			Date d1 = sdf.parse(request.getParameter("tgKH"));
			if(chuyen.getNgKH() != sql || chuyen.getTgKh() != new Time(d1.getTime())) {
				System.out.println(ma);
				List<PhieuDat> dspd = getdspdbymachuyen(ma);
				if (dspd != null) {
					for (PhieuDat phieudat : dspd) {
						
						try {
							MimeMessage mail = mailer.createMimeMessage();
							MimeMessageHelper helper = new MimeMessageHelper(mail);
							helper.setFrom("no-reply-email");
							helper.setTo(/* email */"n19dccn223@student.ptithcm.edu.vn");
							helper.setSubject("Thông báo thay đổi thời gian khởi hành");
							helper.setText("    <div style=\"padding-bottom: 10rem;background-color: #f1f1f1; font-family: 'Roboto', sans-serif;\r\n"
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
									+ "            <p style=\"margin: 1rem 0;\">Xin chào,</p>\r\n"
									+ "            <p style=\"margin: 1rem 0 0.3rem 0;\">Bạn nhận được email này vì chuyến xe <span\r\n"
									+ "                    style=\"color: red;\">"+phieudat.getChuyen().getMaChuyen()+"</span> đã được cập nhật các thông\r\n"
									+ "                tin mới, vui lòng kiểm tra lại thông tin</p>\r\n"
			         
									+ "            <p> Nếu có sự bất tiện nào, vui lòng liên hệ bộ phận hỗ trọ của chúng tôi qua email hotro@gmail.com hoặc\r\n"
									+ "                012344343\r để được hoàn trả vé\n"
									+ "            </p>\r\n"
									+ "            <p>Click vào nút bên dưới để quay lại trang web</p>\r\n"
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
							mailer.send(mail);
						} catch (MessagingException e) {
							System.out.println("thất bại");
							e.printStackTrace();
						}

						
					}

				}
			}
			System.out.println(chuyen.getTgKh());
			chuyen.setNgKH(sql);
			chuyen.setTgKh(new Time(d1.getTime()));
			/* chuyen.setTuyen(tuyentheoid(request.getParameter("tuyenxe"))); */ 
			chuyen.setXekhach(xekhachtheoid(request.getParameter("xekhach")));
			/* chuyen.setTrangthai(Integer.parseInt(request.getParameter("trangthai"))); */
			/*
			 * XeKhach xk = xekhachtheoid(chuyen.getXekhach().getBienXe()); BigDecimal gia =
			 * layGia(chuyen.getTuyen().getMaTuyen(), xk.getLx().getMaLX());
			 */
			session.merge(chuyen);
			transaction.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật chuyến thành công!"));
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật chuyến thất bại!"));
			System.out.println(e.toString());
			transaction.rollback();
		} finally {
			session.close();
		}

		return "redirect:/quanly/chuyenxe.html";
//		}

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
		for (int i = 0; i < listtx.size(); i++) {
			tenXK.put(listtx.get(i).getMaTuyen(),
					listtx.get(i).getDiemDi().getDiaDiem() + " - " + listtx.get(i).getDiemDen().getDiaDiem());
		}
		model.addAttribute("listtemp", tenXK);
		model.addAttribute("listnv", listnv);
		model.addAttribute("listxk", listxk);
		model.addAttribute("listtx", listtx);
		model.addAttribute("list", listcx);
		ChuyenXe chuyen = new ChuyenXe();
		chuyen.setMaChuyen(taoMa("CX", "ChuyenXe", "maChuyen"));
		model.addAttribute("chuyenxe", chuyen);
		return "QuanLy/chuyenxe";
	}

	public ChuyenXe getchuyenxecuoi(String bienso, String ngkh, ChuyenXe chuyen) {

		Session session = factory.getCurrentSession();
		String hql = "from ChuyenXe where xekhach.bienXe = '" + bienso + "' and ngKH <= '" + ngkh
				+ "' and trangthai!=2 ORDER BY ngKH DESC,tgKh DESC";
		Query query = session.createQuery(hql);

		List<ChuyenXe> list = query.list();

		if (list.size() != 0) {
			ChuyenXe cx = list.get(0);
			System.out.println("chuyenx " + cx.getMaChuyen());
			return cx;

		}
		return null;

	}

	@RequestMapping(value = "chuyenxe/insert", method = RequestMethod.POST)
	public String ChuyenXeInsertpost(ModelMap model, @ModelAttribute("chuyenxe") ChuyenXe chuyen,
			HttpServletRequest request, BindingResult errors, RedirectAttributes redirectAttributes) {
		System.out.println("vào 2");
		if (request.getParameter("ngKH") == "") {

			errors.rejectValue("ngKH", "chuyen", "Ngày Tháng Không Được Để Trống");
		}
		if (request.getParameter("thoigian") == "") {
			errors.rejectValue("tgKh", "chuyen", "Thời gian không được để trống");
		}
		 Date daten = new Date();
	        Calendar cf = Calendar.getInstance();
	        cf.setTime(daten);
	         cf.add(Calendar.DATE, 1);
	        Date dateso = cf.getTime();
		
		if (chuyen.getNgKH() != null && chuyen.getNgKH().before(dateso)) {
			errors.rejectValue("ngKH", "chuyen", "Ngày khởi hành phải sau ngày hiện tại 2 ngày");

		} else {
			ChuyenXe cxc = getchuyenxecuoi(chuyen.getXekhach().getBienXe(), request.getParameter("ngKH"), chuyen);
			if (cxc != null) {
				TuyenXe tx = tuyentheoid(chuyen.getTuyen().getMaTuyen());

				if (tx.getDiemDi().getMaDD().equals(cxc.getTuyen().getDiemDen().getMaDD()) == false) {
					errors.rejectValue("maChuyen", "chuyen", "Thời điểm này xe ở "
							+ cxc.getTuyen().getDiemDen().getDiaDiem() + ". Vui lòng chọn tuyến xe phù hợp.");
				} else {
					try {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						Date parsed = format.parse(request.getParameter("ngKH"));
						java.sql.Date sql = new java.sql.Date(parsed.getTime());
						chuyen.setNgKH(sql);
						SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
						Date d1 = sdf.parse(request.getParameter("thoigian"));
						chuyen.setTgKh(new Time(d1.getTime()));

//					test thử
						SimpleDateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
						String dateString2 = dateformat.format(chuyen.getNgKH());
						String dateString = dateformat.format(cxc.getNgKH());

						String s = cxc.getTgKh().toString().substring(0, 5);
						String s1 = chuyen.getTgKh().toString().substring(0, 5);
						SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm");
						Date date = null;
						Date datebf = null;
						try {
							date = formatter.parse(dateString2 + " " + s1);
							datebf = formatter.parse(dateString + " " + s);
							System.out.println("ngay1 " + date);
							System.out.println("ngaytrc" + date);
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						Calendar c = Calendar.getInstance();
						c.setTime(datebf);
						c.add(Calendar.MINUTE, cxc.getTuyen().getTgchay());
						Date datecp = c.getTime();

						long getDiff = date.getTime() - datecp.getTime();
						long getDaysDiff = TimeUnit.MILLISECONDS.toMinutes(getDiff);
						int minute = (int) getDaysDiff;
						System.out.println("thoi gian2 " + minute);
						if (minute < 4 * 60) {
							errors.rejectValue("tgKh", "chuyen",
									"Thời gian khởi hành cần cách thời gian đến của xe 4 tiếng!");
						}
					} catch (Exception e) {

					}

//					kết thúc test
				}
			}
		}

		if (errors.hasErrors()) {
			System.out.println("l3333oi");
			model.addAttribute("idModal", "modalCreate");
			List<ChuyenXe> listcx = dscx();
			List<TuyenXe> listtx = dstxhd();
			List<NhanVien> listnv = dsnv();
			List<XeKhach> listxk = dsxk();
			Map<String, String> tenXK = new HashMap<>();
			for (int i = 0; i < listtx.size(); i++) {
				tenXK.put(listtx.get(i).getMaTuyen(),
						listtx.get(i).getDiemDi().getDiaDiem() + " - " + listtx.get(i).getDiemDen().getDiaDiem());
			}
			model.addAttribute("listtemp", tenXK);
			model.addAttribute("listnv", listnv);
			model.addAttribute("listxk", listxk);
			model.addAttribute("listtx", listtx);
			model.addAttribute("list", listcx);
			chuyen.setMaChuyen(taoMa("CX", "ChuyenXe", "maChuyen"));
			model.addAttribute("chuyenxe", chuyen);
			return "QuanLy/chuyenxe";
		} else {
			Session session2 = factory.getCurrentSession();
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
				chuyen.setMaChuyen(taoMa("CX", "ChuyenXe", "maChuyen"));
				chuyen.setTrangthai(0);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngKH"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				chuyen.setNgKH(sql);
				XeKhach xk = xekhachtheoid(chuyen.getXekhach().getBienXe());
				BigDecimal gia = layGia(chuyen.getTuyen().getMaTuyen(), xk.getLx().getMaLX());
				SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
				Date d1 = sdf.parse(request.getParameter("thoigian"));
				chuyen.setTgKh(new Time(d1.getTime()));
				chuyen.setGia(gia);
				XeKhach xkk =(XeKhach)session2.get(XeKhach.class, chuyen.getXekhach().getBienXe());
				chuyen.setSochotrong(xkk.getLx().getSeat());
//				test thử
				SimpleDateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
				String dateString2 = dateformat.format(chuyen.getNgKH());
				String s1 = chuyen.getTgKh().toString().substring(0, 5);
				SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm");
				Date date = null;
				Date datebf = null;
				try {
					date = formatter.parse(dateString2 + " " + s1);

					System.out.println("ngay " + date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Date now = new Date();
				long getDiff = date.getTime() - now.getTime();
				long getDaysDiff = TimeUnit.MILLISECONDS.toMinutes(getDiff);
				int minute = (int) getDaysDiff;
				System.out.println("thoi gian " + minute);

//				kết thúc test
				session.save(chuyen);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm chuyến thành công!"));
				System.out.println(chuyen.getNgKH());
				System.out.println(xk.getLx());
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm chuyến thất bại!"));
				System.out.println(e.toString());
				transaction.rollback();
			} finally {
				session.close();
			}
			return "redirect:/quanly/chuyenxe.html";

		}

	}

	@RequestMapping("/tuyenxe")
	public String TuyenXe(ModelMap model) {
		List<TuyenXe> list = dstx();
		model.addAttribute("list", list);
		model.addAttribute("tuyen", new TuyenXe());
		return "QuanLy/tuyenxe";
	}

	@RequestMapping(value = "tuyenxe/{matuyen}.html", params = "trangthai", method = RequestMethod.GET)
	public String TuyenXeTrangThai(ModelMap model, @PathVariable("matuyen") String ma) {
		System.out.println("kvi29");
		model.addAttribute("idModal", "modalTT");
		List<TuyenXe> list = dstx();
		model.addAttribute("list", list);
		TuyenXe tuyen = tuyentheoid(ma);
		model.addAttribute("tuyen", tuyen);
		return "QuanLy/tuyenxe";
	}

	@RequestMapping(value = "tuyenxe/{matuyen}.html", params = "trangthai", method = RequestMethod.POST)
	public String TuyenXeTrangThai(@PathVariable("matuyen") String ma, @ModelAttribute("tuyen") TuyenXe tuyen,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("kvi4");
		TuyenXe tuyenxe = tuyentheoid(ma);
		tuyenxe.setTrangThai(tuyen.isTrangThai());

		try {
			session.merge(tuyenxe);
			t.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Thay đổi trạng thái thành công!"));

		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thay đổi trạng thái thất bại!"));

		} finally {
			session.close();
		}
		return "redirect:/quanly/tuyenxe.html";

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
		if (list.size() == 0) {
			return 1;
		}
		return 0;
	}

	// Thêm tuyến xe POST
	@RequestMapping(value = "/tuyenxe/insert", method = RequestMethod.POST)
	public String TuyenXeInsert(ModelMap model, HttpServletRequest request, @ModelAttribute("tuyen") TuyenXe tuyen,
			BindingResult errors, RedirectAttributes redirectAttributes) {
		int count = 0;
		/*
		 * if (tuyen.getMaTuyen().trim().length() == 0) { errors.rejectValue("maTuyen",
		 * "tuyen", "Mã tuyến không được để trống"); count = 1; } else if
		 * (checkmatuyentrung(tuyen.getMaTuyen()) == 0) { errors.rejectValue("maTuyen",
		 * "tuyen", "Mã tuyến đã tồn tại"); count = 1; }
		 */
		if (tuyen.getDiemDen().getMaDD().equals(tuyen.getDiemDi().getMaDD())) {
			errors.rejectValue("diemDen", "tuyen", "Điểm đi và đến không được trùng nhau");
			count = 1;
		} else if (checkddtuyentrung(tuyen.getDiemDi().getMaDD(), tuyen.getDiemDen().getMaDD()) == 0) {
			errors.rejectValue("diemDen", "tuyen", "Tuyến đã tồn tại");
			count = 1;
		}
		if (tuyen.getGiatuyen() == null) {
			errors.rejectValue("giatuyen", "tuyen", "Giá tuyến không được để trống");
			count = 1;
		} else if (tuyen.getGiatuyen().compareTo(new BigDecimal("0.00")) <= 0) {
			errors.rejectValue("giatuyen", "tuyen", "Giá tuyến không được nhỏ hơn 0");
			count = 1;
		} else if (Pattern.matches("[a-zA-Z]+", tuyen.getGiatuyen().toString()) == true) {
			errors.rejectValue("giatuyen", "tuyen", "Sai định dạng");
			count = 1;
		}
		if (String.valueOf(tuyen.getTgchay()).trim().length() == 0) {
			errors.rejectValue("tgchay", "tuyen", "Sai định dạng");
			count = 1;
		}
		if (tuyen.getTgchay() <= 0) {
			errors.rejectValue("tgchay", "tuyen", "Thời gian di chuyển không hợp lệ");
			count = 1;
		}

		if (count == 1) {
			List<TuyenXe> list = dstx();
			model.addAttribute("list", list);
			model.addAttribute("idModal", "modalCreate");
			List<DiaDiem> listdd = dsdd();
			model.addAttribute("listdd", listdd);
			System.out.println("vÃ´ Ä‘Ã¢y");
			return "QuanLy/tuyenxe";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			String matuyen = tuyen.getDiemDi().getMaDD() + "-" + tuyen.getDiemDen().getMaDD();
			System.out.println(tuyen.getMaTuyen());
			try {
//					tuyen = new TuyenXe();
//					tuyen.setMaTuyen(request.getParameter("matuyen"));
//					tuyen.setDiemDi(diadiemtheoid(request.getParameter("ddi")));
//					tuyen.setDiemDen(diadiemtheoid(request.getParameter("dden")));
//					tuyen.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
				tuyen.setTgchay(Integer.parseInt(request.getParameter("tgchay")));
				tuyen.setMaTuyen(matuyen);
				tuyen.setTrangThai(true);
				session.save(tuyen);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm tuyến thành công!"));
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm tuyến thất bại!"));
				System.out.println(e.toString());
				transaction.rollback();
			} finally {
				session.close();
			}
			return "redirect:/quanly/tuyenxe.html";
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
	public String TuyenXeUpdate(ModelMap model, @PathVariable("matuyen") String ma, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		TuyenXe tuyen = tuyentheoid(ma);
		int count = 0;
		if (request.getParameter("tgchay").trim().length() == 0) {
			model.addAttribute("messagetgchay", "thời gian chạy tuyến không được nhỏ hơn 0");
			count = 1;
		} else if (Integer.parseInt(request.getParameter("tgchay")) <= 0) {
			model.addAttribute("messagetgchay", "thời gian chạy tuyến không được nhỏ hơn 0");
			count = 1;
		} else if (Pattern.matches("[a-zA-Z]+", request.getParameter("tgchay")) == true) {
			model.addAttribute("messagetgchay", "Sai Định Dạng");
			count = 1;
		}
		if (request.getParameter("giatuyen").trim().length() == 0) {
			model.addAttribute("messagegia", "thời gian chạy tuyến không được để trống");
			count = 1;
		} else if (!request.getParameter("giatuyen").trim().matches("^[.0-9]*$")) {
			model.addAttribute("messagegia", "Sai định dạng");
			count = 1;
		} else if (Double.parseDouble(request.getParameter("giatuyen")) <= 0) {
			model.addAttribute("messagegia", "Giá trị không được nhỏ hơn 0");
			count = 1;
		}

		if (count == 1) {
			model.addAttribute("idModal", "modalUpdate");
			List<TuyenXe> list = dstx();
			model.addAttribute("list", list);
			model.addAttribute("tuyen", tuyen);
			return "QuanLy/tuyenxe";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {

				// tuyen.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));

				tuyen.setTgchay(Integer.parseInt(request.getParameter("tgchay")));
				tuyen.setGiatuyen(new BigDecimal(request.getParameter("giatuyen")));
				session.merge(tuyen);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Chỉnh sửa tuyến thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				redirectAttributes.addFlashAttribute("message", new Message("error", "Chỉnh sửa tuyến thất bại!"));
				transaction.rollback();
			} finally {
				session.close();
			}
			return "redirect:/quanly/tuyenxe.html";
		}
	}

	@RequestMapping("/nhanvien")
	public String NhanVien(ModelMap model, HttpSession ss) {
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("tkdn");
		if (tk != null) {
			if (!tk.getVaiTro().getMaVT().equals("QL")) {
				return "redirect:/quanly/trangchu.html";
			}
		}

		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien", nhanviens);
		model.addAttribute("nv", new NhanVien());
		return "QuanLy/nhanvien";
	}

	@RequestMapping(value = "/nhanvien/{manv}", params = "info")
	public String NhanVienInfo(ModelMap model, @PathVariable("manv") String ma, @ModelAttribute("nv") NhanVien nv) {
		model.addAttribute("idModal", "modalShow");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien", nhanviens);
		nv = nvtheoid(ma);
		model.addAttribute("nv", nv);
		return "QuanLy/nhanvien";
	}

	@RequestMapping(value = "/nhanvien/{manv}.html", params = "trangthai", method = RequestMethod.GET)
	public String NhanVienTrangThai(ModelMap model, @PathVariable("manv") String ma) {
		model.addAttribute("idModal", "modalTT");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien", nhanviens);
		NhanVien nv = nvtheoid(ma);
		model.addAttribute("nv", nv);
		return "QuanLy/nhanvien";
	}

	@RequestMapping(value = "/nhanvien/{manv}.html", params = "trangthai", method = RequestMethod.POST)
	public String NhanVienTrangThai(@PathVariable("manv") String ma, @ModelAttribute("nv") NhanVien nv,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();

		NhanVien nvien = nvtheoid(ma);
		nvien.getTknv().setTrangThai(nv.getTknv().getTrangThai());

		try {
			session.merge(nvien);
			transaction.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Thay đổi trạng thái thành công!"));

		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thay đổi trạng thái thất bại!"));
		} finally {
			session.close();
		}
		return "redirect:/quanly/nhanvien.html";

	}

	@RequestMapping(value = "/nhanvien/{manv}", params = "update", method = RequestMethod.GET)
	public String NhanVienupdate(ModelMap model, @PathVariable("manv") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien", nhanviens);
		NhanVien nv = nvtheoid(ma);
		System.out.println(nv.getTknv());
		model.addAttribute("nv", nv);
		model.addAttribute("ngaysinh", nv.getNgaySinh());
		return "QuanLy/nhanvien";
	}

	public int checktrungcccd(String ma, String manv) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien where cccd = '" + ma + "'";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		if (list.size() == 0 || list.size() != 0 && list.get(0).getMaNV().equals(manv) == true) {
			return 1;
		}
		return 0;
	}

//	if (!khachhang.getTkkh().getEmail().trim().matches(
//			"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
//		errors.rejectValue("tkkh.email", "KhachHang", "Vui lòng nhập đúng định dạng email!");
//	}
//if (!khachhang.getSdt().trim().matches("^[0-9]*$") || khachhang.getSdt().length() != 10) {
//		errors.rejectValue("sdt", "KhachHang", "Vui lòng nhập đúng định dạng số điện thoại!");
//	}
//	
	// update nvien chi thay doi trang thai
	// update sai error
	public int checksdt(String sdt, String manv) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien where sdt = '" + sdt + "'";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		if (list.size() == 0 || list.size() != 0 && list.get(0).getMaNV().equals(manv) == true) {
			return 1;
		}
		return 0;
	}

	@RequestMapping(value = "/nhanvien/{manv}", params = "update", method = RequestMethod.POST)
	public String NhanVienupdate(ModelMap model, @PathVariable("manv") String ma, @ModelAttribute("nv") NhanVien nv,
			HttpServletRequest request, BindingResult errors, RedirectAttributes redirectAttributes) {

		if (nv.getHoNV().length() == 0) {
			errors.rejectValue("hoNV", "nv", "Không Được Để Trống");
		}
		if (nv.getTenNV().trim().length() == 0) {
			errors.rejectValue("tenNV", "nv", "Không Được Để Trống");
		}
		if (!nv.getSdt().trim().matches("^[0-9]*$") || request.getParameter("sdt").length() != 10) {
			errors.rejectValue("sdt", "nv", "Vui lòng nhập đúng định dạng sdt");
		} else if (checksdt(nv.getSdt(), ma) == 0) {
			errors.rejectValue("sdt", "nv", "sdt bị trùng");
		}
		if (nv.getCccd().trim().length() == 0) {
			errors.rejectValue("cccd", "nv", "Không được để trống");
		} else if (!nv.getCccd().trim().matches("^[0-9]*$") || request.getParameter("cccd").length() != 10) {
			errors.rejectValue("cccd", "nv", "Vui lòng nhập đúng định dạng cccd");
		} else if (checktrungcccd(nv.getCccd(), ma) == 0) {
			errors.rejectValue("cccd", "nv", "CCCD Đã Tồn Tại");
		}
		if (request.getParameter("ngaysinh") == "") {
			errors.rejectValue("ngaySinh", "nv", "Không Được Để Trống");
		}
		if (errors.hasErrors()) {
			model.addAttribute("idModal", "modalUpdate");
			List<NhanVien> nhanviens = dsnv();
			model.addAttribute("nhanvien", nhanviens);
			nv = nvtheoid(ma);
			model.addAttribute("ngaysinh", nv.getNgaySinh());
			return "QuanLy/nhanvien";
		} else {
			System.out.println(nv.getTknv().getUserName());
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngSinh"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				nv.setNgaySinh(sql);
				nv.setPhai(Boolean.parseBoolean(request.getParameter("gridRadios")));

				session.update(nv);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật dữ liệu thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật dữ liệu thất bại!"));
			} finally {
				session.close();
			}

			return "redirect:/quanly/nhanvien.html";

		}

	}

	@RequestMapping(value = "/nhanvien/insert", method = RequestMethod.GET)
	public String NhanVienInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<NhanVien> nhanviens = dsnv();
		model.addAttribute("nhanvien", nhanviens);
		NhanVien nv = new NhanVien();
		nv.setMaNV(taoMa("NV", "NhanVien", "maNV"));
		model.addAttribute("nv", nv);
		return "QuanLy/nhanvien";
	}

	public int checkemail(String email, String username) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan where email = '" + email + "'";
		Query query = session.createQuery(hql);
		List<TaiKhoan> list = query.list();
		if (list.size() == 0 || list.size() != 0 && list.get(0).getUserName().equals(username) == true) {
			return 1;
		}
		return 0;
	}
	// check email trung + cccd + sdt + username là manv + username duy nhat

	@RequestMapping(value = "/nhanvien/insert", method = RequestMethod.POST)
	public String NhanVienInsert(ModelMap model, @ModelAttribute("nv") NhanVien nv, HttpServletRequest request,
			BindingResult errors, RedirectAttributes redirectAttributes) {
		if (nv.getHoNV().trim().length() == 0) {
			errors.rejectValue("hoNV", "nv", "Họ nhân viên không được để trống");
		}
		if (nv.getTenNV().trim().length() == 0) {
			errors.rejectValue("tenNV", "nv", "Tên nhân viên không được để trống");
		}
		if (!nv.getSdt().trim().matches("^[0-9]*$") || nv.getSdt().length() != 10) {
			errors.rejectValue("sdt", "nv", "Vui lòng nhập đúng định dạng sdt");
		} else if (checksdt(nv.getSdt(), nv.getMaNV()) == 0) {
			errors.rejectValue("sdt", "nv", "sdt bị trùng");
		}
		if (nv.getCccd().trim().length() == 0) {
			errors.rejectValue("cccd", "nv", "Không được để trống");
		} else if (!nv.getCccd().trim().matches("^[0-9]*$") || nv.getCccd().length() != 10) {
			errors.rejectValue("cccd", "nv", "Vui lòng nhập đúng định dạng cccd");
		} else if (checktrungcccd(nv.getCccd(), nv.getMaNV()) == 0) {
			errors.rejectValue("cccd", "nv", "CCCD Đã Tồn Tại");
		}
		if (request.getParameter("username").trim().length() == 0) {
			errors.rejectValue("maNV", "nv", "Username không để trống");
		}

		if (request.getParameter("email").trim().length() == 0) {
			errors.rejectValue("phai", "nv", "Email không được để trống");
		} else if (checkemail(request.getParameter("email"), nv.getMaNV()) == 0) {
			errors.rejectValue("phai", "nv", "Email đã tồn tại");

		}
		if (request.getParameter("ngaysinh").trim().length() == 0) {
			errors.rejectValue("ngaySinh", "nv", "Ngày sinh không được để trống");
		}
		if (errors.hasErrors()) {
			model.addAttribute("idModal", "modalCreate");
			List<NhanVien> nhanviens = dsnv();
			model.addAttribute("nhanvien", nhanviens);
			nv.setMaNV(taoMa("NV", "NhanVien", "maNV"));
			return "QuanLy/nhanvien";
		} else {

			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				TaiKhoan tk = new TaiKhoan();
				VaiTro vt = vaitrotheoid("NV");
				tk.setUserName(nv.getMaNV());
				tk.setTrangThai(2);
				tk.setVaiTro(vt);
				tk.setEmail(request.getParameter("email"));
				String[] words = request.getParameter("ngaysinh").split("-");
				String pw = words[0] + words[1] + words[2];
				
				tk.setMatKhau(hashPass(pw));
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngaysinh"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				nv.setNgaySinh(sql);
				nv.setTknv(tk);
				session.save(tk);
				session.save(nv);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm mới thành công!"));

			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm mới thất bại!"));
			} finally {
				session.close();
			}

			return "redirect:/quanly/nhanvien.html";

		}

	}

	@RequestMapping("/khachhang")
	public String KhachHang(ModelMap model) {
		List<KhachHang> khachhangs = dskh();
		model.addAttribute("dskh", khachhangs);
		model.addAttribute("kh", new KhachHang());
		return "QuanLy/khachhang";
	}

	@RequestMapping(value = "/khachhang/{makh}.html", params = "trangthai", method = RequestMethod.GET)
	public String KhachHangTrangThai(ModelMap model, @PathVariable("makh") String ma) {
		model.addAttribute("idModal", "modalTT");
		List<KhachHang> list = dskh();
		model.addAttribute("list", list);
		KhachHang kh = khtheoid(ma);
		model.addAttribute("kh", kh);
		List<KhachHang> khachhangs = dskh();
		model.addAttribute("dskh", khachhangs);
		return "QuanLy/khachhang";
	}

	@RequestMapping(value = "/khachhang/{makh}.html", params = "trangthai", method = RequestMethod.POST)
	public String KhachHangTrangThai(@PathVariable("makh") String ma, @ModelAttribute("kh") KhachHang kh,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		KhachHang khang = khtheoid(ma);
		khang.getTkkh().setTrangThai(kh.getTkkh().getTrangThai());
		try {

			session.merge(khang);
			transaction.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Thay đổi trạng thái thành công!"));
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thay đổi trạng thái thất bại!"));
		} finally {
			session.close();
		}
		return "redirect:/quanly/khachhang.html";

	}

	@RequestMapping(value = "/khachhang/{makh}", params = "update", method = RequestMethod.GET)
	public String KhachHangupdate(ModelMap model, @PathVariable("makh") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<KhachHang> khachhangs = dskh();
		model.addAttribute("dskh", khachhangs);
		KhachHang kh = khtheoid(ma);
		model.addAttribute("kh", kh);
		return "QuanLy/khachhang";
	}

	@RequestMapping(value = "/khachhang/{makh}", params = "update", method = RequestMethod.POST)
	public String KhachHangupdate(ModelMap model, @PathVariable("makh") String ma, @ModelAttribute("kh") KhachHang kh,
			HttpServletRequest request, BindingResult errors, RedirectAttributes redirectAttributes) {
		Session ss = factory.getCurrentSession();
		NhanVien nv = (NhanVien) ss.get(NhanVien.class, ma);

		if (request.getParameter("hoKH").trim().length() == 0) {

			errors.rejectValue("hoKH", "kh", "Không Được Để Trống");
		}
		if (request.getParameter("tenKH").trim().length() == 0) {
			errors.rejectValue("tenKH", "kh", "Không Được Để Trống");
		}

		if (Pattern.matches("[a-zA-Z]+", request.getParameter("sdt")) == true) {
			errors.rejectValue("sdt", "kh", "Số Điện Thoại Không Có Kí Tự Chữ");
		} else if (request.getParameter("sdt").length() > 10) {
			errors.rejectValue("sdt", "kh", "Số Điện Thoại Không Quá 10 Kí Tự");
		}
		if (nv.getCccd().trim().length() == 0) {
			errors.rejectValue("cccd", "nv", "Không Được Để Trống");
		} else if (Pattern.matches("[a-zA-Z]+", nv.getCccd()) == false) {
			errors.rejectValue("cccd", "nv", "Mục Không Chứa Kí Tự Chữ");
			if (!request.getParameter("sdt").trim().matches("^[0-9]*$") || request.getParameter("sdt").length() != 10) {
				errors.rejectValue("sdt", "kh", "Vui lòng nhập đúng định dạng sdt");
			} else if (checksdt(request.getParameter("sdt"), ma) == 0) {
				errors.rejectValue("sdt", "kh", "sdt bị trùng");
			}
			if (request.getParameter("username").trim().length() == 0) {
				errors.rejectValue("maNV", "kh", "Không Được Để Trống");
			}
			if (request.getParameter("email").trim().length() == 0) {
				errors.rejectValue("phai", "kh", "Không Được Để Trống");
			}
			if (errors.hasErrors()) {
				model.addAttribute("idModal", "modalUpdate");
				List<KhachHang> khachhangs = dskh();
				model.addAttribute("dskh", khachhangs);
				kh = khtheoid(ma);
				return "QuanLy/khachhang";

			} else {

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
//					tk.setTrangThai(Integer.parseInt(request.getParameter("trangthai")));

					session.update(tk);
					session.update(kh);
					transaction.commit();
					redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công!"));
				} catch (Exception e) {
					System.out.println(e.toString());
					transaction.rollback();
					redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật thất bại!"));
				} finally {
					session.close();
				}

			}
		}

		return "redirect:/quanly/khachhang.html";

	}

	@RequestMapping("/diadiem")
	public String DiaDiem(ModelMap model) {
		List<DiaDiem> dsdd = dsdd();
		model.addAttribute("dsdd", dsdd);
		model.addAttribute("dd", new DiaDiem());
		return "QuanLy/diadiem";
	}

	@RequestMapping(value = "/diadiem/{madd}", params = "update", method = RequestMethod.GET)
	public String DDupdate(ModelMap model, @PathVariable("madd") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<DiaDiem> dsdd = dsdd();
		model.addAttribute("dsdd", dsdd);
		DiaDiem dd = diadiemtheoid(ma);
		model.addAttribute("dd", dd);
		return "QuanLy/diadiem";
	}

	public int checktrungtendd(String diadiem, String madd) {
		Session session = factory.getCurrentSession();
		String hql = "from DiaDiem where diaDiem = :diadiem";
		Query query = session.createQuery(hql);
		query.setParameter("diadiem", diadiem);
		List<DiaDiem> list = query.list();
		if (list.size() == 0 || list.get(0).getMaDD().equals(madd) == true && list.size() != 0) {
			return 1;
		}
		return 0;
	}

	// check trung ten địa điểm
	@RequestMapping(value = "/diadiem/{madd}", params = "update", method = RequestMethod.POST)
	public String DDupdate(ModelMap model, @PathVariable("madd") String ma, @ModelAttribute("dd") DiaDiem dd,
			HttpServletRequest request, BindingResult errors, RedirectAttributes redirectAttributes) {
		if (dd.getDiaDiem().equals("")) {
			errors.rejectValue("diaDiem", "dd", "Không được để trống");

		} else if (checktrungtendd(dd.getDiaDiem(), dd.getMaDD()) == 0) {
			errors.rejectValue("diaDiem", "dd", "Tên Địa Điểm Đã Trùng");

		}
		if (errors.hasErrors()) {
			model.addAttribute("idModal", "modalUpdate");
			List<DiaDiem> dsdd = dsdd();
			model.addAttribute("dsdd", dsdd);
			dd = diadiemtheoid(ma);
			return "QuanLy/diadiem";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.update(dd);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật thất bại!"));
			} finally {
				session.close();
			}

			return "redirect:/quanly/diadiem.html";

		}
	}

	@RequestMapping(value = "/diadiem/insert", method = RequestMethod.GET)
	public String DDInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<DiaDiem> dsdd = dsdd();
		model.addAttribute("dsdd", dsdd);
		DiaDiem dd = new DiaDiem();
		model.addAttribute("dd", dd);
		return "QuanLy/diadiem";
	}

	public int checktrungmadd(String diadiem) {
		Session session = factory.getCurrentSession();
		String hql = "from DiaDiem where maDD = '" + diadiem + "'";
		Query query = session.createQuery(hql);
		List<DiaDiem> list = query.list();
		if (list.size() == 0) {
			return 1;
		}
		return 0;
	}

	// Tên địa điểm là duy nhất + mã địa điểm không trùng
	@RequestMapping(value = "/diadiem/insert", method = RequestMethod.POST)
	public String DDInsert(ModelMap model, @ModelAttribute("dd") DiaDiem dd, HttpServletRequest request,
			BindingResult errors, RedirectAttributes redirectAttributes) {
		if (dd.getDiaDiem().equals("")) {
			errors.rejectValue("diaDiem", "dd", "Không được để trống");

		} else if (checktrungtendd(dd.getDiaDiem(), dd.getMaDD()) == 0) {
			errors.rejectValue("diaDiem", "dd", "Tên Địa Điểm Đã Tồn Tại");
		}
		if (dd.getMaDD().equals("")) {
			errors.rejectValue("maDD", "dd", "Không được để trống");
		} else if (checktrungmadd(dd.getMaDD()) == 0) {
			errors.rejectValue("maDD", "dd", "Mã Địa Điểm Đã Tồn Tại");

		}
		if (errors.hasErrors()) {
			model.addAttribute("idModal", "modalCreate");
			List<DiaDiem> dsdd = dsdd();
			model.addAttribute("dsdd", dsdd);
			return "QuanLy/diadiem";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.save(dd);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm mới thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm mới thất bại!"));
			} finally {
				session.close();
			}
			return "redirect:/quanly/diadiem.html";
		}

	}

	public int checkddtuyentrung(String diemdi, String diemDen) {
		Session session = factory.getCurrentSession();
		String hql = "from TuyenXe t where t.diemDi.maDD = :diemdi and t.diemDen .maDD = :diemden";
		Query query = session.createQuery(hql);
		query.setParameter("diemden", diemDen);
		query.setParameter("diemdi", diemdi);
		List<TuyenXe> list = query.list();
		if (list.size() == 0) {
			return 1;
		}
		return 0;
	}

	@RequestMapping("/loaixe")
	public String LoaiXe(ModelMap model) {
		List<LoaiXe> dslx = dslx();
		model.addAttribute("dslx", dslx);
		model.addAttribute("lx", new LoaiXe());
		return "QuanLy/loaixe";
	}

	public int checkmalx(String malx) {
		Session session = factory.getCurrentSession();
		String hql = "from LoaiXe where maLX = '" + malx + "'";
		Query query = session.createQuery(hql);
		List<LoaiXe> list = query.list();
		if (list.size() == 0) {
			return 1;
		}
		return 0;
	}

	@RequestMapping(value = "/loaixe/{malx}", params = "update", method = RequestMethod.GET)
	public String LXupdate(ModelMap model, @PathVariable("malx") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<LoaiXe> dslx = dslx();
		model.addAttribute("dslx", dslx);
		LoaiXe lx = lxtheoid(ma);
		model.addAttribute("lx", lx);
		return "QuanLy/loaixe";
	}

	public int checktenlxtrung(String ma, String malx) {
		Session session = factory.getCurrentSession();
		String hql1 = "from LoaiXe where tenLX = :id";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("id", ma);
		List<LoaiXe> list1 = query1.list();
		if (list1.size() == 0 || list1.get(0).getMaLX().equals(malx) && list1.size() != 0) {
			return 1;
		}
		return 0;
	}

	// update Loại xe post
	@RequestMapping(value = "/loaixe/{malx}", params = "update", method = RequestMethod.POST)
	public String LXupdate(ModelMap model, @PathVariable("malx") String ma, @ModelAttribute("lx") LoaiXe lx,
			HttpServletRequest request, BindingResult errors, RedirectAttributes redirectAttributes) {
		int count = 0;
		if (lx.getGiaLX() == null) {
			errors.rejectValue("giaLX", "lx", "Không được để trống");
			count = 1;
		} else if (Double.parseDouble(lx.getGiaLX().toString()) <= 0) {
			errors.rejectValue("giaLX", "lx", "Giá phải lớn hơn 0");
			count = 1;
		} else if (!lx.getGiaLX().toString().trim().matches("^[.0-9]*$")) {
			errors.rejectValue("giaLX", "lx", "Sai định dạng");
			count = 1;
		}
		if (lx.getTenLX().trim().length() == 0) {
			errors.rejectValue("tenLX", "lx", "Không được để trống");
			count = 1;
		} else if (checktenlxtrung(lx.getTenLX(), lx.getMaLX()) == 0) {
			errors.rejectValue("tenLX", "lx", "Tên Loại Xe Đã Tồn Tại");
			count = 1;
		}
		if (lx.getSeat() <= 0) {
			errors.rejectValue("seat", "lx", "Số chỗ phải lớn hơn 0");
			count = 1;
		}

		if (count == 1) {
			model.addAttribute("idModal", "modalUpdate");
			List<LoaiXe> dslx = dslx();
			model.addAttribute("dslx", dslx);
			lx = lxtheoid(ma);
			return "QuanLy/loaixe";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.update(lx);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật thất bại!"));
			} finally {
				session.close();
			}
			return "redirect:/quanly/loaixe.html";

		}
	}

	@RequestMapping(value = "/loaixe/insert", method = RequestMethod.GET)
	public String LXInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<LoaiXe> dslx = dslx();
		model.addAttribute("dslx", dslx);
		LoaiXe lx = new LoaiXe();
		model.addAttribute("lx", lx);
		return "QuanLy/loaixe";
	}

	public int checkmalxtrung(String ma) {
		Session session = factory.getCurrentSession();
		String hql1 = "from LoaiXe where maLX = '" + ma + "'";
		Query query1 = session.createQuery(hql1);
		List<LoaiXe> list1 = query1.list();
		if (list1.size() == 0) {
			return 1;
		}
		return 0;
	}

	// so ghe = 36 auto
	// Them loai xe post
	@RequestMapping(value = "/loaixe/insert", method = RequestMethod.POST)
	public String LXInsert(ModelMap model, @ModelAttribute("lx") LoaiXe lx, HttpServletRequest request,
			BindingResult errors, RedirectAttributes redirectAttributes) {
		int count = 0;
		if (lx.getMaLX().trim().length() == 0) {
			errors.rejectValue("maLX", "lx", "Không được để trống");
			count = 1;
		} else if (checkmalxtrung(lx.getMaLX()) == 0) {
			errors.rejectValue("maLX", "lx", "Mã loại xe đã tồn tại");
			count = 1;
		}
		if (lx.getTenLX().trim().length() == 0) {
			errors.rejectValue("tenLX", "lx", "Không được để trống");
			count = 1;
		} else if (checktenlxtrung(lx.getTenLX(), lx.getMaLX()) == 0) {
			errors.rejectValue("tenLX", "lx", "Tên loại xe đã tồn tại");
			count = 1;
		}
		if (lx.getGiaLX() == null) {
			errors.rejectValue("giaLX", "lx", "Không được để trống");
			count = 1;
		} else if (Double.parseDouble(lx.getGiaLX().toString()) <= 0) {
			errors.rejectValue("giaLX", "lx", "Giá Loại Xe > 0");
			count = 1;
		} else if (Pattern.matches("[a-zA-Z]+", lx.getGiaLX().toString()) == true) {
			errors.rejectValue("giaLX", "lx", "Sai định dạng");
			count = 1;
		}
		if (lx.getSeat() <= 0) {
			errors.rejectValue("seat", "lx", "Số chỗ phải lớn hơn 0");
			count = 1;
		}
		if (count == 1) {
			model.addAttribute("idModal", "modalCreate");
			List<LoaiXe> dslx = dslx();
			model.addAttribute("dslx", dslx);
			return "QuanLy/loaixe";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {

				session.save(lx);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm mới thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm mới thất bại!"));
			} finally {
				session.close();
			}

			return "redirect:/quanly/loaixe.html";

		}

	}

	public List<PhieuDat> dspds(String macx, int trangthai) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat pd where pd.chuyen.maChuyen = :macx and pd.trangThai = :TT";
		Query query = session.createQuery(hql);
		query.setParameter("macx", macx);
		query.setParameter("TT", trangthai);
		List<PhieuDat> list = query.list();
		return list;
	}

	public List<PhieuDat> dspdcx(String macx) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat pd where pd.chuyen.maChuyen = :macx";
		Query query = session.createQuery(hql);
		query.setParameter("macx", macx);
		List<PhieuDat> list = query.list();
		return list;
	}

	public List<PhieuDat> dspdtt(int trangthai) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuDat pd where pd.trangThai = :TT";
		Query query = session.createQuery(hql);
		query.setParameter("TT", trangthai);
		List<PhieuDat> list = query.list();
		return list;
	}

	@RequestMapping("/phieudat")
	public String PhieuDat(ModelMap model) {
		List<PhieuDat> ds = dspd();
		model.addAttribute("dspd", ds);
		model.addAttribute("pd", new PhieuDat());
		List<ChuyenXe> dsc = dscx();
		model.addAttribute("xe", dsc);
		return "QuanLy/phieudat";
	}

	String xekhach = "all", trangthai = "3";

	@RequestMapping(value = "/phieudat/search", method = RequestMethod.POST)
	public String PhieuDatSearch(ModelMap model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		model.addAttribute("pd", new PhieuDat());
		if (request.getParameter("xekhach").equals("all") && request.getParameter("trangthai").equals("3")) {
			List<PhieuDat> ds = dspd();
			model.addAttribute("dspd", ds);
		} else if (request.getParameter("xekhach").equals("all")) {
			List<PhieuDat> ds = dspdtt(Integer.parseInt(request.getParameter("trangthai")));
			model.addAttribute("dspd", ds);
		} else if (request.getParameter("trangthai").equals("3")) {
			List<PhieuDat> ds = dspdcx(request.getParameter("xekhach"));
			model.addAttribute("dspd", ds);
		} else {
			List<PhieuDat> ds = dspds(request.getParameter("xekhach"),
					Integer.parseInt(request.getParameter("trangthai")));
			model.addAttribute("dspd", ds);
		}
		xekhach = request.getParameter("xekhach");
		trangthai = request.getParameter("trangthai");
		List<ChuyenXe> dsc = dscx();
		model.addAttribute("xe", dsc);
		System.out.println(request.getParameter("xekhach"));

		return "QuanLy/phieudat";
	}

	@RequestMapping(value = "/phieudat/{mapd}", params = "info")
	public String PhieuDatInfo(ModelMap model, @PathVariable("mapd") String ma, @ModelAttribute("pd") PhieuDat pd) {
		model.addAttribute("idModal", "modalShow");
		if (xekhach.equals("all") && trangthai.equals("3")) {
			List<PhieuDat> ds = dspd();
			model.addAttribute("dspd", ds);
		} else if (xekhach.equals("all")) {
			List<PhieuDat> ds = dspdtt(Integer.parseInt(trangthai));
			model.addAttribute("dspd", ds);
		} else if (trangthai.equals("3")) {
			List<PhieuDat> ds = dspdcx(xekhach);
			model.addAttribute("dspd", ds);
		} else {
			List<PhieuDat> ds = dspds(xekhach, Integer.parseInt(trangthai));
			model.addAttribute("dspd", ds);
		}
		pd = phieudattheoma(ma);
		List<VeXe> dsvx = vexetheomapd(ma);
		model.addAttribute("pd", pd);
		Map<Integer, String> vx = new HashMap<Integer, String>();
		for (int i = 0; i < dsvx.size(); i++) {
			int k = i + 1;
			vx.put(k, dsvx.get(i).getId().getSoGhe());
		}
		model.addAttribute("vx", vx);
		List<ChuyenXe> dsc = dscx();
		model.addAttribute("xe", dsc);
		return "QuanLy/phieudat";
	}

	@RequestMapping(value = "/phieudat/{mapd}", params = "update", method = RequestMethod.GET)
	public String PhieuDatupdate(ModelMap model, @PathVariable("mapd") String ma) {
		System.out.println("vitester");
		model.addAttribute("idModal", "modalUpdate");
		if (xekhach.equals("all") && trangthai.equals("3")) {
			List<PhieuDat> ds = dspd();
			model.addAttribute("dspd", ds);
		} else if (xekhach.equals("all")) {
			List<PhieuDat> ds = dspdtt(Integer.parseInt(trangthai));
			model.addAttribute("dspd", ds);
		} else if (trangthai.equals("3")) {
			List<PhieuDat> ds = dspdcx(xekhach);
			model.addAttribute("dspd", ds);
		} else {
			List<PhieuDat> ds = dspds(xekhach, Integer.parseInt(trangthai));
			model.addAttribute("dspd", ds);
		}
		PhieuDat pd = phieudattheoma(ma);
		model.addAttribute("pd", pd);
		List<ChuyenXe> dsc = dscx();
		model.addAttribute("xe", dsc);
		return "QuanLy/phieudat";
	}

	@RequestMapping(value = "/phieudat/{mapd}", params = "update", method = RequestMethod.POST)
	public String PhieuDatupdate(@PathVariable("mapd") String ma, @ModelAttribute("pd") PhieuDat pd,
			RedirectAttributes redirectAttributes, HttpSession ss) {

		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		NhanVien nv = (NhanVien) ss.getAttribute("user");
		System.out.println(nv.getMaNV());
		try {
			PhieuDat pdat = phieudattheoma(ma);
			pdat.setTrangThai(pd.getTrangThai());
			pdat.setNV(nv);
			session.merge(pdat);

			redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật trạng thái thành công!"));
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);

			if (pd.getTrangThai() == 1) {
				try {

					helper.setFrom("no-reply-email");
					helper.setTo(/* email */"n19dccn223@student.ptithcm.edu.vn");
					helper.setSubject("Xác nhận thanh toán");
					helper.setText(
							
" <div style=\"padding-bottom: 10rem;background-color: #f1f1f1; font-family: 'Roboto', sans-serif;\r\n"
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
+ "            <p style=\"margin: 1rem 0;\">Xin chào,</p>\r\n"
+ "            <p style=\"margin: 1rem 0 0.3rem 0;\">Vé xe "+pdat.getMaPD()+" của chuyến xe <span style=\"color: red;\">"+pdat.getChuyen().getMaChuyen()+"</span>\r\n"
+ "                đã được thanh toán thành công\r\n"
+ "            </p>\r\n"
+ "            <p> Nếu có bất kì sự bất tiện nào, vui lòng liên hệ bộ phận hỗ trợ của chúng tôi qua email hotro@gmail.com\r\n"
+ "                hoặc\r\n"
+ "                012344343\r\n"
+ "            </p>\r\n"
+ "            <p>Click vào nút bên dưới để quay lại trang web</p>\r\n"
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
+ "    </div>",
					true);
							
					/* ); */
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				mailer.send(mail);
			} else if (pd.getTrangThai() == 2) {
				tangchotrong(pdat.getChuyen().getMaChuyen(), getslvebypd(pdat.getMaPD()));
				try {
					helper.setFrom("no-reply-email");
					helper.setTo(/* email */"n19dccn223@student.ptithcm.edu.vn");
					helper.setSubject("Hủy vé");
					helper.setText("<div style=\"padding-bottom: 10rem;background-color: #f1f1f1; font-family: 'Roboto', sans-serif;\r\n"
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
							+ "            <p style=\"margin: 1rem 0;\">Xin chào,</p>\r\n"
							+ "            <p style=\"margin: 1rem 0 0.3rem 0;\">Vé xe "+ma+" của bạn đã bị hủy</span>\r\n"
							+ "                mà bạn đặt đã bị chúng tôi hủy vé\r\n"
							+ "            </p>\r\n"
							+ "            <p> Nếu đây là một sự nhầm lẫn, vui lòng liên hệ bộ phận hỗ trợ của chúng tôi qua email hotro@gmail.com hoặc\r\n"
							+ "                012344343\r\n"
							+ "            </p>\r\n"
							+ "            <p>Click vào nút bên dưới để quay lại trang web</p>\r\n"
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
							+ "    </div>",true);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				mailer.send(mail);
			}
			transaction.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Thay đổi trạng thái thành công!"));
		} catch (Exception e) {
			System.out.println(e.toString());
			transaction.rollback();
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thay đổi trạng thái thất bại!"));
		} finally {
			session.close();
		}
		return "redirect:/quanly/phieudat.html";

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
		NhanVien nv = (NhanVien) ss.getAttribute("user");
		model.addAttribute("nv", nv);
		model.addAttribute("ngaysinh", nv.getNgaySinh());
		return "QuanLy/profile";
	}

	@RequestMapping(value = "/trangcanhan", params = "doithongtin", method = RequestMethod.POST)
	public String ProfileUpdate(ModelMap model, @ModelAttribute("nv") NhanVien nv, HttpSession ss,
			HttpServletRequest request, BindingResult errors, RedirectAttributes redirectAttributes) {
		if (nv.getCccd().trim().length() == 0) {
			errors.rejectValue("sdt", "nv", "SDT không để trống");
		} else if (!nv.getSdt().trim().matches("^[0-9]*$") || nv.getSdt().length() != 10) {
			errors.rejectValue("sdt", "nv", "Vui lòng nhập đúng định dạng sdt");
		} else if (checksdt(nv.getSdt(), nv.getMaNV()) == 0) {
			errors.rejectValue("sdt", "nv", "sdt bị trùng");
		}
		if (nv.getCccd().trim().length() == 0) {
			errors.rejectValue("cccd", "nv", "CCCD không để trống");
		} else if (!nv.getCccd().trim().matches("^[0-9]*$") || nv.getCccd().length() != 10) {
			errors.rejectValue("cccd", "nv", "Vui lòng nhập đúng định dạng cccd");
		} else if (checktrungcccd(nv.getCccd(), nv.getMaNV()) == 0) {
			errors.rejectValue("cccd", "nv", "CCCD Đã Tồn Tại");
		}
		if (nv.getTknv().getEmail().trim().length() == 0) {
			errors.rejectValue("maNV", "nv", "Email không được để trống");
		} else if (checkemail(nv.getTknv().getEmail(), nv.getTknv().getUserName()) == 0) {
			errors.rejectValue("maNV", "nv", "Email đã tồn tại");

		} else if (!nv.getTknv().getEmail().trim().matches(
				"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			errors.rejectValue("maNV", "nv", "Chưa đúng định dạng email");
		}
		if (nv.getHoNV().trim().length() == 0) {
			errors.rejectValue("hoNV", "nv", "Họ nhân viên không để trống");
		}
		if (nv.getTenNV().trim().length() == 0) {
			errors.rejectValue("tenNV", "nv", "Tên nhân viên không để trống");
		}
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed1 = null;
		System.out.println(request.getParameter("ngsinh"));

		try {
			parsed1 = format1.parse(request.getParameter("ngsinh"));
		} catch (ParseException e1) {
			System.out.println("vo day");
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		java.sql.Date sql1 = new java.sql.Date(parsed1.getTime());
		if (sql1.after(new Date())) {
			errors.rejectValue("ngaySinh", "nv", "Ngày Tháng Không Được Để Lớn Hơn Ngày Hiện Tại");

		}

		if (errors.hasErrors()) {
			nv = (NhanVien) ss.getAttribute("user");
			model.addAttribute("ngaysinh", nv.getNgaySinh());
			System.out.println("vô đya");
			model.addAttribute("tabEditProfile", true);
			return "QuanLy/profile";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("ngsinh"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				nv.setNgaySinh(sql);
				session.update(nv);
				ss.setAttribute("user", nv);
				transaction.commit();
				System.out.println("vô đya 1");
				System.out.println(nv.getCccd());
				redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật thất bại!"));
				transaction.rollback();
			} finally {
				session.close();
			}

			return "redirect:/quanly/trangcanhan.html";
		}
	}

//	@RequestMapping(value = "/trangcanhan/changepw", method = RequestMethod.GET)
//	public String ChangePW(ModelMap model, HttpSession ss, HttpServletRequest request) {
//		NhanVien nv = (NhanVien) ss.getAttribute("user");
//		int count = 0;
//		TaiKhoan tk = tktheousername(nv.getTknv().getUserName());
//		String s = "";
//		if (request.getParameter("password").equals(tk.getMatKhau())) {
//			s = "Máº­t Kháº©u Hiá»‡n Táº¡i Bá»‹ Sai";
//			count++;
//		} else if (request.getParameter("newpassword").equals("renewpassword") == false) {
//			s = "Máº­t Kháº©u Má»›i KhÃ´ng Khá»›p Vá»›i Nhau";
//			count++;
//		}
//		if (count == 0) {
//			model.addAttribute("message", s);
//			return "QuanLy/profile";
//		} else {
//			Session session = factory.openSession();
//			Transaction transaction = session.beginTransaction();
//			try {
//				tk.setMatKhau(request.getParameter("newpassword"));
//				session.update(tk);
//				transaction.commit();
//			} catch (Exception e) {
//				System.out.println(e.toString());
//				transaction.rollback();
//			} finally {
//				session.close();
//			}
//
//			return "redirect:/quanly/trangcanhan.html";
//		}
//
//	}

//////////////////////////////////////////////////////////////////

	@RequestMapping(value = "trangcanhan.html", params = "doimatkhau", method = RequestMethod.POST)
	public String doimatkhau(@RequestParam("pw") String pw, @RequestParam("rpw") String rpw,
			@RequestParam("password") String password, ModelMap model, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		boolean check = false;
		HttpSession ss = request.getSession();
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("tkdn");
		if (!hashPass(password).equals(tk.getMatKhau())) {
			model.addAttribute("messpassword", "Mật khẩu không trùng khớp!");
			check = true;
		}
		if (!rpw.equals(pw)) {
			model.addAttribute("messrpw", "Mật khẩu và nhập mật khẩu lại không trùng khớp!");
			check = true;
		}
		if (rpw.length() < 6) {
			model.addAttribute("messpw", "Mật khẩu không được bé hơn 6 kí tự!");
			check = true;
		}

		if (rpw.isEmpty()) {
			model.addAttribute("messrpw", "Dữ liệu không được để trống!");
			check = true;
		}
		if (pw.isEmpty()) {
			model.addAttribute("messpw", "Dữ liệu không được để trống!");
			check = true;
		}
		if (check) {
			NhanVien nv = (NhanVien) ss.getAttribute("user");
			model.addAttribute("nv", nv);
			model.addAttribute("ngaysinh", nv.getNgaySinh());
			model.addAttribute("tabEditPassword", true);
			return "QuanLy/profile";
		}
		String matkhaumoi = hashPass(pw);
		tk.setMatKhau(matkhaumoi);
		tk.setTrangThai(1);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(tk);
			t.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Đổi mật khẩu thành công"));
			redirectAttributes.addFlashAttribute("tabEditPassword", true);
		} catch (Exception e) {
			System.out.println(e.getCause());
			t.rollback();
			model.addAttribute("message", new Message("error", "Đổi mật khẩu thất bại!"));
			model.addAttribute("tabEditPassword", true);
			return "QuanLy/profile";
		} finally {
			session.close();
		}
		return "redirect:/quanly/trangcanhan.html";
	}

	public String hashPass(String matKhau) {
		String hashpw = DigestUtils.md5Hex(matKhau).toUpperCase();
		return hashpw;
	}
	@RequestMapping(value = "/xekhach")
	public String xekhach(ModelMap model) {
		List<XeKhach> dsxekhach = dsxk();
		model.addAttribute("ds", dsxekhach);
		model.addAttribute("xk", new XeKhach());
		return "QuanLy/xekhach";
	}
	
	public XeKhach xktheoid(String ma) {
		Session session = factory.getCurrentSession();
		XeKhach vt = (XeKhach) session.load(XeKhach.class, ma);
		return vt;

	}
	
	@RequestMapping(value = "/xekhach/{bienxe}", params = "update", method = RequestMethod.GET)
	public String XKupdate(ModelMap model, @PathVariable("bienxe") String ma) {
		model.addAttribute("idModal", "modalUpdate");
		List<XeKhach> dsxekhach = dsxk();
		model.addAttribute("ds", dsxekhach);
		XeKhach xk = xktheoid(ma);
		model.addAttribute("xk", xk);
		List<LoaiXe> dslx = dslx();
		for (int i = 0; i < dslx.size(); i++) {
			if (dslx.get(i).getMaLX().equals(xk.getLx().getMaLX())) {
				dslx.remove(i);
				break;
			}
		}
		model.addAttribute("dslx", dslx);
		return "QuanLy/xekhach";
	}
	public int checkbienxevslxtrung(String bienxxe, String malx) {
		Session session = factory.getCurrentSession();
		String hql1 = "from XeKhach where bienXe = :id and lx.maLX = :lx";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("id", bienxxe);
		query1.setParameter("lx", malx);
		List<XeKhach> list1 = query1.list();
		if (list1.size() == 0 || list1.get(0).getBienXe().equals(bienxxe) && list1.size() != 0) {
			return 1;
		}
		return 0;
	}
	
	public int checkbienxetrung(String ma) {
		Session session = factory.getCurrentSession();
		String hql1 = "from XeKhach where bienXe = :id";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("id", ma);
		List<XeKhach> list1 = query1.list();
		if (list1.size() == 0) {
			return 1;
		}
		return 0;
	}

	// update Loáº¡i xe post
	@RequestMapping(value = "/xekhach/{bienxe}", params = "update", method = RequestMethod.POST)
	public String LXupdate(ModelMap model, @PathVariable("bienxe") String ma, @ModelAttribute("xk") XeKhach xk,
			HttpServletRequest request, BindingResult errors, RedirectAttributes redirectAttributes) {
		int count = 0;
		xk = xktheoid(ma);
//		if(checkbienxevslxtrung(xk.getBienXe(),request.getParameter("malx"))==0) {
//			errors.rejectValue("bienXe", "xk", "");
//			count = 1;
//		}
		if (count == 1) {
			model.addAttribute("idModal", "modalUpdate");
			List<XeKhach> dsxekhach = dsxk();
			model.addAttribute("ds", dsxekhach);
			List<LoaiXe> dslx = dslx();
			model.addAttribute("dslx", dslx);
			return "QuanLy/xekhach";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				xk.setTrangThai(Boolean.parseBoolean(request.getParameter("trangthai")));
				xk.setLx(lxtheoid(request.getParameter("malx")));
				session.merge(xk);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật thất bại!"));
			} finally {
				session.close();
			}
			return "redirect:/quanly/xekhach.html";

		}
	}
	@RequestMapping(value = "/xekhach/insert", method = RequestMethod.GET)
	public String xkInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<LoaiXe> dslx = dslx();
		model.addAttribute("dslx", dslx);
		List<XeKhach> ds = dsxk();
		model.addAttribute("ds", ds);
		XeKhach xk = new XeKhach();
		model.addAttribute("xk", xk);
		return "QuanLy/xekhach";
	}
	
	@RequestMapping(value = "/xekhach/insert", method = RequestMethod.POST)
	public String xlInsert(ModelMap model, @ModelAttribute("xk") XeKhach xk, HttpServletRequest request,
			BindingResult errors, RedirectAttributes redirectAttributes) {
		int count = 0;
		if(xk.getBienXe().trim().length()==0) {
			errors.rejectValue("bienXe", "xk", "Không được để trống");
			count = 1;
		}else if(checkbienxetrung(xk.getBienXe())==0) {
			errors.rejectValue("bienXe", "xk", "Biển xe đã tồn tại");
			count = 1;
		}
		if (count == 1) {
			model.addAttribute("idModal", "modalCreate");
			List<LoaiXe> dslx = dslx();
			model.addAttribute("dslx", dslx);
			List<XeKhach> ds = dsxk();
			model.addAttribute("ds", ds);
			return "QuanLy/loaixe";
		} else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				xk.setTrangThai(true);
				session.save(xk);
				transaction.commit();
				redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm mới thành công!"));
			} catch (Exception e) {
				System.out.println(e.toString());
				transaction.rollback();
				redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm mới thất bại!"));
			} finally {
				session.close();
			}

			return "redirect:/quanly/xekhach.html";

		}

	}
	@RequestMapping(value = "xekhach/{bienxe}.html", params = "btnDoitrangthai", method = RequestMethod.GET)
	public String XeKhachTrangThai(ModelMap model, @PathVariable("bienxe") String ma) {
		System.out.println("kvi29");
		model.addAttribute("idModal", "modalTT");
		List<XeKhach> dsxekhach = dsxk();
		model.addAttribute("ds", dsxekhach);
		XeKhach xk = xekhachtheoid(ma);
		model.addAttribute("xk", xk);
		return "QuanLy/xekhach";
	}

	@RequestMapping(value = "xekhach/{bienxe}.html", params = "btnDoitrangthai", method = RequestMethod.POST)
	public String XeKhachTrangThai(@PathVariable("bienxe") String ma, @ModelAttribute("xk") XeKhach xk,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		System.out.println("kvi4");
		XeKhach xk1 = xekhachtheoid(ma);
		xk1.setTrangThai(xk.isTrangThai());

		try {
			session.merge(xk1);
			t.commit();
			redirectAttributes.addFlashAttribute("message", new Message("success", "Thay đổi trạng thái thành công!"));

		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thay đổi trạng thái thất bại!"));

		} finally {
			session.close();
		}
		return "redirect:/quanly/xekhach.html";

	}
}