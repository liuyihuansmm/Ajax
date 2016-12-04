package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static List<String> initList;
	static {
		initList = new ArrayList<String>();
		initList.add("刘一寰");
		initList.add("刘一寰帅哥");
		initList.add("刘一寰 刁炸天");
		initList.add("刘一寰爱孙小梅");
		initList.add("孙红梅是个ju");
		initList.add("孙....红梅");
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<String> resultList = new ArrayList<String>();
		String keyword = request.getParameter("keyword");
		keyword = java.net.URLDecoder.decode(keyword, "UTF-8");
		if(keyword!=""&&keyword!=null){
			System.out.println(keyword);
			for(String temp:initList){
				if(temp.contains(keyword)){
					resultList.add(temp);
				}
			}		
			response.getWriter().write(JSONArray.fromObject(resultList).toString());
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
