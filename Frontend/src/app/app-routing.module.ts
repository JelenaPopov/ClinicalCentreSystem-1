import { NonAuthenticatedErrorPageComponent } from './components/non-authenticated-error-page/non-authenticated-error-page.component';
import { NonAuthorizedErrorPageComponent } from './components/non-authorized-error-page/non-authorized-error-page.component';

import { DoctorsExaminationComponent } from './components/doctors-examination/doctors-examination.component';
import { ListExaminationsRequestComponent } from './components/list-examinations-request/list-examinations-request.component';
import { ListClinicAdministratorsComponent } from './components/list-clinic-administrators/list-clinic-administrators.component';
import { SearchRoomsComponent } from './components/search-rooms/search-rooms.component';
import { ListOfRoomsComponent } from './components/list-of-rooms/list-of-rooms.component';
import { ListOfExaminationTypesComponent } from './components/list-of-examination-types/list-of-examination-types.component';
import { ListRequestsToRegisterComponent } from './components/list-requests-to-register/list-requests-to-register.component';
import { UserChangePasswordComponent } from './components/user-change-password/user-change-password.component';
import { ListOfDoctorsComponent } from './components/list-of-doctors/list-of-doctors.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginPatientComponent } from './components/login-patient/login-patient.component';
import { RegisterPatientComponent } from './components/register-patient/register-patient.component';
import { PendingApprovalPatientComponent } from './components/pending-approval-patient/pending-approval-patient.component';
import { ErrorComponent } from './components/error/error.component';
import { ListClinicsComponent } from './components/list-clinics/list-clinics.component';
import { ListNursesComponent } from './components/list-nurses/list-nurses.component';


const routes: Routes = [
  {
    path: '',
    component: LoginPatientComponent,
  },
  {
    path: 'user/login',
    component: LoginPatientComponent,
  },
  {
    path: 'patient/register',
    component: RegisterPatientComponent,
  },
  {
    path: 'clinic-admin/doctors',
    component: ListOfDoctorsComponent,
  },
  {
    path: 'clinic-admin/examination-types',
    component: ListOfExaminationTypesComponent,
  },
  {
    path: 'clinic-admin/rooms',
    component: ListOfRoomsComponent,
  },
  {
    path: 'clinic-admin/search-rooms',
    component: SearchRoomsComponent,
  },
  {
    path: 'user/change-password',
    component: UserChangePasswordComponent,
  },
  {
    path: 'patient/pending-approval',
    component: PendingApprovalPatientComponent,
  },
  {
    path: 'clinical-centre-admin/requests-to-register',
    component: ListRequestsToRegisterComponent,
  },
  {
    path: 'clinical-centre-admin/clinics',
    component: ListClinicsComponent,
  },
  {
    path: 'clinical-centre-admin/clinic-administrators',
    component: ListClinicAdministratorsComponent,
  },
  {
    path: 'clinic-admin/nurses',
    component: ListNursesComponent
  },
  {
    path: 'clinical-centre-admin/examination/get-awaiting',
    component: ListExaminationsRequestComponent
  },
  {
    path: 'doctor/examinations',
    component: DoctorsExaminationComponent,
  },
  {
    path: 'error/non-authenticated',
    component: NonAuthenticatedErrorPageComponent,
  },
  {
    path: 'error/non-authorized',
    component: NonAuthorizedErrorPageComponent
  },
  {
    path: '**',
    component: ErrorComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
