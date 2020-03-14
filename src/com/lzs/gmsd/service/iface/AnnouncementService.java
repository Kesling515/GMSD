package com.lzs.gmsd.service.iface;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Announcement;

public interface AnnouncementService {

	public List<Announcement> findAnnouncement() throws HibernateException;

	public void deleteAnnouncement(Announcement announcement) throws HibernateException;

	public int saveAnnouncement(Announcement announcement) throws HibernateException;
	
	public void updateAnnouncement(Announcement announcement) throws HibernateException;

	
}
