package com.srm.repg.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.srm.repg.entity.UserEntity;

@Repository
public class UserDao extends CommonDao {

	
	public List<UserEntity> getAllUsers() {
		@SuppressWarnings("unchecked")
		List<UserEntity> userList = (List<UserEntity>)getEntityManger()
        		.createQuery("SELECT e FROM UserEntity e where e.deleteFlag='0'")
        		.getResultList();			 		 
		return userList;
	}

	
	
	public void saveUser(UserEntity userEntity) {
		 getEntityManger().persist(userEntity);  
	}

	public UserEntity findUserById(int id) {
		UserEntity userList = (UserEntity) getEntityManger()
       		.createQuery("SELECT e FROM UserEntity e where e.userId=:id")
       		.setParameter("id", id)
       		.getSingleResult();			 		 
		return userList;
	}

}
