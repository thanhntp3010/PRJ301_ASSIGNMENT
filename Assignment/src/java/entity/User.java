/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

public class User {
    private int userId;
    private String username;
    private String rollNumber;
    private String password;
    private String fullName;
    private String email;
    private int roleId;

    public User() {
    }

    public User(int userId, String username,String rollNumber, String fullName, String email, int roleId) {
        this.userId = userId;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.rollNumber = rollNumber;
        this.roleId = roleId;
    }

    public User(int userId, String username, String rollNumber, String password, String fullName, String email, int roleId) {
        this.userId = userId;
        this.username = username;
        this.rollNumber = rollNumber;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.roleId = roleId;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }
    
    

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
    
    
}
