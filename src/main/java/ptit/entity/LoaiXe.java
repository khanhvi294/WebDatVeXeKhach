package ptit.entity;

import java.math.BigDecimal;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "LOAIXE")
public class LoaiXe {
	@Id
	@Column(name = "MaLX")
	private String maLX;
	@Column(name = "TenLX")
	private String tenLX;
	@Column(name = "SoCho")
	private int seat;
	@OneToMany(mappedBy = "lx", fetch = FetchType.EAGER)
	private Collection<XeKhach> xe;
	@Column(name = "GiaLX")
	private BigDecimal giaLX;
	public String getMaLX() {
		return maLX;
	}
	public void setMaLX(String maLX) {
		this.maLX = maLX;
	}
	public String getTenLX() {
		return tenLX;
	}
	public void setTenLX(String tenLX) {
		this.tenLX = tenLX;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public Collection<XeKhach> getXe() {
		return xe;
	}
	public void setXe(Collection<XeKhach> xe) {
		this.xe = xe;
	}
	public BigDecimal getGiaLX() {
		return giaLX;
	}
	public void setGiaLX(BigDecimal giaLX) {
		this.giaLX = giaLX;
	}
	
	
	
}





