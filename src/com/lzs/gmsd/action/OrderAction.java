package com.lzs.gmsd.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import com.lzs.gmsd.bean.Order;
import com.lzs.gmsd.bean.OrderType;
import com.lzs.gmsd.bean.UserInfo;
import com.lzs.gmsd.service.iface.OrderDetailService;
import com.lzs.gmsd.service.iface.OrderService;
import com.lzs.gmsd.service.iface.OrderTypeService;
import com.lzs.gmsd.service.iface.RoleService;
import com.lzs.gmsd.service.iface.UserInfoService;
import com.lzs.gmsd.service.iface.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private String nav;
	private Order order;
	private List orders;
	private List types;
	private List workers;
	private OrderService orderService;
	private OrderDetailService orderDetailService;
	private OrderTypeService orderTypeService;
	private RoleService roleService;
	private UserService userService;
	private UserInfoService userInfoService;
	private Map<String, Object> jsonResult;
	
	private int[] orderSum;
	
	//管理员显示所有报障单列表
	public String lists() {
		/**
		 * sum[0] 订单总数
		 * sum[1] 未指派
		 * sum[2] 未完成
		 * sum[3] 已完成
		 * sum[4] 已取消
		 */
		List os = orderService.orderSum();
		int [] sum = {0,0,0,0,0};
		for(Iterator iterator = os.iterator();iterator.hasNext();){  
			Object[] obj = (Object[]) iterator.next();
			int state = ((Number) obj[0]).intValue();
			int num = ((Number) obj[1]).intValue();
			sum[0] += num;
            //每个集合元素都是一个数组，数组元素是state,total 两列值 
			switch (state) {
				case 1:
					sum[1] += num;					
					break;
				case 2:
					sum[2] += num;
					break;
				case 3:
					sum[3] += num;
					break;
				case 4:
					sum[3] += num;
					break;
				case 5:
					sum[4] += num;
					break;	
				case 6:
					sum[4] += num;
					break;
				default:
					break;
			}
        }
		List lists = orderService.findOrder();
		System.out.println(lists);
		for(Object order : lists){
			Order o = (Order) order;
			// 统计订单总数
			// 1:刚创建未指派; 2:已指派; 3:已完成待评价; 4:已评价(结束); 5:已取消;
			switch (o.getState()) {
				case 1:
					o.setStateText("未指派");					
					break;
				case 2:
					o.setStateText("已指派");
					break;
				case 3:
					o.setStateText("待评价");
					break;
				case 4:
					o.setStateText("已评价");
					break;
				case 5:
					o.setStateText("用户取消");
					break;	
				case 6:
					o.setStateText("管理员取消");
					break;
				default:
					break;
			}
		}
		this.workers = userService.getWorker();	
		this.orders = lists;
		this.orderSum = sum;
		this.nav = "order-lists";
		return this.SUCCESS;
	}
	
	//普通用户报障单列表
	public String normal() {
		List lists = orderService.normalOrder();
		for(Object order : lists){
			Order o = (Order) order;
			// 1:刚创建未指派; 2:已指派; 3:已完成待评价; 4:已评价(结束); 5:已取消;
			switch (o.getState()) {
				case 1:
					o.setStateText("未指派");
					break;
				case 2:
					o.setStateText("已指派");
					break;
				case 3:
					o.setStateText("待评价");
					break;
				case 4:
					o.setStateText("已评价");
					break;
				case 5:
					o.setStateText("用户取消");
					break;	
				case 6:
					o.setStateText("管理员取消");
					break;	
				default:
					break;
			}
		}
		this.orders = lists;
		this.types = orderTypeService.findOrderType();
		this.nav = "order-normal";
		return this.SUCCESS;
	}
	
	//管理员取消维修单
	public String cancelByAdmin() {
		orderService.cancelOrderByAdmin(order.getOrderNo());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//管理员指派
	public String assign(){		
		UserInfo ui = userInfoService.getUserInfo(this.order.getRepairer().getUserId());
		System.out.println(ui);		
		Order o = orderService.getOrder(this.order.getOrderNo());		
		o.setAssignTime(new Date());
		o.setState(2);
		o.setRepairer(ui);		
		orderService.updateOrder(o);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//普通用户报障，添加报障信息到数据库
	public String add() {
		int id = orderDetailService.saveOrderDetail(this.order.getDetail());
		/**
		 * 自动派单
		 */
		OrderType ot = orderTypeService.getOrderType(this.order.getOrderType().getId());
		if (ot.getAutoDispat() == 1) {
			System.out.println("============= 自动派单 =============");
			this.order.setRepairer(userInfoService.getWorkerInfo());
			this.order.setState(2);
			this.order.setAssignTime(new Date());
		} else {
			System.out.println("============= 手动派单 =============");
			this.order.setState(1);
			this.order.setAssignTime(null);
			this.order.setRepairer(null);
		}
		this.order.getDetail().setId(id);
		System.out.println(this.order);
		orderService.saveOrder(this.order);
		Map <String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//用户取消报障
	public String cancel() {
		orderService.cancelOrder(order.getOrderNo());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//用户评价
	public String evaluation(){
		Order o = orderService.getOrder(this.order.getOrderNo());
		o.getDetail().setScore(this.order.getDetail().getScore());
		o.getDetail().setComment(this.order.getDetail().getComment());
		orderDetailService.updateOrderDetail(o.getDetail());
		o.setState(4);
		orderService.updateOrder(o);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//维修人员查看被指派维修单
	public String worker() {
		List lists = orderService.workerOrder();
		for(Object order : lists){
			Order o = (Order) order;
			// 1:刚创建未指派; 2:已指派; 3:已完成待评价; 4:已评价(结束); 5:已取消;
			switch (o.getState()) {
				case 1:
					o.setStateText("未指派");
					break;
				case 2:
					o.setStateText("已指派");
					break;
				case 3:
					o.setStateText("待评价");
					break;
				case 4:
					o.setStateText("已评价");
					break;
				case 5:
					o.setStateText("用户取消");
					break;	
				case 6:
					o.setStateText("管理员取消");
					break;	
				default:
					break;
			}
		}
		this.orders = lists;
		this.nav = "order-worker";
		return this.SUCCESS;
	}
	
	//维修人员维修完成后进行维修汇报
	public String finish(){
		Order o = orderService.getOrder(this.order.getOrderNo());
		o.getDetail().setRepairDesc(this.order.getDetail().getRepairDesc());
		orderDetailService.updateOrderDetail(o.getDetail());
		System.out.print(o);
		o.setState(3);
		o.setFinishTime(new Date());
		orderService.updateOrder(o);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}

	public String getNav() {
		return nav;
	}

	public void setNav(String nav) {
		this.nav = nav;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List getOrders() {
		return orders;
	}

	public void setOrders(List orders) {
		this.orders = orders;
	}

	public List getTypes() {
		return types;
	}

	public void setTypes(List types) {
		this.types = types;
	}

	public List getWorkers() {
		return workers;
	}

	public void setWorkers(List workers) {
		this.workers = workers;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public OrderTypeService getOrderTypeService() {
		return orderTypeService;
	}

	public void setOrderTypeService(OrderTypeService orderTypeService) {
		this.orderTypeService = orderTypeService;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public int[] getOrderSum() {
		return orderSum;
	}

	public void setOrderSum(int[] orderSum) {
		this.orderSum = orderSum;
	}

	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}
	
	
}
