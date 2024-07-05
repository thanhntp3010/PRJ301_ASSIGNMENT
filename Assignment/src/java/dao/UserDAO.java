/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    public User checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
        User user = null;
        String sql = "SELECT UserId, Username,RollNumber, FullName, Email, RoleId FROM Users WHERE Username = ? AND Password = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection1();
            if (conn != null) {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    int userId = rs.getInt("UserId");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    int roleId = rs.getInt("RoleId");
                    String rollNumber = rs.getString("RollNumber");

                    user = new User(userId, username, rollNumber, fullName, email, roleId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return user;
    }
    
    public List<User> getStudentsByClassId(int classId) throws SQLException, ClassNotFoundException {
        List<User> students = new ArrayList<>();
        String sql = "SELECT u.UserId, u.Username, u.RollNumber, u.FullName, u.Email, u.RoleId "
                   + "FROM StudentClasses sc "
                   + "JOIN Users u ON sc.StudentId = u.UserId "
                   + "WHERE sc.ClassId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection1();
            if (conn != null) {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, classId);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int userId = rs.getInt("UserId");
                    String username = rs.getString("Username");
                    String rollNumber = rs.getString("RollNumber");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    int roleId = rs.getInt("RoleId");

                    User user = new User(userId, username, rollNumber, fullName, email, roleId);
                    students.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return students;
    }
}
