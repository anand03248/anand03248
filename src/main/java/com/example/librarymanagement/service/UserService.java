package com.example.librarymanagement.service;

import com.example.librarymanagement.entity.User;
import com.example.librarymanagement.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public List<User> getUsers() {
		return userDao.getUsers();
	}



	public User getUser(final int id) {
		return userDao.getUser(id);
	}

	public void addUser(final User user) {
		userDao.addUser(user);
	}

	public void updateUser(final User user) {
		userDao.updateUser(user);
	}

	public void deleteUser(final int id) {
		userDao.deleteUser(id);
	}
}
