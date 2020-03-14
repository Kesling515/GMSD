package com.lzs.gmsd.bean;

public class Help {
	
	private int id;
	private String type;
	private String question;
	private String answer;
	private int state;
	
	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"type\":\"" + type
				+ "\", \"question\":\"" + question + "\", \"answer\":\""
				+ answer + "\", \"state\":\"" + state + "\"}";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
}
