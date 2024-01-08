
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';
import 'bloc/apply_for_job_bloc.dart';

@RoutePage()
class ApplyForJobPage extends BasePage {
  const ApplyForJobPage({super.key});

  @override
  _ApplyForJobPageState createState() => _ApplyForJobPageState();
}

class _ApplyForJobPageState extends BasePageState<ApplyForJobPage, ApplyForJobBloc> {
  TextEditingController startTimeTextController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
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
    return BlocConsumer<ApplyForJobBloc, ApplyForJobPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   InkWell(onTap: ()=> context.router.pop(),child: Icon(Icons.arrow_back_rounded)),
                   10.width,
                   wText(getLocalization().apply, style: theme.textTheme.subtitle1),
                   Spacer(),
                   InkWell(
                     onTap: (){
                       context.router.push(ApplyForJobToolTipRoute());
                     },
                       child: Icon(Icons.info_outline, color: theme.colorScheme.secondary,))
                 ],
               ),
               20.height,
               wText(getLocalization().dateAndTime, style: theme.textTheme.titleMedium),
               40.height,
               Row(
                 children: [
                   SizedBox(
                     width: (MediaQuery.sizeOf(context).width/2)-30,
                     child: DateTextBox(
                         labelText: getLocalization().dateFormat,
                         controller: startDateController,
                         onDateSelected: (DateTime dateTime){
                           startDate = dateTime;
                           startDateController.text = DateFormatters.getWordDate(dateTime);
                         }),
                   ),
                   20.width,
                   SizedBox(
                     width: (MediaQuery.sizeOf(context).width/2)-30,
                     child: DateTextBox(
                         labelText: getLocalization().dateFormat,
                         controller: endDateController,
                         onDateSelected: (DateTime dateTime){
                           endDate= dateTime;
                           endDateController.text = DateFormatters.getWordDate(dateTime);
                         }),
                   ),
                 ],
               ),
              20.height,
               AppTextFormField(controller: startTimeTextController,
                 onChanged: (value){} ,
                 textFieldType: TextFieldType.NUMBER,
                 labelText: getLocalization().timeFormat,
                 suffix: InkWell(
                     onTap:() async{
                       TimeOfDay? timeofDay = await showTimePicker(
                           context: context,
                           initialTime:  TimeOfDay.now(),
                           initialEntryMode: TimePickerEntryMode.inputOnly);
                       startTimeTextController.text =
                       "${timeofDay?.hour}:${timeofDay!.minute < 10? "0${timeofDay?.minute}": timeofDay.minute}";
                     },
                     child: const Icon(Iconsax.clock)),),

               20.height,

               AppTextFormField(
                   controller: commentController,
                   keyboardType: TextInputType.multiline,
                   labelText: getLocalization().otherCommentsOptional,
                   textFieldType: TextFieldType.USERNAME,
                   maxLines: 10,maxLength: 2000),
               Spacer(),
               20.height,
               PrimaryButton(
                 width: MediaQuery.sizeOf(context).width,
                 style: ButtonStyle(
                     side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                       return BorderSide(
                         color: theme.colorScheme.primary,
                         width: 2,
                       );
                     }
                     ),
                     backgroundColor: MaterialStateProperty.resolveWith(
                             (Set<MaterialState> states){
                           return theme.colorScheme.primary;
                         }
                     )
                 ),
                 onPressed:() {
                   context.router.pushAndPopUntil(ApplicationSentRoute(),
                       predicate: (Route<dynamic> route) => false);
                 },
                 child: Text(getLocalization().apply),
               ),

             ],
           ),
         );
      },
    );
  }


  @override
  ApplyForJobBloc initBloc() {
    return locator<ApplyForJobBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
