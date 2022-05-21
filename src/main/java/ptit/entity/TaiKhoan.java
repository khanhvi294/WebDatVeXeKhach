package ptit.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TAIKHOAN")
public class TaiKhoan {
	@Id
	@Column(name = "Username")
	private String userName;
	@Column(name = "Matkhau")
	private String matKhau;
	@Column(name = "Email")
	private String email;
	@ManyToOne
	@JoinColumn(name = "VaiTro")
	private VaiTro vaiTro;
	@Column(name = "Trangthai")
	private boolean trangThai;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public VaiTro getVaiTro() {
		return vaiTro;
	}
	public void setVaiTro(VaiTro vaiTro) {
		this.vaiTro = vaiTro;
	}
	public boolean isTrangThai() {
		return trangThai;
	}
	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
	

}
