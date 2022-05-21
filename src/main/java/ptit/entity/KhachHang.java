package ptit.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name = "KHACHHANG")
public class KhachHang {
	@Id
	@Column(name = "MaKH")
	private String maKH;
	@Column(name = "SDT")
	private String sdt;
	@Column(name = "HoKH")
	private String hoKH;
	@Column(name = "TenKH")
	private String tenKH;
	@Column(name = "Phai")
	private boolean phai;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "Username")
	private TaiKhoan tkkh;
	@OneToMany(mappedBy = "KH",fetch = FetchType.EAGER)
	private Collection<PhieuDat> phieu;
	@Column(name = "NgSinh")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngSinh;
	public String getMaKH() {
		return maKH;
	}
	public void setMaKH(String maKH) {
		this.maKH = maKH;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getHoKH() {
		return hoKH;
	}
	public void setHoKH(String hoKH) {
		this.hoKH = hoKH;
	}
	public String getTenKH() {
		return tenKH;
	}
	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}
	public boolean getPhai() {
		return phai;
	}
	public void setPhai(boolean phai) {
		this.phai = phai;
	}
	public TaiKhoan getTkkh() {
		return tkkh;
	}
	public void setTkkh(TaiKhoan tkkh) {
		this.tkkh = tkkh;
	}
	public Collection<PhieuDat> getPhieu() {
		return phieu;
	}
	public void setPhieu(Collection<PhieuDat> phieu) {
		this.phieu = phieu;
	}
	public Date getNgSinh() {
		return ngSinh;
	}
	public void setNgSinh(Date ngSinh) {
		this.ngSinh = ngSinh;
	}

	
}