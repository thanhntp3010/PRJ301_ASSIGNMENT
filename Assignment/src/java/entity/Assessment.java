/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

public class Assessment {

    private int assessmentId;
    private int courseId;
    private String category;
    private String type;
    private String completionCriteria;
    private String duration;
    private String questionType;
    private String noQuestion;
    private String weight;

    public Assessment() {
    }

    public Assessment(int assessmentId, int courseId, String category, String type, String completionCriteria, String duration, String questionType, String noQuestion) {
        this.assessmentId = assessmentId;
        this.courseId = courseId;
        this.category = category;
        this.type = type;
        this.completionCriteria = completionCriteria;
        this.duration = duration;
        this.questionType = questionType;
        this.noQuestion = noQuestion;
    }

    public Assessment(int assessmentId, int courseId, String category, String type, String completionCriteria, String duration, String questionType, String noQuestion, String weight) {
        this.assessmentId = assessmentId;
        this.courseId = courseId;
        this.category = category;
        this.type = type;
        this.completionCriteria = completionCriteria;
        this.duration = duration;
        this.questionType = questionType;
        this.noQuestion = noQuestion;
        this.weight = weight;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public int getAssessmentId() {
        return assessmentId;
    }

    public void setAssessmentId(int assessmentId) {
        this.assessmentId = assessmentId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCompletionCriteria() {
        return completionCriteria;
    }

    public void setCompletionCriteria(String completionCriteria) {
        this.completionCriteria = completionCriteria;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getNoQuestion() {
        return noQuestion;
    }

    public void setNoQuestion(String noQuestion) {
        this.noQuestion = noQuestion;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    @Override
    public String toString() {
        return "Assessment{" + "assessmentId=" + assessmentId + ", courseId=" + courseId + ", category=" + category + ", type=" + type + ", completionCriteria=" + completionCriteria + ", duration=" + duration + ", questionType=" + questionType + ", noQuestion=" + noQuestion + '}';
    }

}
