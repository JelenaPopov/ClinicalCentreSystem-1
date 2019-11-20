package ftn.tim16.ClinicalCentreSystem.service;

import ftn.tim16.ClinicalCentreSystem.dto.ClinicAdministratorDTO;
import ftn.tim16.ClinicalCentreSystem.enumeration.UserStatus;
import ftn.tim16.ClinicalCentreSystem.model.ClinicAdministrator;
import ftn.tim16.ClinicalCentreSystem.repository.ClinicAdministratorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClinicAdministratorServiceImpl implements ClinicAdministratorService {
    @Autowired
    private ClinicAdministratorRepository clinicAdministratorRepository;
/*
    @Override
    public List<ClinicAdministrator> getClinicAdministrators() {
        return clinicAdministratorRepository.findAll();
    }
*/

    @Override
    public ClinicAdministrator changePassword(String newPassword, ClinicAdministrator user) {
        user.setPassword(newPassword);
        if (user.getStatus().equals(UserStatus.NEVER_LOGGED_IN)) {
            user.setStatus(UserStatus.ACTIVE);
        }
        return clinicAdministratorRepository.save(user);
    }

    @Override
    public ClinicAdministrator getLoginAdmin() {
        Authentication currentUser = SecurityContextHolder.getContext().getAuthentication();
        try {
            ClinicAdministrator clinicAdministrator = clinicAdministratorRepository.findByEmail(currentUser.getName());
            if (clinicAdministrator != null) {
                return clinicAdministrator;
            }
        } catch (UsernameNotFoundException ex) {

        }
        return null;
    }

    @Override
    public List<ClinicAdministratorDTO> getAllClinicAdministratorInClinic(Long id) {
        List<ClinicAdministrator> adminsInClinic = clinicAdministratorRepository.findByClinicId(id);
        if (adminsInClinic == null) {
            return null;
        }

        return convertToDTO(adminsInClinic);
    }

    private List<ClinicAdministratorDTO> convertToDTO(List<ClinicAdministrator> clinicAdmins) {
        List<ClinicAdministratorDTO> clinicAdminsDTO = new ArrayList<>();
        for (ClinicAdministrator clinicAdmin : clinicAdmins) {
            clinicAdminsDTO.add(new ClinicAdministratorDTO(clinicAdmin));
        }

        return clinicAdminsDTO;
    }
}
