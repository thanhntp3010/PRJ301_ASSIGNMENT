/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Assessment;
import entity.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseDAO {
    public Course getCourseById(int courseId) throws SQLException {
        Course course = null;
        String sql = "SELECT CourseId, CourseName, CourseCode FROM Courses WHERE CourseId = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection1();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, courseId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String courseName = rs.getString("CourseName");
                    String courseCode = rs.getString("CourseCode");
                    course = new Course(courseId, courseName, courseCode, 0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return course;
    }
    
    public List<Course> findCoursesByCodeAndInstructorId(String courseCode, int instructorId) throws SQLException {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.CourseId, CourseName, CourseCode, i.InstructorId FROM Courses c INNER JOIN InstructorCourse i"
                + " ON c.CourseId = i.CourseId WHERE CourseCode LIKE ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection1();
            if (conn != null) {
                if (instructorId != 0) {
                    sql += " AND i.InstructorId = ?";

                }
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, "%" + courseCode + "%");
                if (instructorId != 0) {
                    pstmt.setInt(2, instructorId);
                }
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int courseId = rs.getInt("CourseId");
                    String courseName = rs.getString("CourseName");
                    String code = rs.getString("CourseCode");
                    int retrievedInstructorId = rs.getInt("InstructorId");
                    Course course = new Course(courseId, courseName, code, retrievedInstructorId);
                    courses.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
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

        return courses;
    }
    
    public List<Assessment> getAssessmentsByCourseId(int courseId) {
        List<Assessment> assessments = new ArrayList<>();
        String sql = "SELECT * FROM Assessments WHERE CourseId = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection1();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, courseId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int assessmentId = rs.getInt("AssessmentId");
                    String category = rs.getString("Category");
                    String type = rs.getString("Type");
                    String completionCriteria = rs.getString("CompletionCriteria");
                    String duration = rs.getString("Duration");
                    String questionType = rs.getString("QuestionType");
                    String noQuestion = rs.getString("NoQuestion");
       
                    Assessment assessment = new Assessment(assessmentId, courseId, category, type,
                            completionCriteria, duration, questionType, noQuestion);
                    assessments.add(assessment);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (ptm != null) {
                try {
                    ptm.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return assessments;
    }
    
    public static void main(String[] args) {
        CourseDAO d = new CourseDAO();
        System.out.println(d.getAssessmentsByCourseId(1));
    }
}
