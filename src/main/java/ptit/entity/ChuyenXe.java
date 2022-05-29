/**
 * 
 */
package ptit.entity;
import java.math.BigDecimal;
import java.sql.Time;
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


/**
 * @author Kiritsugu
 *
 */
@Entity
@Table(name = "CHUYENXE")
public class ChuyenXe {
	@Id
	@Column(name = "MaChuyen")
	private String maChuyen;
	@ManyToOne
	@JoinColumn(name = "Tuyen")
	private TuyenXe tuyen;
	@Column(name = "TG_KH")
	private Time tgKh;
	@Column(name = "TrangThai")
	private boolean trangthai;
	@ManyToOne
	@JoinColumn(name = "MaXe")
	private XeKhach xekhach;
	@Column(name = "NgayKH")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngKH;
	@Column(name = "Gia")
	private BigDecimal gia;
	@Column(name="SoChoTrong")
	private int sochotrong;
	@OneToMany(mappedBy = "chuyen", fetch = FetchType.EAGER)
	private Collection<PhieuDat> phieu;
	public String getMaChuyen() {
		return maChuyen;
	}
	public void setMaChuyen(String maChuyen) {
		this.maChuyen = maChuyen;
	}
	public TuyenXe getTuyen() {
		return tuyen;
	}
	public void setTuyen(TuyenXe tuyen) {
		this.tuyen = tuyen;
	}
	public Time getTgKh() {
		return tgKh;
	}
	public void setTgKh(Time tgKh) {
		this.tgKh = tgKh;
	}
	public boolean isTrangthai() {
		return trangthai;
	}
	public void setTrangthai(boolean trangthai) {
		this.trangthai = trangthai;
	}
	public XeKhach getXekhach() {
		return xekhach;
	}
	public void setXekhach(XeKhach xekhach) {
		this.xekhach = xekhach;
	}
	public Date getNgKH() {
		return ngKH;
	}
	public void setNgKH(Date ngKH) {
		this.ngKH = ngKH;
	}
	
	public BigDecimal getGia() {
		return gia;
	}
	public void setGia(BigDecimal gia) {
		this.gia = gia;
	}
	public Collection<PhieuDat> getPhieu() {
		return phieu;
	}
	public void setPhieu(Collection<PhieuDat> phieu) {
		this.phieu = phieu;
	}
	public int getSochotrong() {
		return sochotrong;
	}
	public void setSochotrong(int sochotrong) {
		this.sochotrong = sochotrong;
	}

}