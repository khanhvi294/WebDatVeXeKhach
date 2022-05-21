package ptit.entity;

import java.util.Collection;
import java.util.Date;

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
@Table(name = "NHANVIEN")
public class NhanVien {
	@Id
	@Column(name = "MaNV")
	private String maNV;
	@Column(name = "HoNV")
	private String hoNV;
	@Column(name = "TenNV")
	private String tenNV;
	@Column(name = "CCCD")
	private String cccd;
	@Column(name = "SDT")
	private String sdt;
	@Column(name = "NgSinh")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngaySinh;
	@Column(name = "Phai")
	private boolean phai;
	@OneToOne
    @JoinColumn(name = "Username", referencedColumnName = "Username")
    private TaiKhoan tknv;
	@OneToMany(mappedBy = "nv", fetch = FetchType.EAGER)
	private Collection<ChuyenXe> xe;
	@OneToMany(mappedBy = "NV", fetch = FetchType.EAGER)
	private Collection<PhieuDat> phieu;
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}
	public String getHoNV() {
		return hoNV;
	}
	public void setHoNV(String hoNV) {
		this.hoNV = hoNV;
	}
	public String getTenNV() {
		return tenNV;
	}
	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}
	public String getCccd() {
		return cccd;
	}
	public void setCccd(String cccd) {
		this.cccd = cccd;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public boolean getPhai() {
		return phai;
	}
	public void setPhai(boolean phai) {
		this.phai = phai;
	}
	public TaiKhoan getTknv() {
		return tknv;
	}
	public void setTknv(TaiKhoan tknv) {
		this.tknv = tknv;
	}
	public Collection<ChuyenXe> getXe() {
		return xe;
	}
	public void setXe(Collection<ChuyenXe> xe) {
		this.xe = xe;
	}
	public Collection<PhieuDat> getPhieu() {
		return phieu;
	}
	public void setPhieu(Collection<PhieuDat> phieu) {
		this.phieu = phieu;
	}
	
	
}
