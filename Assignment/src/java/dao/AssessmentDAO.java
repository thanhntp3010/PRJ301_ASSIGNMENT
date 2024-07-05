/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Assessment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AssessmentDAO {
    public List<Assessment> getAssessmentsByCourseId(int courseId) throws SQLException, ClassNotFoundException {
        List<Assessment> assessments = new ArrayList<>();
        String sql = "SELECT AssessmentId, CourseId, Category, Type, CompletionCriteria, Duration, QuestionType, NoQuestion FROM Assessments WHERE CourseId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection1(); // Thay DBContext.getConnection1() bằng phương thức kết nối của bạn
            if (conn != null) {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, courseId);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int assessmentId = rs.getInt("AssessmentId");
                    int courseID = rs.getInt("CourseId");
                    String category = rs.getString("Category");
                    String type = rs.getString("Type");
                    String completionCriteria = rs.getString("CompletionCriteria");
                    String duration = rs.getString("Duration");
                    String questionType = rs.getString("QuestionType");
                    String noQuestion = rs.getString("NoQuestion");

                    Assessment assessment = new Assessment(assessmentId, courseID, category, type, completionCriteria, duration, questionType, noQuestion);
                    assessments.add(assessment);
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

        return assessments;
    }
    
}
