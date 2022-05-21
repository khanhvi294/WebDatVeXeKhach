package ptit.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptit.entity.ChuyenXe;
import ptit.entity.DiaDiem;

@Controller
@Transactional
public class TrangChuController {
	
	@RequestMapping("trangchu")
	public String index() {
		return "KhachHang/trangchu";
	}
	
}
