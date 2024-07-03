/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class GradeDAO {
    public List<StudentCourseInfo> getStudentGrade(int studentId) throws SQLException, ClassNotFoundException {
        List<StudentCourseInfo> studentGrades = new ArrayList<>();
        String sql = "SELECT ROW_NUMBER() OVER (ORDER BY c.Semester, c.Year, co.CourseCode) AS NO, "
                + "CONCAT_WS(' ', c.Semester, c.Year) AS SEMESTER, "
                + "co.CourseCode AS SUBJECT_CODE, "
                + "co.CourseName AS SUBJECT_NAME, "
                + "g.Score AS GRADE, "
                + "CASE WHEN g.Score >= 5.0 THEN 'Passed' ELSE 'Not Passed' END AS STATUS "
                + "FROM Grades g "
                + "JOIN StudentClasses sc ON g.StudentClassId = sc.StudentClassId "
                + "JOIN Classes c ON sc.ClassId = c.ClassId "
                + "JOIN Courses co ON c.CourseId = co.CourseId "
                + "WHERE sc.StudentId = ? "
                + "ORDER BY c.Year, c.Semester, co.CourseCode";

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
    
    public class StudentCourseInfo {
    private int no;
    private String semester;
    private String subjectCode;
    private String subjectName;
    private double grade;
    private String status;

    public StudentCourseInfo() {
    }

    public StudentCourseInfo(int no, String semester, String subjectCode, String subjectName, double grade, String status) {
        this.no = no;
        this.semester = semester;
        this.subjectCode = subjectCode;
        this.subjectName = subjectName;
        this.grade = grade;
        this.status = status;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}

}
