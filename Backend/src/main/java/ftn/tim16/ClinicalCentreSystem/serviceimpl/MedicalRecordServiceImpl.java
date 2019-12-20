package ftn.tim16.ClinicalCentreSystem.serviceimpl;

import ftn.tim16.ClinicalCentreSystem.dto.requestandresponse.MedicalRecordDTO;
import ftn.tim16.ClinicalCentreSystem.model.MedicalRecord;
import ftn.tim16.ClinicalCentreSystem.repository.MedicalRecordRepository;
import ftn.tim16.ClinicalCentreSystem.service.MedicalRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MedicalRecordServiceImpl implements MedicalRecordService {

    @Autowired
    private MedicalRecordRepository medicalRecordRepository;

    @Override
    public MedicalRecord findByPatientId(Long patientId) {
        return medicalRecordRepository.findByPatientId(patientId);
    }

    @Override
    public MedicalRecordDTO update(MedicalRecordDTO medicalRecordDTO) {
        MedicalRecord medicalRecord = medicalRecordRepository.findOneById(medicalRecordDTO.getId());
        if (medicalRecord == null) {
            return null;
        }

        medicalRecord.setHeight(medicalRecordDTO.getHeight());
        medicalRecord.setWeight(medicalRecordDTO.getWeight());
        medicalRecord.setBloodType(medicalRecordDTO.getBloodType());
        medicalRecord.setAllergies(medicalRecordDTO.getAllergies());

        return new MedicalRecordDTO(medicalRecordRepository.save(medicalRecord));
    }
}