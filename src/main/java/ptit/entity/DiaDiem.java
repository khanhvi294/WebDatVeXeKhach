package ptit.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "DiaDiem")
public class DiaDiem {
	@Id
	@Column(name = "MaDD")
	private String maDD;
	@Column(name = "DiaDiem")
	private String diaDiem;
	@OneToMany(mappedBy = "diemDi", fetch = FetchType.EAGER)
	private Collection<TuyenXe> tuyenxedi;
	@OneToMany(mappedBy = "diemDen", fetch = FetchType.EAGER)
	private Collection<TuyenXe> tuyenxeden;
	public String getMaDD() {
		return maDD;
	}
	public void setMaDD(String maDD) {
		this.maDD = maDD;
	}
	public String getDiaDiem() {
		return diaDiem;
	}
	public void setDiaDiem(String diaDiem) {
		this.diaDiem = diaDiem;
	}
	public Collection<TuyenXe> getTuyenxedi() {
		return tuyenxedi;
	}
	public void setTuyenxedi(Collection<TuyenXe> tuyenxedi) {
		this.tuyenxedi = tuyenxedi;
	}
	public Collection<TuyenXe> getTuyenxeden() {
		return tuyenxeden;
	}
	public void setTuyenxeden(Collection<TuyenXe> tuyenxeden) {
		this.tuyenxeden = tuyenxeden;
	}
	
}
