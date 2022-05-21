package ptit.entity;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;


import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

@Entity
@Table(name = "VEXE")
public class VeXe implements Serializable {
	

	
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private VeXePK id;

	@ManyToOne

	@JoinColumn(name = "MaPD", insertable=false, updatable=false)
	private PhieuDat pd;

	public VeXePK getId() {
		return id;
	}

	public void setId(VeXePK id) {
		this.id = id;
	}

	public PhieuDat getPd() {
		return pd;
	}

	public void setPd(PhieuDat pd) {
		this.pd = pd;
	}
	
	
}
