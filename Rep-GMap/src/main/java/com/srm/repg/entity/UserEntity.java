package com.srm.repg.entity;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity implements Serializable {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer userId;
    
    @Column(name = "ACTIVE")
    private Boolean active;
    
    
    @Column(name = "username")
    private String username;
    
    
    @Column(name = "CREATED_BY")
    private Integer createdBy;
    
    @Column(name = "CREATED_DATE")
    private Date createdDate;
    
    @Column(name = "CURRENT_ADDRESS")
    private String currentAddress;
    
    
    @Column(name = "DELETE_FLAG")
    private Boolean deleteFlag;
    
    
    @Column(name = "EMAIL_ID")
    private String emailId;
    
    @Column(name = "FIRST_NAME")
    private String firstName;
    
    
    @Column(name = "LAST_NAME")
    private String lastName;
    
    @Column(name = "USER_LOCATION_ID")
    private Integer userLocationId;
    
    @Column(name = "MIDDLE_NAME")
    private String middleName;
    
    @Column(name = "PASSWORD")
    private String password;
    
    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;
    
    
    @Column(name = "UPDATED_BY")
    private Integer updateBy;
    
    @Column(name = "UPDATED_DATE")
    private Date updatedDate;
   
    
 
    
    public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public Boolean getActive() {
		return active;
	}


	public void setActive(Boolean active) {
		this.active = active;
	}


	

	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public String getCurrentAddress() {
		return currentAddress;
	}


	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}


	public Boolean getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(Boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public Integer getUserLocationId() {
		return userLocationId;
	}


	public void setUserLocationId(Integer userLocationId) {
		this.userLocationId = userLocationId;
	}


	public String getMiddleName() {
		return middleName;
	}


	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}



	public Integer getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}


	public Integer getUpdateBy() {
		return updateBy;
	}


	public void setUpdateBy(Integer updateBy) {
		this.updateBy = updateBy;
	}


	public Date getUpdatedDate() {
		return updatedDate;
	}


	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}





	@Column(name = "USER_LOGIN_ID")
    private String userLoginId;




	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUserLoginId() {
		return userLoginId;
	}


	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	
	








    
    
    
}

