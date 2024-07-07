/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

public class ReportDTO {

    private String semester;
    private String code;
    private String name;
    private int totalStudent;
    private int passedStudent;
    private int failedStudent;

    public ReportDTO(String semester, String code, String name, int totalStudent, int passedStudent, int failedStudent) {
        this.semester = semester;
        this.code = code;
        this.name = name;
        this.totalStudent = totalStudent;
        this.passedStudent = passedStudent;
        this.failedStudent = failedStudent;
    }

    public ReportDTO() {
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalStudent() {
        return totalStudent;
    }

    public void setTotalStudent(int totalStudent) {
        this.totalStudent = totalStudent;
    }

    public int getPassedStudent() {
        return passedStudent;
    }

    public void setPassedStudent(int passedStudent) {
        this.passedStudent = passedStudent;
    }

    public int getFailedStudent() {
        return failedStudent;
    }

    public void setFailedStudent(int failedStudent) {
        this.failedStudent = failedStudent;
    }

}
