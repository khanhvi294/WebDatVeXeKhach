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
@Table(name = "TUYENXE")
public class TuyenXe {
	@Id
	@Column(name = "MaTuyen")
	private String maTuyen;
	@ManyToOne
	@JoinColumn(name = "DiemDi")
	private DiaDiem diemDi;
	@ManyToOne
	@JoinColumn(name = "DiemDen")
	private DiaDiem diemDen;
	@Column(name = "TrangThai")
	private boolean trangThai;
	@OneToMany(mappedBy = "tuyen", fetch = FetchType.EAGER)
	private Collection<ChuyenXe> chuyen;
	@OneToMany(mappedBy = "Tuyen", fetch = FetchType.EAGER)
	private Collection<BangGia> banggia;
	public String getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(String maTuyen) {
		this.maTuyen = maTuyen;
	}
	public DiaDiem getDiemDi() {
		return diemDi;
	}
	public void setDiemDi(DiaDiem diemDi) {
		this.diemDi = diemDi;
	}
	public DiaDiem getDiemDen() {
		return diemDen;
	}
	public void setDiemDen(DiaDiem diemDen) {
		this.diemDen = diemDen;
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
	public Collection<BangGia> getBanggia() {
		return banggia;
	}
	public void setBanggia(Collection<BangGia> banggia) {
		this.banggia = banggia;
	}
	
}
