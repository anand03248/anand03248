package com.example.librarymanagement.repository;

import com.example.librarymanagement.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import java.util.List;

@Repository
@Transactional
public class UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<User> getUsers() {
		@SuppressWarnings("unchecked")
		TypedQuery<User> q = sessionFactory.getCurrentSession().createQuery("from user");

		return q.getResultList();
	}
	public User getUser(final int id) {
		@SuppressWarnings("unchecked")
		TypedQuery<User> q = sessionFactory.getCurrentSession().createQuery("from user t where t.id = :id")
				.setParameter("id", id);

		return q.getSingleResult();
	}

	public void addUser(final User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	public void updateUser(final User user) {
//		User getUser = getUser(user.getId());
//		getUser.setName(user.getName());
//		getUser.setEmail(user.getEmail());
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	public void deleteUser(final int id) {
		sessionFactory.getCurrentSession().createQuery("delete from user t where t.id = :id").setParameter("id", id)
				.executeUpdate();
	}
}
