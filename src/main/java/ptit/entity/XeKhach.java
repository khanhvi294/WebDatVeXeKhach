package ptit.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "XEKHACH")
public class XeKhach {
	@Id
	@Column(name = "MaXe")
	private String bienXe;
	@Column(name = "TrangThai")
	private boolean trangThai;
	@OneToMany(mappedBy = "xekhach",fetch = FetchType.EAGER)
	private Collection<ChuyenXe> chuyen;
	@ManyToOne
	@JoinColumn(name = "Loai")
	private LoaiXe lx;
	public String getBienXe() {
		return bienXe;
	}
	public void setBienXe(String bienXe) {
		this.bienXe = bienXe;
	}
	public boolean isTrangThai() {
		return trangThai;
	}
	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
	public Collection<ChuyenXe> getChuyen() {
		return chuyen;
	}
	public void setChuyen(Collection<ChuyenXe> chuyen) {
		this.chuyen = chuyen;
	}
	public LoaiXe getLx() {
		return lx;
	}
	public void setLx(LoaiXe lx) {
		this.lx = lx;
	}
	
}
