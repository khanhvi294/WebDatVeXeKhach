package ptit.entity;

import java.io.Serializable;
import java.util.Collection;

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
	private TuyenXe Tuyen;
	
	@ManyToOne
	@JoinColumn(name="MaLX", insertable=false, updatable=false)
	private LoaiXe loaixe;

	public BangGiaPK getId() {
		return id;
	}

	public void setId(BangGiaPK id) {
		this.id = id;
	}

	public TuyenXe getTuyen() {
		return Tuyen;
	}

	public void setTuyen(TuyenXe tuyen) {
		Tuyen = tuyen;
	}

	public LoaiXe getLoaixe() {
		return loaixe;
	}

	public void setLoaixe(LoaiXe loaixe) {
		this.loaixe = loaixe;
	}
	
	
}
