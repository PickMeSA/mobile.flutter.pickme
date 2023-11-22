
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/rate_and_work_times_bloc.dart';

@RoutePage()
class RateAndWorkTimesPage extends BasePage {
  const RateAndWorkTimesPage({super.key});

  @override
  _RateAndWorkTimesPageState createState() => _RateAndWorkTimesPageState();
}

class _RateAndWorkTimesPageState extends BasePageState<RateAndWorkTimesPage, RateAndWorkTimesBloc> {

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
                   Row(
                     children: [
                       const Spacer(),
                       wText(getLocalization().skip,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
                     ],
                   ),
                   wText(
                     getLocalization().step4,
                     style: theme.textTheme.headlineLarge!.copyWith(
                       color: theme.primaryColor,
                     ),
                   ),
                   const SizedBox(height: 10,),
                   wText(getLocalization().whatIsYourHourlyRateAndWorkTimes,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                    30.height,
                   wText(getLocalization().hourlyRate, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                    10.height,
                   Row(
                     children: [
                       wText(getLocalization().r, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 32, fontWeight: FontWeight.w600))
                     ],
                   ),

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
                            // context.router.push(const RateAndWorkTimesRoute());
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
