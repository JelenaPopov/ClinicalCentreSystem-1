import { RequestToRegisterService } from './../../services/request-to.register.service';

import { ToastrService } from 'ngx-toastr';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { FormGroup, Validators, FormControl } from '@angular/forms';

@Component({
  selector: 'app-reject-request-to-register',
  templateUrl: './reject-request-to-register.component.html',
  styleUrls: ['./reject-request-to-register.component.css']
})
export class RejectRequestToRegisterComponent implements OnInit {
  rejectRequestToRegisterForm: FormGroup;

  constructor(
    public toastr: ToastrService,
    private requestToRegisterService: RequestToRegisterService,
    public dialogRef: MatDialogRef<RejectRequestToRegisterComponent>,
    @Inject(MAT_DIALOG_DATA) public data
  ) { }

  ngOnInit(): void {
    this.rejectRequestToRegisterForm = new FormGroup({
      reason: new FormControl(null, Validators.required)
    });
  }

  reject(): void {
    if (this.rejectRequestToRegisterForm.invalid) {
      this.toastr.error('Please enter an explanation for rejection. ', 'Reject request to register ');
      return;
    }

    const id = this.data.id;
    const reason = this.rejectRequestToRegisterForm.value.reason;

    this.requestToRegisterService.reject(id, reason).subscribe(
      () => {
        this.rejectRequestToRegisterForm.reset();
        this.dialogRef.close();
        this.toastr.success(
          'Request to register is rejected. Patient will be notified ',
          'Reject request to register '
        );
        this.requestToRegisterService.rejectSuccessEmitter.next(reason);
      },
      () => {
        this.toastr.error("Request to register has already been approved/rejected.", 'Reject request to register');
        this.requestToRegisterService.rejectSuccessEmitter.next();
        this.dialogRef.close();
      }
    )
  }
}
