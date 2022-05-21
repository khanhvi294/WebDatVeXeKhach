package ptit.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "VAITRO")
public class VaiTro {
	@Id
	@Column(name = "MaVT")
	private String maVT;
	@Column(name = "TenVT")
	private String tenVT;
	@OneToMany(mappedBy = "vaiTro", fetch = FetchType.EAGER)
	private Collection<TaiKhoan> taiKhoan;
	public String getMaVT() {
		return maVT;
	}
	public void setMaVT(String maVT) {
		this.maVT = maVT;
	}
	public String getTenVT() {
		return tenVT;
	}
	public void setTenVT(String tenVT) {
		this.tenVT = tenVT;
	}
	public Collection<TaiKhoan> getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(Collection<TaiKhoan> taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	
	
}
