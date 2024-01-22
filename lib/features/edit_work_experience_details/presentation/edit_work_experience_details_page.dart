
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';

import 'bloc/edit_work_experience_details_bloc.dart';

@RoutePage()
class EditWorkExperienceDetailsPage extends BasePage {
   EditWorkExperienceDetailsPage({required this.otpWorkExperienceEntity,super.key});
  OTPWorkExperienceEntity otpWorkExperienceEntity;
  @override
  _EditWorkExperienceDetailsPageState createState() => _EditWorkExperienceDetailsPageState();
}

class _EditWorkExperienceDetailsPageState extends BasePageState<EditWorkExperienceDetailsPage, EditWorkExperienceDetailsBloc> {

  late TextEditingController positionTitleController = TextEditingController();
  late TextEditingController companyController = TextEditingController();
  late TextEditingController startDateController = TextEditingController();
  late TextEditingController endDateController = TextEditingController();
  late TextEditingController dropdownIndustryController = TextEditingController();
  late DateTime startDate = DateTime.now();
  late DateTime endDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(AddWorkExperienceGetPreferredIndustryListEvent());
    positionTitleController.text = widget.otpWorkExperienceEntity.title??"";
    companyController.text = widget.otpWorkExperienceEntity.company??"";
    startDateController.text = DateFormatters.getWordDate(widget.otpWorkExperienceEntity.startDate!);
    endDateController.text = DateFormatters.getWordDate(widget.otpWorkExperienceEntity.endDate?? DateTime.now());
    dropdownIndustryController.text = getBloc().preferredIndustryListEntity.preferredIndustryListEntity!.where((element) =>
    element.id == widget.otpWorkExperienceEntity.industryId).toString();
    startDate = widget.otpWorkExperienceEntity.startDate!;
    endDate = widget.otpWorkExperienceEntity.endDate?? DateTime.now();
    getBloc().current = widget.otpWorkExperienceEntity.isCurrent?? false;
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<EditWorkExperienceDetailsBloc, EditWorkExperienceDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return state.dataState == DataState.loading &&  state is AddWorkGetPreferredIndustryListState?Center(child: CircularProgressIndicator(),):
         SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                   Row(
                     children: [
                       InkWell(onTap: ()=> context.router.pop()
                           ,child: const Icon(Icons.arrow_back_rounded)),
                       20.width,
                       wText(getLocalization().editWorkExperience, style: theme.textTheme.titleLarge),
                     ],
                   ),

                   20.height,
                   Form(
                     key: _formKey,
                     child: Padding(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: AppTextFormField(
                           controller:  positionTitleController,
                           validator: (value){
                             if(value!.isEmpty){
                               return getLocalization().pleaseEnterPositionTitle;
                             }
                           },textFieldType: TextFieldType.NAME,
                           labelText: getLocalization().positionTitle),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: AppTextFormField(
                       controller: companyController,
                       validator: (value){
                         if(value!.isEmpty){
                           return getLocalization().pleaseEnterCompanyName;
                         }
                       },
                       textFieldType: TextFieldType.NAME,
                       labelText: getLocalization().company,),
                   ),
                   const AppDivider(),
                   Padding(
                     padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                     child: Row(
                       children: [
                         Checkbox(value: getBloc().current, onChanged: (value){
                           getBloc().add(AddWorkExperienceCurrentSelectedEvent());

                         }, ),
                         wText(getLocalization().imCurrentlyWorkingInThisRole),
                         const Spacer(),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 10.0),
                     child: DateTextBox(labelText: getLocalization().startDate,
                       controller: startDateController,
                       onDateSelected: (DateTime dateTime){
                         startDate = dateTime;
                         startDateController.text = DateFormatters.getWordDate(dateTime);
                       },),
                   ),
                   if(!getBloc().current )
                     Padding(
                       padding: const EdgeInsets.only(bottom: 10.0),
                       child: DateTextBox(labelText: getLocalization().endDate,
                         controller: endDateController,
                         onDateSelected: (DateTime dateTime){
                           endDate = dateTime;
                           endDateController.text = DateFormatters.getWordDate(dateTime);
                         },),
                     ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: AppDropdownMenu<PreferredIndustryEntity>(
                         onSelected: (selected){
                           getBloc().add(PreferredIndustrySelectedEvent(preferredIndustry: selected!));
                         },
                         width: MediaQuery.sizeOf(context).width - 40,
                         enableFilter: true,
                         dropdownMenuEntries: getBloc().industryEntries,
                         controller: dropdownIndustryController,
                         label: wText(getLocalization().industry,
                             style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey))),
                   ),
                 ],
               ),
             ),
           ),
         );
      },
    );
  }


  @override
  EditWorkExperienceDetailsBloc initBloc() {
    return locator<EditWorkExperienceDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  OTPWorkExperienceEntity getOtpWorkExperience(){
    return OTPWorkExperienceEntity(
        title: positionTitleController.text,
        startDate: startDate,
        endDate: endDate,
        company: companyController.text,
        industryId: int.parse(getBloc().selectedIndustry.id!),
        isCurrent: getBloc().current,
        files: []);
  }


}
