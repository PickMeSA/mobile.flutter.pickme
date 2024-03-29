
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/constants/qualifications.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';
import 'bloc/add_qualification_bloc.dart';

@RoutePage()
class AddQualificationPage extends BasePage {
  const AddQualificationPage({super.key});

  @override
  _AddQualificationPageState createState() => _AddQualificationPageState();
}

class _AddQualificationPageState extends BasePageState<AddQualificationPage, AddQualificationBloc> {

  TextEditingController qualificationNameController = TextEditingController();
  TextEditingController issuingOrganisationController = TextEditingController();
  TextEditingController qualificationTypeController = TextEditingController();
  TextEditingController issueDateController = TextEditingController();

  late DateTime? selectedDateTime = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(GetPageInformationEvent());

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<AddQualificationBloc, AddQualificationPageState>(
      listener: (context, state){
        if(state is ProfilePictureAddedState && state.dataState == DataState.success){
            Navigator.pop(context);

        }
        if(state is ProfilePictureAddedState && state.dataState == DataState.loading){
            preloader(context);

        }

        if(state is ProfilePictureAddedState && state.dataState == DataState.error){
            Navigator.pop(context);
            wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);

        }

      },
      builder: (context, state) {
         return SizedBox(
           width: MediaQuery.sizeOf(context).width,
           height: MediaQuery.sizeOf(context).height,
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Form(
                 key: _formKey,
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 20, bottom: 50),
                       child: Row(
                         children: [
                           SizedBox(
                             width: MediaQuery.sizeOf(context).width - 100,
                             child: wText(getLocalization().addAQualificationOrMembership, style: const TextStyle(
                               fontSize: 20, fontWeight: FontWeight.w400
                             )),
                           ),
                           const Spacer(),
                           InkWell(
                               onTap: ()=>context.router.pop(),
                               child: const Icon(Icons.close, size: 24,))
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom:20 , right: 40),
                       child: AppDropdownMenu<Qualifications>(
                           label: wText(getLocalization().qualificationType),
                           enableFilter: true,
                           dropdownMenuEntries: state.entries??[],
                         width: MediaQuery.of(context).size.width-40,
                       controller: qualificationTypeController,),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: AppTextFormField(
                         validator: (value){
                           if(value!.isEmpty){
                             return getLocalization().pleaseEnterQualificationName;
                           }
                         },
                           textFieldType: TextFieldType.NAME,
                           labelText: getLocalization().qualificationName,
                       controller: qualificationNameController),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: AppTextFormField(
                         validator: (value){
                           if(value!.isEmpty){
                             return getLocalization().pleaseEnterIssuingOrganization;
                           }
                         },
                         textFieldType: TextFieldType.NAME,
                       labelText: getLocalization().issuingOrganisations,
                       controller: issuingOrganisationController,),
                     ),


                     DateTextBox(
                         labelText: getLocalization().issueDate,
                       controller: issueDateController,
                     onDateSelected: (DateTime dateTime){
                        selectedDateTime = dateTime;
                       issueDateController.text = DateFormatters.getWordDate(dateTime);
                     }),
                     Padding(padding: const EdgeInsets.only(bottom: 30, top: 15),
                         child:InkWell(
                           onTap: (){
                              _pickFile();
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
                                 Positioned(left: 20, top: 0,child: Container(
                                   width: 100,
                                   decoration: BoxDecoration(color: Colors.white) ,
                                   child: Center(child: wText(getLocalization().certificate)),
                                 )),

                             ]),
                           ),
                         )),
                     wText(getBloc().finalDetailsEntity.profilePicture?.ref??""),
                     20.height,
                     PrimaryButtonDark(width: MediaQuery.sizeOf(context).width,onPressed: (){
                       if(_formKey.currentState!.validate()){
                         Navigator.pop(context, getQualification());
                       }
                     }, child: wText(getLocalization().add))
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
    // File? result = await FilePicker.platform.pickFiles();
    ImagePicker imagePicker = ImagePicker();
    XFile? result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      getBloc().add(ProfilePictureAddedEvent(filePath: result.path!));
    } else {
      // User canceled the file picker
      // Handle accordingly (e.g., show a message)
    }

  }


  @override
  AddQualificationBloc initBloc() {
    return locator<AddQualificationBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  OTPQualificationEntity getQualification(){
    return OTPQualificationEntity(
        issueDate: selectedDateTime ,
        type: qualificationTypeController.text,
        name: qualificationNameController.text,
        issuingOrganization: issuingOrganisationController.text,
        supportingDocuments: getBloc().finalDetailsEntity.profilePicture?.id.toString()??"");

  }

}
