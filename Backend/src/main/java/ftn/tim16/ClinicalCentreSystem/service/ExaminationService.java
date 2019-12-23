package ftn.tim16.ClinicalCentreSystem.service;

import ftn.tim16.ClinicalCentreSystem.dto.request.PredefinedExaminationDTO;
import ftn.tim16.ClinicalCentreSystem.dto.response.ExaminationDTO;
import ftn.tim16.ClinicalCentreSystem.dto.response.ExaminationPagingDTO;
import ftn.tim16.ClinicalCentreSystem.model.*;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.List;

public interface ExaminationService {

    List<Examination> getExaminations(Long idRoom);

    List<Examination> getExaminationsOnDay(Long idRoom, LocalDateTime day);

    List<Examination> getDoctorExaminations(Long idDoctor);

    List<Examination> getDoctorExaminationsOnDay(Long idDoctor, LocalDateTime day);

    List<Examination> getNurseExaminations(Long idNurse);

    List<Examination> getNurseExaminationsOnDay(Long idNurse, LocalDateTime day);

    Examination getExamination(Long id);

    ExaminationPagingDTO getAwaitingExaminations(String kind, ClinicAdministrator clinicAdministrator, Pageable page);

    List<Examination> getAwaitingExaminations();

    ExaminationPagingDTO getPredefinedExaminations(ClinicAdministrator clinicAdministrator, Pageable page);

    Examination assignRoom(Examination examination, Room room, Nurse chosenNurse);

    ExaminationPagingDTO getDoctorExaminations(Doctor doctor, Pageable page);

    ExaminationDTO cancelExamination(Doctor doctor, Long examinationId);

    ExaminationDTO createPredefinedExamination(PredefinedExaminationDTO predefinedExaminationDTO, ClinicAdministrator clinicAdministrator);

    List<Examination> getDoctorUpcomingExaminations(Long doctorId);

    List<Examination> getNurseUpcomingExaminations(Long doctorId);

    List<Examination> getUpcomingExaminationsInRoom(Long roomId);

    List<Examination> getUpcomingExaminationsOfExaminationType(Long examinationTypeId);

    Examination getOngoingExamination(Long patientId, Long doctorId, LocalDateTime examinationStartTime);

    List<Examination> getClinicExaminations(Long clinicId, LocalDateTime startDate, LocalDateTime endDateTime);
}
