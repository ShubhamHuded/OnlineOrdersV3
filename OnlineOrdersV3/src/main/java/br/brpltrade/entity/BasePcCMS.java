package br.brpltrade.entity;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name="base_pc")
public class BasePcCMS {
	
	@Column
	String identifier;
}
