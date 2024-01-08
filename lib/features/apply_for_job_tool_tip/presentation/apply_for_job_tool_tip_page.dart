
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/apply_for_job_tool_tip/presentation/bloc/apply_for_job_tool_tip_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class ApplyForJobToolTipPage extends BasePage {
  const ApplyForJobToolTipPage({super.key});

  @override
  _ApplyForJobToolTipPageState createState() => _ApplyForJobToolTipPageState();
}

class _ApplyForJobToolTipPageState extends BasePageState<ApplyForJobToolTipPage, ApplyForJobToolTipBloc> {

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
    return BlocConsumer<ApplyForJobToolTipBloc, ApplyForJobToolTipPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   Icon(Icons.info_outline, color: theme.colorScheme.secondary,),
                   10.width,
                   wText(getLocalization().apply, style: theme.textTheme.subtitle1),
                   Spacer(),
                   InkWell(onTap: ()=> context.router.pop(),child: Icon(Icons.close, color: theme.colorScheme.secondary,)),


                 ],
               ),
               30.height,
               wText(getLocalization().dateOfJob, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
               20.height,
               wText(getLocalization().dateOfJobText)
             ],
           ),
         );
      },
    );
  }


  @override
  ApplyForJobToolTipBloc initBloc() {
    return locator<ApplyForJobToolTipBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
