package ptit.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;

@Embeddable
public class VeXePK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "SoGhe")
	private String soGhe;
	
	@Column(name = "MaPD")
	private String pd;

	public String getSoGhe() {
		return soGhe;
	}

	public void setSoGhe(String soGhe) {
		this.soGhe = soGhe;
	}

	public String getPd() {
		return pd;
	}

	public void setPd(String pd) {
		this.pd = pd;
	}

	
	
	
}
