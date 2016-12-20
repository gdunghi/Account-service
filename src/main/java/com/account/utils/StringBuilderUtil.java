package com.account.utils;

public class StringBuilderUtil {
	private StringBuilder sb;
	
	public StringBuilderUtil(){
		sb = new StringBuilder();
	}
	
	public void appendNl(String str){
		sb.append(str).append("\n");
	}
	
	public void append(String str){
		sb.append(str);
	}
	
	public String toString(){
		return sb.toString();
	}

}
