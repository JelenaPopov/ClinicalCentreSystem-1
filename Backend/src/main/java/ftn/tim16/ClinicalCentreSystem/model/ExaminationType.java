package ftn.tim16.ClinicalCentreSystem.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import ftn.tim16.ClinicalCentreSystem.enumeration.LogicalStatus;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class ExaminationType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, columnDefinition = "VARCHAR(30)", nullable = false)
    private String label;

    @Column(nullable = false, scale = 2)
    private Double price;
    @JsonIgnore
    @OneToMany(mappedBy = "specialized", fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private Set<Doctor> doctors = new HashSet<>();

    @ManyToOne(fetch = FetchType.EAGER)
    private Clinic clinic;

    @Enumerated(EnumType.STRING)
    private LogicalStatus status;
    @JsonIgnore
    @OneToMany(mappedBy = "examinationType", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private Set<Examination> examinations = new HashSet<>();

    public Long getId() {
        return id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Set<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(Set<Doctor> doctors) {
        this.doctors = doctors;
    }

    public Clinic getClinic() {
        return clinic;
    }

    public void setClinic(Clinic clinic) {
        this.clinic = clinic;
    }

    public LogicalStatus getStatus() {
        return status;
    }

    public void setStatus(LogicalStatus status) {
        this.status = status;
    }

    public Set<Examination> getExaminations() {
        return examinations;
    }

    public void setExaminations(Set<Examination> examinations) {
        this.examinations = examinations;
    }
}
