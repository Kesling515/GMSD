package com.lzs.gmsd.service.impl;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Announcement;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.AnnouncementService;

public class AnnouncementServiceImpl implements AnnouncementService {

	private BaseDao announcementDao;
	
	public void setAnnouncementDao(BaseDao announcementDao) {
		this.announcementDao = announcementDao;
	}
	
	@Override
	public int saveAnnouncement(Announcement announcement) throws HibernateException {
		return (int) announcementDao.saveObject(announcement);
	}

	@Override
	public List findAnnouncement() throws HibernateException {
		return announcementDao.findObject();
	}
	
	@Override
	public void updateAnnouncement(Announcement announcement) throws HibernateException {
		announcementDao.updateObject(announcement);
	}

	@Override
	public void deleteAnnouncement(Announcement announcement) throws HibernateException {
		announcementDao.deleteObject(announcement);
	}
	
}
