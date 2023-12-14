
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'bloc/job_details_bloc.dart';

@RoutePage()
class JobDetailsPage extends BasePage {
  const JobDetailsPage({super.key});

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends BasePageState<JobDetailsPage, JobDetailsBloc> {

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
    return BlocConsumer<JobDetailsBloc, JobDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Row(
                   children: [
                     InkWell(onTap: ()=> context.router.pop(),child: Icon(Iconsax.arrow_left)),
                     20.width,
                     wText(getLocalization().jobDetails, style: theme.textTheme.subtitle1)
                   ],
                 ),
                 30.height,


               ],
             ),
           ),
         );
      },
    );
  }


  @override
  JobDetailsBloc initBloc() {
    return locator<JobDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
