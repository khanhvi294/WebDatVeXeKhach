package ptit.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="BANGGIA")
public class BangGia implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	private BangGiaPK id;
	
	@ManyToOne
	@JoinColumn(name="Tuyen", insertable=false, updatable=false)
	private TuyenXe tuyen;
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@ManyToOne
	@JoinColumn(name="MaLX", insertable=false, updatable=false)
	private LoaiXe loaixe;
	
	@Column(name = "Gia")
	private BigDecimal gia;

	public BigDecimal getGia() {
		return gia;
	}

	public void setGia(BigDecimal gia) {
		this.gia = gia;
	}

	public BangGiaPK getId() {
		return id;
	}

	public void setId(BangGiaPK id) {
		this.id = id;
	}

	public LoaiXe getLoaixe() {
		return loaixe;
	}

	public void setLoaixe(LoaiXe loaixe) {
		this.loaixe = loaixe;
	}

	public TuyenXe getTuyen() {
		return tuyen;
	}

	public void setTuyen(TuyenXe tuyen) {
		this.tuyen = tuyen;
	}

	
}
