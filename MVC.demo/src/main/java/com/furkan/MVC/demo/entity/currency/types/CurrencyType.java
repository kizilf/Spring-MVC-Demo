package com.furkan.MVC.demo.entity.currency.types;

public abstract class CurrencyType {
	private String name;
	private Double rate;
	private Double inverseRate;
	private String code;
	
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public Double getRate() {
		return rate;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}
	
	public Double getInverseRate() {
		return inverseRate;
	}

	public void setInverseRate(Double inverseRate) {
		this.inverseRate = inverseRate;
	}
	

	@Override
	public String toString() {
		return name + ", rate= " + rate;
	}

	
	
}
