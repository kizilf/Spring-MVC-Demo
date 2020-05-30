package com.furkan.MVC.demo.entity.currency;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.furkan.MVC.demo.entity.currency.types.*;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Currency {

	private Usd usd;
	private Eur eur;
	private Gbp gbp;
	private Cad cad;
	private Jpy jpy;
	private Chf chf;

	public Usd getUsd() {
		return usd;
	}

	public Eur getEur() {
		return eur;
	}

	public Gbp getGbp() {
		return gbp;
	}

	public void setUsd(Usd usd) {
		this.usd = usd;
	}

	public void setEur(Eur eur) {
		this.eur = eur;
	}

	public void setGbp(Gbp gbp) {
		this.gbp = gbp;
	}

	public Cad getCad() {
		return cad;
	}

	public Jpy getJpy() {
		return jpy;
	}


	public Chf getChf() {
		return chf;
	}

	public void setCad(Cad cad) {
		this.cad = cad;
	}

	public void setJpy(Jpy jpy) {
		this.jpy = jpy;
	}


	public void setChf(Chf chf) {
		this.chf = chf;
	}


}
