
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/edit_photos_of_work/presentation/bloc/edit_photos_of_work_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/features/otp/domain/entities/FileEntity.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class EditPhotosOfWorkPage extends BasePage {

  List<AppFileEntity>? files;
  EditPhotosOfWorkPage({this.files,super.key});

  @override
  _EditPhotosOfWorkPageState createState() => _EditPhotosOfWorkPageState();
}

class _EditPhotosOfWorkPageState extends BasePageState<EditPhotosOfWorkPage, EditPhotosOfWorkBloc> {

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
    return BlocConsumer<EditPhotosOfWorkBloc, EditPhotosOfWorkPageState>(
      listener: (context, state){
        if(state.dataState == DataState.success && state is ProfilePictureAddedState){
          widget.files!.add(AppFileEntity(id: state.uploadFileEntity!.id!, name: state.uploadFileEntity!.ref!, url: state.uploadFileEntity!.url!));
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
         return SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       InkWell(onTap: ()=> Navigator.pop(context)
                           ,child: const Icon(Icons.arrow_back_rounded)),
                       20.width,
                       wText(getLocalization().editPhotosOfWork, style: theme.textTheme.titleLarge),
                     ],
                   ),
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
                   30.height,
                   Padding(padding: const EdgeInsets.only(bottom: 30, top: 15),
                       child:InkWell(
                         onTap: (){
                           if(widget.files?.length == 6) {
                             wErrorPopUp(message: getLocalization().noMoreThan6ImagesCanBeUploadedForEachExperience,
                                 type: getLocalization().error, context: context);
                           }else{
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

                   Row(
                     children: [
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
                           onPressed: () {
                          context.router.pop();
                           },
                           child: Text(getLocalization().save),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ),
           ),
          );
      },
    );
  }


  @override
  EditPhotosOfWorkBloc initBloc() {
    return locator<EditPhotosOfWorkBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {

      getBloc().add(ProfilePictureAddedEvent(filePath: result.files.single.path!));
    } else {
      wErrorPopUp(message: getLocalization().uploadCancelledByUser, type: getLocalization().error, context: context);

    }
  }


}
