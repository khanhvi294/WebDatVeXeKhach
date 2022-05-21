package ptit.entity;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PHIEUDAT")
public class PhieuDat {
	@Id
	@Column(name = "MaPD")
	private String maPD;
	@ManyToOne
	@JoinColumn(name = "MaChuyen")
	private ChuyenXe chuyen;
	@Column(name = "TrangThai")
	private int trangThai;
	@OneToMany(mappedBy = "pd", fetch = FetchType.EAGER)
	private Collection<VeXe> vexe;
	@ManyToOne
	@JoinColumn(name = "MaKH")
	private KhachHang KH;
	@ManyToOne
	@JoinColumn(name = "MaNV")
	private NhanVien NV;
	@Column(name="TongTien")
	private BigDecimal tongtien;
	public String getMaPD() {
		return maPD;
	}
	@Column(name="Email")
	private String email;
	@Column(name="SDT")
	private String sdt;
	@Column(name="PTTT")
	private boolean pttt;
	@Column(name="NgayDat")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngaydat;
	public ChuyenXe getChuyen() {
		return chuyen;
	}
	public boolean isPttt() {
		return pttt;
	}
	public void setPttt(boolean pttt) {
		this.pttt = pttt;
	}
	public void setChuyen(ChuyenXe chuyen) {
		this.chuyen = chuyen;
	}
	public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	public Collection<VeXe> getVexe() {
		return vexe;
	}
	public void setVexe(Collection<VeXe> vexe) {
		this.vexe = vexe;
	}
	public KhachHang getKH() {
		return KH;
	}
	public void setKH(KhachHang kH) {
		KH = kH;
	}
	public NhanVien getNV() {
		return NV;
	}
	public void setNV(NhanVien nV) {
		NV = nV;
	}
	public BigDecimal getTongtien() {
		return tongtien;
	}
	public void setTongtien(BigDecimal tongtien) {
		this.tongtien = tongtien;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public void setMaPD(String maPD) {
		this.maPD = maPD;
	}
	
}