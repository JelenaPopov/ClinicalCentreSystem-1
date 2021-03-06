import { ExaminationType } from './../../models/examinationType';
import { formatDate } from '@angular/common';
import { PredefinedExamination } from './../../models/predefinedExamination';
import { RoomService } from './../../services/room.service';
import { MatDialogRef } from '@angular/material/dialog';
import { ExaminationTypeService } from '../../services/examination-type.service';
import { DoctorService } from './../../services/doctor.service';
import { ToastrService } from 'ngx-toastr';
import { Room } from './../../models/room';
import { Doctor } from './../../models/doctor';
import { FormGroup, FormControl, Validators, FormBuilder, ValidatorFn } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { ExaminationService } from 'src/app/services/examination.service';

const TimeVal: ValidatorFn = (fg: FormGroup) => {
  const from = fg.get('timeFrom').value;
  const to = fg.get('timeTo').value;
  if (!from || !to) {
    return null;
  }
  return from !== null && to !== null && from < to
    ? null
    : { timeError: true };
};

@Component({
  selector: 'app-add-predefined-examination',
  templateUrl: './add-predefined-examination.component.html',
  styleUrls: ['./add-predefined-examination.component.css']
})
export class AddPredefinedExaminationComponent implements OnInit {
  addPredefinedExaminationForm: FormGroup;
  dateTimeTypeForm: FormGroup;
  examinationTypes: ExaminationType[] = [];
  doctors: Doctor[] = [];
  rooms: Room[] = [];
  minDate = new Date();
  timeError = false;

  constructor(private toastr: ToastrService, private doctorService: DoctorService, private examinationTypeService: ExaminationTypeService,
    private examinationService: ExaminationService, private roomService: RoomService, private formBuilder: FormBuilder,
    public dialogRef: MatDialogRef<AddPredefinedExaminationComponent>) { }

  ngOnInit(): void {
    this.minDate.setDate(this.minDate.getDate() + 1);

    this.dateTimeTypeForm = this.formBuilder.group({
      date: new FormControl(null, [Validators.required]),
      timeFrom: new FormControl(null, [Validators.required]),
      timeTo: new FormControl(null, [Validators.required]),
      examinationType: new FormControl(null, [Validators.required])
    }, {
      validator: [TimeVal]
    });

    this.addPredefinedExaminationForm = new FormGroup({
      doctor: new FormControl(null, [Validators.required]),
      room: new FormControl(null, [Validators.required]),
      discount: new FormControl(null, [Validators.required, Validators.min(1), Validators.max(99)])
    });

    this.getExaminationTypes();
  }

  getExaminationTypes(): void {
    this.examinationTypeService.getExaminationTypesForAdmin().subscribe((data) => {
      this.examinationTypes = data;
    })
  }

  getDoctors(): void {
    const examinationType = this.dateTimeTypeForm.value.examinationType;
    if (this.dateTimeTypeForm.value.date && this.dateTimeTypeForm.value.timeFrom && this.dateTimeTypeForm.value.timeTo) {
      const date = formatDate(this.dateTimeTypeForm.value.date, 'yyyy-MM-dd', 'en-US')
      const startDateTime = date + ' ' + this.dateTimeTypeForm.value.timeFrom;
      const endDateTime = date + ' ' + this.dateTimeTypeForm.value.timeTo;
      this.doctorService.getAllAvailableDoctors(examinationType.id, startDateTime, endDateTime).subscribe((data: Doctor[]) => {
        this.doctors = data;
      })
    } else {
      this.doctors = [];
    }

  }

  getRooms(): void {
    if (this.dateTimeTypeForm.value.date && this.dateTimeTypeForm.value.timeFrom && this.dateTimeTypeForm.value.timeTo) {
      const date = formatDate(this.dateTimeTypeForm.value.date, 'yyyy-MM-dd', 'en-US');
      const startDateTime = date + ' ' + this.dateTimeTypeForm.value.timeFrom;
      const endDateTime = date + ' ' + this.dateTimeTypeForm.value.timeTo;
      this.roomService.getAvailableExaminationRooms(startDateTime, endDateTime).subscribe((data: Room[]) => {
        this.rooms = data;
      })
    } else {
      this.rooms = [];
    }

  }

  next(): void {
    if (!(this.dateTimeTypeForm.value.timeFrom || this.dateTimeTypeForm.value.timeTo)) {
      this.timeError = true;
    }

    if (this.dateTimeTypeForm.value.timeFrom >= this.dateTimeTypeForm.value.timeTo) {
      this.timeError = true;
    }

    this.getDoctors();
    this.getRooms();
  }

  create(): void {
    if (this.addPredefinedExaminationForm.invalid || this.dateTimeTypeForm.invalid) {
      this.toastr.error('Please enter a valid data.', 'Create predefined examination');
      return;
    }
    const date = formatDate(this.dateTimeTypeForm.value.date, 'yyyy-MM-dd', 'en-US')
    const startDateTime = date + ' ' + this.dateTimeTypeForm.value.timeFrom;
    const endDateTime = date + ' ' + this.dateTimeTypeForm.value.timeTo;

    const predefinedExamination = new PredefinedExamination(startDateTime, endDateTime, this.dateTimeTypeForm.value.examinationType,
      this.addPredefinedExaminationForm.value.doctor, this.addPredefinedExaminationForm.value.room.id, this.addPredefinedExaminationForm.value.discount);

    this.examinationService.createPredefinedExamination(predefinedExamination).subscribe(
      (responseData) => {
        this.addPredefinedExaminationForm.reset();
        this.dateTimeTypeForm.reset();
        this.dialogRef.close();
        this.toastr.success('Successfully created a new predefined examination.', 'Create predefined examination');
        this.examinationService.successCreatedPredefinedExamination.next(predefinedExamination);
      },
      () => {
        this.toastr.error('Error during creation of predefined examination.', 'Create predefined examination');
      }
    );
  }

}
