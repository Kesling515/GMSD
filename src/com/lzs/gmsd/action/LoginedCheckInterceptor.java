package com.lzs.gmsd.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginedCheckInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		HttpServletResponse response = this.getResponse(); 
		response.setHeader("Pragma","No-cache");            
	    response.setHeader("Cache-Control","no-cache");     
	    response.setHeader("Cache-Control", "no-store");     
	    response.setDateHeader("Expires",0);
	    
	    String userName = (String)this.getRequest().getSession().getAttribute("userName");
        if (!this.getRequest().isRequestedSessionIdValid() || userName == null){
    		//尚未登录 或者 Session过期 ,跳转至登录页面  
            return "loginIn";  
        }else{                      
            return ai.invoke();  
        }
	}
	
	
	/*
  	 * 注意：
  	 * 	直接用 ServletActionContext 对象的 getRequest() 或者 getResponse() 也可以直接获取到  request 或 response 对象
  	 * 但是：
  	 * 1）如果 ActionContext能够实现我们的功能 ,那最好就不要使用 ServletActionContext,让我们的 Action尽量不要直接去访问 JavaServlet的相关对象 .
  	 * 2）在使用 ActionContext时有一点要注意 :不要在 Action的构造函数里使用 ActionContext.getContext(),因为这个时候 ActionContext里的一些值也许没有设置 ,这时通过 ActionContext取得的值也许是 null.
  	 * 
  	 */
  	
  	//获取request
  	public HttpServletRequest getRequest() {  		
  		return (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); //struts2获取request对象的方法
  	}
  	
  	//获取response
  	public HttpServletResponse getResponse() {
  		return (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE); //struts2获取response对象的方法
  	}
	
	
}
