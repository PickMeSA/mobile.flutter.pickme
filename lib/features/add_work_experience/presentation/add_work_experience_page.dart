
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/features/otp/domain/entities/FileEntity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';

import 'bloc/add_work_experience_bloc.dart';

@RoutePage()
class AddWorkExperiencePage extends BasePage {
   AddWorkExperiencePage({super.key});
  List<AppFileEntity>? files = [];
  @override
  _AddWorkExperiencePageState createState() => _AddWorkExperiencePageState();
}

class _AddWorkExperiencePageState extends BasePageState<AddWorkExperiencePage, AddWorkExperienceBloc> {

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

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<AddWorkExperienceBloc, AddWorkExperiencePageState>(
      listener: (context, state){
        if(state is AddWorkGetPreferredIndustryListState && state.dataState == DataState.success){

        }

        if(state is AddWorkGetPreferredIndustryListState && state.dataState == DataState.loading){

        }

        if(state is AddWorkGetPreferredIndustryListState && state.dataState == DataState.error){
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if(state.dataState == DataState.success && state is ProfilePictureAddedState){
          widget.files!.add(AppFileEntity(id: state.uploadFileEntity!.id, name: state.uploadFileEntity!.ref, url: state.uploadFileEntity!.url));
          Navigator.pop(context);

        }

        if(state.dataState == DataState.loading && state is ProfilePictureAddedState){
          preloader(context);
        }

        if(state.dataState == DataState.error && state is ProfilePictureAddedState){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if(state.dataState == DataState.success && state is RemoveImageClickedState){
          widget.files!.removeAt(state.index!);
        }

        if(state.dataState == DataState.error && state is RemoveImageClickedState){

        }

        if(state.dataState == DataState.loading && state is RemoveImageClickedState){

        }

      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return state is AddWorkGetPreferredIndustryListState && state.dataState == DataState.loading ?
         const Center(child: CircularProgressIndicator(),):
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: SizedBox(
             width: MediaQuery.sizeOf(context).width,
             height: MediaQuery.sizeOf(context).height- 100,
             child: SingleChildScrollView(
               child: Form(
                 key: _formKey,
                 child: Column(
                   children: [

                     Padding(
                       padding: const EdgeInsets.only(top: 20, bottom: 50),
                       child: Row(
                         children: [
                           wText(getLocalization().addWorkExperience, style: const TextStyle(
                               fontSize: 20, fontWeight: FontWeight.w400
                           )),
                           const Spacer(),
                           InkWell(
                               onTap: ()=>context.router.pop(),
                               child: const Icon(Icons.close, size: 24,))
                         ],
                       ),
                     ),
                     Padding(
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
                           label: wText(getLocalization().preferredIndustry,
                               style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey))),
                     ),

                     Padding(padding: const EdgeInsets.only(bottom: 15, top: 15),
                         child:InkWell(
                           onTap: (){
                             if(widget.files?.length == 6){
                               wErrorPopUp(message: getLocalization().noMoreThan6ImagesCanBeUploadedForEachExperience,
                                   type: getLocalization().error, context: context);
                             }else {
                               _pickFile();
                             }
                           },
                           child: Container(
                             height: 130,
                             child: Stack(
                                 children:<Widget> [
                                   Positioned(top: 10,
                                     child: Container(
                                       height: 100,
                                       width: MediaQuery.sizeOf(context).width- 40,
                                       decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), border: Border.all(color:Colors.black )),
                                       child: Center(
                                         child: SizedBox(
                                           width: 90,
                                           child: Row(
                                             children: [
                                               SvgPicture.asset("assets/upload_icon.svg",width: 25),
                                               Spacer(),
                                               wText(getLocalization().upload,
                                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400,fontSize: 16))
                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ]),
                           ),
                         )),

                     ListView.builder(
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: widget.files?.length,
                         itemBuilder: (context, index){
                           return widget.files == null && widget.files!.isEmpty && index != 0 && !index.isOdd ?
                           const SizedBox():
                           Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 16.0),
                                 child: Row(
                                   children: [
                                     if(index.isEven || index == 0)
                                       Expanded(child: ImageThumbnail(
                                         imagePath:  widget.files?[index].url,
                                         onRemove: ()=> getBloc().add(RemoveImageClickedEvent(index: index)),
                                       )),

                                     16.width, // Add some spacing between images
                                     if(widget.files?.length == index + 1)
                                       Expanded(child: Container(),),
                                     if(widget.files!.length > index + 1 && index.isEven)
                                       Expanded(child: ImageThumbnail(
                                         imagePath:  widget.files?[index + 1].url,
                                         onRemove: ()=>getBloc().add(RemoveImageClickedEvent(index: index + 1)),
                                       )),
                                   ],
                                 ),
                               ),
                             ],
                           );
                         }),
                     const SizedBox(height: 75,),
                     PrimaryButtonDark(
                         width: MediaQuery.sizeOf(context).width,
                         onPressed: (){
                           if(_formKey.currentState!.validate()){
                             Navigator.pop(context,getOtpWorkExperience());
                           }
                         },
                         child: wText(getLocalization().add))
                   ],
                 ),
               ),
             ),
           ),
         );
      },
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {

      getBloc().add(ProfilePictureAddedEvent(filePath: result.files.single.path!));
    } else {
      wErrorPopUp(message: getLocalization().uploadCancelledByUser, type: getLocalization().error, context: context);

    }
  }


  @override
  AddWorkExperienceBloc initBloc() {
    return locator<AddWorkExperienceBloc>();
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
        files: widget.files);
  }

}
