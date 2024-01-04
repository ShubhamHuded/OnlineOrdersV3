package br.brpltrade.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import br.jpa.entity.User;

@Entity
@Table(name = "u_help_table")
public class HelpEntity {

	@Id
	@Column(name = "id", updatable = false, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@Column(name = "first_query")
	String firstQuery;

	@Column(name = "second_query")
	String secondQuery;

	@OneToOne
	@JoinColumn(name = "user_email", referencedColumnName = "user_email")
	private User<String> partyRegistry;

	@Column(name = "isResolved")
	private boolean isResolved;

	public boolean isResolved() {
		return isResolved;
	}

	public void setResolved(boolean isResolved) {
		this.isResolved = isResolved;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstQuery() {
		return firstQuery;
	}

	public void setFirstQuery(String firstQuery) {
		this.firstQuery = firstQuery;
	}

	public String getSecondQuery() {
		return secondQuery;
	}

	public void setSecondQuery(String secondQuery) {
		this.secondQuery = secondQuery;
	}

	public User<String> getPartyRegistry() {
		return partyRegistry;
	}

	public void setPartyRegistry(User<String> partyRegistry) {
		this.partyRegistry = partyRegistry;
	}

}
