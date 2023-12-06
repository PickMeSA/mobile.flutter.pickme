
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_labeled_panel.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/final_details_bloc.dart';

@RoutePage()
class FinalDetailsPage extends BasePage {
  const FinalDetailsPage({super.key});

  @override
  _FinalDetailsPageState createState() => _FinalDetailsPageState();
}

class _FinalDetailsPageState extends BasePageState<FinalDetailsPage, FinalDetailsBloc> {
  String _filePath = '';
  bool isSelectingProfilePicture = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<FinalDetailsBloc, FinalDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  wText(getLocalization().step7,style:theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: theme.primaryColor
                  )),
                  const SizedBox(height: 10,),
                  wText(getLocalization().finalDetails,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                  20.height,
                   Row(
                    children: [
                    const Spacer(),
                      SizedBox(
                        height: 96,
                          width: 96,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectingProfilePicture = true;
                            });
                            _pickFile();
                          },
                          child: Stack(children: [
                            CircleAvatar(radius: 48,backgroundColor: Colors.grey),
                            Positioned(
                              top: 1,
                              left: 1,
                              child: CircleAvatar(
                                  backgroundColor:Colors.white70 ,
                              radius: 47,
                              child: SvgPicture.asset("assets/profile.svg")),
                            ),
                            const Positioned(
                              bottom: 0,
                                right: 10,
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.add, color: Colors.black,size: 11),
                                )),
                            const Positioned(
                                bottom:1,
                                right:11,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add, color: Colors.black,size: 11),
                                ))

                          ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  if(state is ProfilePictureAddedState && state.dataState == DataState.error)Padding(
                      padding: const EdgeInsets.only(top: 10),
                    child: Text(getBloc().uploadErrorMessage, style: TextStyle(color: theme.colorScheme.error),),
                  ),
                  40.height,
                  AppTextFormField(
                      keyboardType: TextInputType.multiline,
                      labelText: getLocalization().aboutYouBasedOnYourProfile,
                      textFieldType: TextFieldType.USERNAME,
                  maxLines: 10,maxLength: 2000),
                  labelledPanel(
                      labelText: getLocalization().policeClearanceOptional, 
                      content: Container(
                    height: 96 ,
                        child: Center(child: Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset("assets/upload_icon.svg"),
                            10.width,
                            wText(getLocalization().upload, style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.grey
                            )),
                            const Spacer(),
                          ],
                        )),
                  )),
                  40.height,
                  Row(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,
                                color: Colors.black),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: InkWell(onTap: ()=> context.router.pop(),child: const Icon(Icons.arrow_back)) ,

                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: PrimaryButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                return BorderSide(
                                  color: states.contains(MaterialState.disabled)?
                                  theme.colorScheme.primary.withOpacity(0):
                                  theme.colorScheme.primary,
                                  width: 2,
                                );
                              }
                              ),
                              backgroundColor: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states){
                                    return states.contains(MaterialState.disabled)?
                                    theme.colorScheme.primary.withOpacity(0.3):
                                    theme.colorScheme.primary;
                                  }
                              )
                          ),
                          onPressed: !getBloc().checked?null:() {
                            context.router.push(const YouAreAllSetupRoute());
                          },
                          child: Text(getLocalization().createProfile),
                        ),
                      ),
                    ],
                  )



                ],
              ),
            ),
          )  ,
        );
      },
    );
  }


  @override
  FinalDetailsBloc initBloc() {
    return locator<FinalDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      if(isSelectingProfilePicture){
        getBloc().add(ProfilePictureAddedEvent(filePath: result.files.single.path!));
      }
    } else {
      // User canceled the file picker
      // Handle accordingly (e.g., show a message)
    }
    setState(() {
      isSelectingProfilePicture = false;
    });
  }

}
