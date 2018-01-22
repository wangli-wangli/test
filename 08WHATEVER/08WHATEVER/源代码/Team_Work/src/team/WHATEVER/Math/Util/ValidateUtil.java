package team.WHATEVER.Math.Util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import team.WHATEVER.Math.dao.UserDaoImpl;
import team.WHATEVER.Math.model.User;

public class ValidateUtil {//验证信息是否为空，Map容器（保存映射关系）
	public static boolean validateNull(HttpServletRequest request,String []fileds){//不为空（没有错误信息）--true 为空--返回false
		boolean validate=true;
		//map对象用来装载不同错误信息
		Map<String,String> errorMsg=new HashMap();//<>泛型（map 装载错误信息，返回这个容器信息）
		for(String filed:fileds)
		{
			String value =request.getParameter(filed);//获取对应参数
			if(value==null||"".equals(value.trim()))
			{
				validate=false;
				errorMsg.put(filed, filed+"不能为空");//键和值
			}
			/*else
			{
			if(value.length()>6)
			{
				validate=false;
				errorMsg.put(filed, filed+"不能超过6位");
			}
			}*/
			if(!validate)
			{
				request.setAttribute("errormsg",errorMsg);//map装进将容器中
				
			}
		}
		return validate;	
	}
	public static boolean validateError(HttpServletRequest request,String []fileds){//不为空（没有错误信息）--true 为空--返回false
		boolean validate=true;
		//map对象用来装载不同错误信息
		UserDaoImpl userDao = new UserDaoImpl();
		List<User> users = userDao.find_users();
		Map<String,String> errorMsg=new HashMap();//<>泛型（map 装载错误信息，返回这个容器信息）
		for(String filed:fileds)
		{
			String value =request.getParameter(filed);//获取对应参数
			if(value==null||"".equals(value.trim()))
			{
				validate=false;
				errorMsg.put(filed, filed+"不能为空");//键和值
			}
			for( User user : users ){
			      if(value.equals(user.getU_Name()))
			      {
			    	  errorMsg.put(filed, filed+"已存在");//键和值
			      }
			}
			if(!validate)
			{
				request.setAttribute("errormsg",errorMsg);//map装进将容器中
				
			}
			
		}
		return validate;	
	}
	public static String showError(HttpServletRequest request,String filed)//反射
	{
		Map<String, String> errorMsg=(Map<String, String> )request.getAttribute("errormsg");
		if(errorMsg==null)
		{
			return "";
		}
		String msg=errorMsg.get(filed);//有对象
		if(msg==null)
		{
			return "";
		}
		return msg;
	}
	

}

