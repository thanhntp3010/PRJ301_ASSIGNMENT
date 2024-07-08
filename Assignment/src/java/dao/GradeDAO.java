/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.ReportDTO;
import dto.StudentCourseInfo;
import entity.Grade;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GradeDAO {

    public void insertGrade(int studentClassId, int assessmentId, double score) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Grades (StudentClassId, AssessmentId, Score) VALUES (?, ?, ?)";

        try (Connection conn = DBContext.getConnection1(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, studentClassId);
            pstmt.setInt(2, assessmentId);
            pstmt.setDouble(3, score);
            pstmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public boolean updateGrade(int studentClassId, int assessmentId, double score) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Grades SET Score = ? WHERE StudentClassId = ? AND AssessmentId = ?";

        try (Connection conn = DBContext.getConnection1(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDouble(1, score);
            pstmt.setInt(2, studentClassId);
            pstmt.setInt(3, assessmentId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public Map<String, Map<String, Double>> getGradesByClassAndCourse(int classId, int courseId) throws SQLException, ClassNotFoundException {
        Map<String, Map<String, Double>> studentGrades = new HashMap<>();
        String sql = "SELECT sc.StudentClassId, g.AssessmentId, g.Score "
                + "FROM Grades g "
                + "JOIN StudentClasses sc ON g.StudentClassId = sc.StudentClassId "
                + "JOIN Classes c ON sc.ClassId = c.ClassId "
                + "WHERE c.ClassId = ? AND c.CourseId = ?";

        try (Connection conn = DBContext.getConnection1(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, classId);
            pstmt.setInt(2, courseId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String studentClassId = rs.getString("StudentClassId");
                    String assessmentId = rs.getString("AssessmentId");
                    double score = rs.getDouble("Score");

                    studentGrades
                            .computeIfAbsent(studentClassId, k -> new HashMap<>())
                            .put(assessmentId, score);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw e;
        }

        return studentGrades;
    }

    public static void main(String[] args) {
        GradeDAO d = new GradeDAO();
        try {
            System.out.println(d.getGradesByClassAndCourse(1, 1));
        } catch (SQLException ex) {
            Logger.getLogger(GradeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GradeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<StudentCourseInfo> getStudentGrade(int studentId) throws SQLException, ClassNotFoundException {
        List<StudentCourseInfo> studentGrades = new ArrayList<>();
        String sql = "SELECT \n"
                + "    ROW_NUMBER() OVER (ORDER BY c.Semester, c.Year, co.CourseCode) AS NO,\n"
                + "    CONCAT_WS(' ', c.Semester, c.Year) AS SEMESTER, \n"
                + "    co.CourseCode AS SUBJECT_CODE,\n"
                + "    co.CourseName AS SUBJECT_NAME,\n"
                + "    ROUND(AVG(g.Score * a.Weight) / AVG(a.Weight), 2) AS GRADE, \n"
                + "    CASE \n"
                + "        WHEN ROUND(AVG(g.Score * a.Weight) / AVG(a.Weight), 2) >= 5.0 THEN 'Passed' \n"
                + "        ELSE 'Not Passed' \n"
                + "    END AS STATUS \n"
                + "FROM \n"
                + "    Grades g \n"
                + "JOIN \n"
                + "    StudentClasses sc ON g.StudentClassId = sc.StudentClassId \n"
                + "JOIN \n"
                + "    Classes c ON sc.ClassId = c.ClassId \n"
                + "JOIN \n"
                + "    Courses co ON c.CourseId = co.CourseId \n"
                + "JOIN \n"
                + "    Assessments a ON g.AssessmentId = a.AssessmentId\n"
                + "WHERE \n"
                + "    sc.StudentId = ?\n"
                + "GROUP BY \n"
                + "    c.Semester, c.Year, co.CourseCode, co.CourseName\n"
                + "ORDER BY \n"
                + "    c.Year, c.Semester, co.CourseCode;";

        try (Connection conn = DBContext.getConnection1(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, studentId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int no = rs.getInt("NO");
                    String semester = rs.getString("SEMESTER");
                    String subjectCode = rs.getString("SUBJECT_CODE");
                    String subjectName = rs.getString("SUBJECT_NAME");
                    double grade = rs.getDouble("GRADE");
                    String status = rs.getString("STATUS");

                    StudentCourseInfo info = new StudentCourseInfo(no, semester, subjectCode, subjectName, grade, status);
                    studentGrades.add(info);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw e;
        }

        return studentGrades;
    }

    public List<ReportDTO> report() throws SQLException, ClassNotFoundException {
        List<ReportDTO> reportDTOs = new ArrayList<>();
        String sql = "SELECT CONCAT_WS(' ', c.Semester, c.Year) AS SEMESTER, co.CourseCode AS SUBJECT_CODE, co.CourseName AS SUBJECT_NAME,\n"
                + "COUNT(sc.StudentId) AS TOTAL_STUDENTS, \n"
                + "SUM(CASE WHEN g.Score >= 5.0 THEN 1 ELSE 0 END) AS PASSED_STUDENTS,\n"
                + "SUM(CASE WHEN g.Score < 5.0 THEN 1 ELSE 0 END) AS FAILED_STUDENTS \n"
                + "FROM Grades g \n"
                + "JOIN StudentClasses sc ON g.StudentClassId = sc.StudentClassId\n"
                + "JOIN Classes c ON sc.ClassId = c.ClassId \n"
                + "JOIN Courses co ON c.CourseId = co.CourseId \n"
                + "GROUP BY c.Semester, c.Year, co.CourseCode, co.CourseName \n"
                + "ORDER BY c.Year, c.Semester, co.CourseCode";

        try (Connection conn = DBContext.getConnection1(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String semester = rs.getString("SEMESTER");
                    String subjectCode = rs.getString("SUBJECT_CODE");
                    String subjectName = rs.getString("SUBJECT_NAME");
                    int totalStudents = rs.getInt("TOTAL_STUDENTS");
                    int totalPassed = rs.getInt("PASSED_STUDENTS");
                    int totalFailed = rs.getInt("FAILED_STUDENTS");

                    ReportDTO info = new ReportDTO(semester, subjectCode, subjectName, totalStudents, totalPassed, totalFailed);
                    reportDTOs.add(info);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw e;
        }

        return reportDTOs;
    }

}
