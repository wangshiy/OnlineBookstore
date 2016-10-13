package com.mercury.beans;

import java.util.List;

import org.codehaus.jackson.annotate.JsonBackReference;

public class TransactionInfo {
	
	private String message;
	@JsonBackReference
	private List<Project_Transaction> transactions;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<Project_Transaction> getTransactions() {
		return transactions;
	}
	public void setTransactions(List<Project_Transaction> transactions) {
		this.transactions = transactions;
	}
	@Override
	public String toString() {
		return "TransactionInfo [message=" + message + ", transactions="
				+ transactions + "]";
	}

}
