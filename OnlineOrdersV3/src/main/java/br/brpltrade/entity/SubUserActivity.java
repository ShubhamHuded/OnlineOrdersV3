package br.brpltrade.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import br.brpltrade.jpa.entity.SubUser;

@Entity
@Table(name = "u_subuser_activity")
public class SubUserActivity {

	@Id
	@Column(name = "id", updatable = false, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne
	@JoinColumn(name = "subUser_user_email", referencedColumnName = "user_email")
	private SubUser<String> subUser;

	@Column(name = "is_active", updatable = true, nullable = false)
	private boolean isActive;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SubUser<String> getSubUser() {
		return subUser;
	}

	public void setSubUser(SubUser<String> subUser) {
		this.subUser = subUser;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
