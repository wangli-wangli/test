package team.WHATEVER.Math.Util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import team.WHATEVER.Math.dao.UserDaoImpl;
import team.WHATEVER.Math.model.User;

public class ValidateUtil {//��֤��Ϣ�Ƿ�Ϊ�գ�Map����������ӳ���ϵ��
	public static boolean validateNull(HttpServletRequest request,String []fileds){//��Ϊ�գ�û�д�����Ϣ��--true Ϊ��--����false
		boolean validate=true;
		//map��������װ�ز�ͬ������Ϣ
		Map<String,String> errorMsg=new HashMap();//<>���ͣ�map װ�ش�����Ϣ���������������Ϣ��
		for(String filed:fileds)
		{
			String value =request.getParameter(filed);//��ȡ��Ӧ����
			if(value==null||"".equals(value.trim()))
			{
				validate=false;
				errorMsg.put(filed, filed+"����Ϊ��");//����ֵ
			}
			/*else
			{
			if(value.length()>6)
			{
				validate=false;
				errorMsg.put(filed, filed+"���ܳ���6λ");
			}
			}*/
			if(!validate)
			{
				request.setAttribute("errormsg",errorMsg);//mapװ����������
				
			}
		}
		return validate;	
	}
	public static boolean validateError(HttpServletRequest request,String []fileds){//��Ϊ�գ�û�д�����Ϣ��--true Ϊ��--����false
		boolean validate=true;
		//map��������װ�ز�ͬ������Ϣ
		UserDaoImpl userDao = new UserDaoImpl();
		List<User> users = userDao.find_users();
		Map<String,String> errorMsg=new HashMap();//<>���ͣ�map װ�ش�����Ϣ���������������Ϣ��
		for(String filed:fileds)
		{
			String value =request.getParameter(filed);//��ȡ��Ӧ����
			if(value==null||"".equals(value.trim()))
			{
				validate=false;
				errorMsg.put(filed, filed+"����Ϊ��");//����ֵ
			}
			for( User user : users ){
			      if(value.equals(user.getU_Name()))
			      {
			    	  errorMsg.put(filed, filed+"�Ѵ���");//����ֵ
			      }
			}
			if(!validate)
			{
				request.setAttribute("errormsg",errorMsg);//mapװ����������
				
			}
			
		}
		return validate;	
	}
	public static String showError(HttpServletRequest request,String filed)//����
	{
		Map<String, String> errorMsg=(Map<String, String> )request.getAttribute("errormsg");
		if(errorMsg==null)
		{
			return "";
		}
		String msg=errorMsg.get(filed);//�ж���
		if(msg==null)
		{
			return "";
		}
		return msg;
	}
	

}

