package ptit.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class BangGiaPK implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="Tuyen")
	private String tuyen;
	@Column(name="MaLX")
	private String loaixe;
	public String getTuyen() {
		return tuyen;
	}
	public void setTuyen(String tuyen) {
		this.tuyen = tuyen;
	}
	public String getLoaixe() {
		return loaixe;
	}
	public void setLoaixe(String loaixe) {
		this.loaixe = loaixe;
	}
	
}
