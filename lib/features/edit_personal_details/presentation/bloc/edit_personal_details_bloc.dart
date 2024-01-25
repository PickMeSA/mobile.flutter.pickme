import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/features/bank_details/domain/usecases/bank_details_submitted_usecase.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_list_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart';
import 'package:pickme/features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart';

part 'edit_personal_details_event.dart';
part 'edit_personal_details_state.dart';

@injectable
class EditPersonalDetailsBloc
    extends BaseBloc<EditPersonalDetailsPageEvent, EditPersonalDetailsPageState> {
    List<WorkingDaysEntity> workingDaysEntityList = getWorkingDays();
    List<WorkingDaysEntity> selectedDays = [];
    List<DropdownMenuEntry<WorkingDaysEntity>> workingDayEntries =[];
    final OTPSaveRemoteProfileDataUseCase otpSaveRemoteProfileDataUseCase;
    //final BankDetailsSubmittedUseCase bankDetailsSubmittedUseCase;
    final SubmitRemoteRateAndWorkTimesUseCase submitRemoteRateAndWorkTimesUseCase;
    List<ChipOption> chipOptions = [];
    bool checked = false;
    bool? preloaderActive = false;
    EditPersonalDetailsBloc({
        required this.otpSaveRemoteProfileDataUseCase,
    required this.submitRemoteRateAndWorkTimesUseCase}): super(EditPersonalDetailsPageInitState()) {
        workingDayEntries = getWorkingDayEntries();
        on<UpdatePersonalDetailsEvent>((event, emit)=> _onUpdatePersonalDetailsEvent(event,emit));
        on<SkillChipDeletedEvent>((event,emit) => _onSkillChipDeletedEvent(event,emit));
        on<WorkingDaySelectedEvent>((event, emit)=> _onWorkingDaySelectedEvent(event,emit));
    }

    List<DropdownMenuEntry<WorkingDaysEntity>> getWorkingDayEntries(){
        List<DropdownMenuEntry<WorkingDaysEntity>> workingDaysEntries = [];
        workingDaysEntityList.forEach((element) {
            workingDaysEntries.add(DropdownMenuEntry(value: element, label: element.day));
        });
        return workingDaysEntries;
    }

    Future<void> _onWorkingDaySelectedEvent(
        WorkingDaySelectedEvent event,
        Emitter<EditPersonalDetailsPageState> emit
        )async{


            if(!selectedDays.contains(event.workingDaysEntity)){
                event.profileEntity?.ratesAndWorkTimesEntity?.workingDaysListEntity
                    ?.workingDaysEntityList!.add(event.workingDaysEntity);
                selectedDays.add(event.workingDaysEntity);
                chipOptions.add(ChipOption(label: event.workingDaysEntity.day, id:0));
                emit(WorkingDaySelectedState()..dataState = DataState.success);
            }
    }

    Future<void> _onSkillChipDeletedEvent(
            SkillChipDeletedEvent event,
        Emitter<EditPersonalDetailsPageState> emit
        )async{
        selectedDays.removeAt(event.index!);
        chipOptions.removeAt(event.index!);
        //event.profileEntity!.ratesAndWorkTimesEntity!.workingDaysListEntity!.workingDaysEntityList!.removeAt(event.index!);
        emit(SkillsUpdateState()..dataState = DataState.success);

    }

    Future<void>_onUpdatePersonalDetailsEvent(
        UpdatePersonalDetailsEvent event,
        Emitter<EditPersonalDetailsPageState> emit)async {
        emit(UpdatePersonalDetailsState()..dataState = DataState.loading);
        try{

            await otpSaveRemoteProfileDataUseCase.call(
                params: OTPSaveRemoteProfileDataUseCaseParams(
                    userModel: UserEntity(
                        mobile: event.profileEntity.mobile??"",
                    surname: event.profileEntity.surname??"",
                    email: event.profileEntity.email??"",
                    firstName: event.profileEntity.firstName??"",
                    idNumber: event.profileEntity.idNumber??"",
                    passportNumber: event.profileEntity.passportNumber??"",
                    subscriptionType: "",
                    profileType: event.profileEntity.type??"",
                    workPermitNumber: event.profileEntity.workPermit??"")));

            /* await bankDetailsSubmittedUseCase.call(
                params: BankDetailsSubmittedUseCaseParams(
                    bankDetailsEntity:BankDetailsEntity(
                        accountNumber: event.profileEntity.paymentDetails?.bankAccountNumber??"",
                        accountType:event.profileEntity.paymentDetails?.bankAccountType??"" ,
                        branchCode:event.profileEntity.paymentDetails?.bankBranchCode??"" ,
                        bank:event.profileEntity.paymentDetails?.bankName??"" ,
                    ) )); */

            ProfileEntity profileEntity = await submitRemoteRateAndWorkTimesUseCase.call(
                params: SubmitRemoteRateAndWorkTimesUseCaseParams(
                ratesAndWorkTimesEntity: RatesAndWorkTimesEntity(
                    hourlyRate: event.profileEntity.ratesAndWorkTimesEntity?.hourlyRate??"",
                    endTime: event.profileEntity.ratesAndWorkTimesEntity?.endTime??"",
                    startTime:  event.profileEntity.ratesAndWorkTimesEntity?.startTime??"",
                    workingDaysListEntity: WorkingDaysListEntity(workingDaysEntityList: selectedDays)
                )));

            emit(UpdatePersonalDetailsState(profileEntity:  profileEntity)..dataState = DataState.success);

        }catch(ex){
            emit(UpdatePersonalDetailsState(error: ex.toString())..dataState = DataState.error);

        }
    }




}
