
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/shared/widgets/w_time_picker.dart';

import 'bloc/rate_and_work_times_bloc.dart';

@RoutePage()
class RateAndWorkTimesPage extends BasePage {
  const RateAndWorkTimesPage({super.key});

  @override
  _RateAndWorkTimesPageState createState() => _RateAndWorkTimesPageState();
}

class _RateAndWorkTimesPageState extends BasePageState<RateAndWorkTimesPage, RateAndWorkTimesBloc> {

  TextEditingController amountTextController  = TextEditingController();
  TextEditingController startTimeTextController = TextEditingController();
  TextEditingController endTimeTextController = TextEditingController();
  TextEditingController workingDayTextController = TextEditingController();

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
    return BlocConsumer<RateAndWorkTimesBloc, RateAndWorkTimesPageState>(
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

                   wText(
                     getLocalization().step4,
                     style: theme.textTheme.headlineLarge!.copyWith(
                       color: theme.primaryColor,
                     ),
                   ),
                   const SizedBox(height: 10,),
                   Row(
                     children: [
                       Expanded(
                         child: wText(
                           getLocalization().whatIsYourHourlyRateAndWorkTimes,
                           style: theme.textTheme.headlineLarge!.copyWith(
                               fontWeight: FontWeight.w300
                           ),
                         ),
                       ),
                       TertiaryButton(onPressed: (){
                         context.router.push(const MinimumWageRoute());
                       },
                           child: Icon(Icons.info_outline, color: theme.colorScheme.secondary,)
                       )
                     ],
                   ),
                    30.height,
                   wText(getLocalization().hourlyRate, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                    10.height,
                   Row(
                     children: [
                       10.width,
                       wText(getLocalization().r,
                           style: theme.textTheme.bodyMedium?.copyWith(
                               fontSize: 32,
                               fontWeight: FontWeight.w600)),
                       30.width,
                       Expanded(child: AppTextFormField(
                         controller: amountTextController,
                         textFieldType: TextFieldType.NUMBER,
                       labelText: getLocalization().noAmount,)),
                       20.height
                     ],
                   ),
                   30.height,
                   wText(getLocalization().workingHours,
                       style: theme.textTheme.bodyMedium?.copyWith(
                           fontWeight: FontWeight.w700)),
                   20.height,
                   AppTextFormField(controller: startTimeTextController,
                     textFieldType: TextFieldType.NUMBER,
                   labelText: getLocalization().startTime,
                   suffix: InkWell(
                       onTap:()=> appTimePicker(context, startTimeTextController),
                       child: const Icon(Iconsax.clock)),),
                   10.height,
                   AppTextFormField(controller: endTimeTextController
                   ,textFieldType: TextFieldType.NUMBER,
                     labelText: getLocalization().endTime,
                     suffix: InkWell(
                         onTap: ()=> appTimePicker(context, endTimeTextController),
                         child: const Icon(Iconsax.clock)),),
                   30.height,
                   wText(getLocalization().workingDays,
                       style: theme.textTheme.bodyMedium?.copyWith(
                           fontWeight: FontWeight.w700)),
                   10.height,
                   AppDropdownMenu(label: wText(getLocalization().workingDaysA),
                       controller: workingDayTextController,
                       width: MediaQuery.sizeOf(context).width -40,
                       enableFilter: true,
                       dropdownMenuEntries: []),
                   const SizedBox(height: 50,),
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
                         child: PrimaryButtonDark(
                           style: ButtonStyle(
                               side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                 return BorderSide(
                                   color: states.contains(MaterialState.disabled)?
                                   theme.colorScheme.secondary.withOpacity(0):
                                   theme.colorScheme.secondary,
                                   width: 2,
                                 );
                               }
                               ),
                               backgroundColor: MaterialStateProperty.resolveWith(
                                       (Set<MaterialState> states){
                                     return states.contains(MaterialState.disabled)?
                                     theme.colorScheme.secondary.withOpacity(0.3):
                                     theme.colorScheme.secondary;
                                   }
                               )
                           ),
                           onPressed: !getBloc().checked?null:() {
                            context.router.push(const BankDetailsRoute());
                           },
                           child: Text(getLocalization().nextStep),
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
  RateAndWorkTimesBloc initBloc() {
    return locator<RateAndWorkTimesBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
