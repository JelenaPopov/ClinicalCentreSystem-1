package ftn.tim16.ClinicalCentreSystem.dto.requestandresponse;

import ftn.tim16.ClinicalCentreSystem.model.ClinicAdministrator;

import javax.validation.constraints.*;

public class EditClinicAdminDTO {

    @NotNull(message = "Id is null.")
    private Long id;

    @NotEmpty(message = "Email is empty.")
    @Email(message = "Email is invalid.")
    private String email;

    @NotEmpty(message = "First name is empty.")
    @Size(message = "Max size for first name is 30.", max = 30)
    private String firstName;

    @NotEmpty(message = "Last name is empty.")
    @Size(message = "Max size for last name is 30.", max = 30)
    private String lastName;

    @NotEmpty(message = "Phone number is empty.")
    @Size(min = 9, max = 10)
    @Pattern(regexp = "0[0-9]+")
    private String phoneNumber;

    public EditClinicAdminDTO() {

    }

    public EditClinicAdminDTO(ClinicAdministrator clinicAdministrator) {
        this(clinicAdministrator.getId(), clinicAdministrator.getEmail(), clinicAdministrator.getFirstName(),
                clinicAdministrator.getLastName(), clinicAdministrator.getPhoneNumber());
    }

    public EditClinicAdminDTO(Long id, String email, String firstName, String lastName, String phoneNumber) {
        this.id = id;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
