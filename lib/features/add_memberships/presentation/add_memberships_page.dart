
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/add_memberships_bloc.dart';

@RoutePage()
class AddMembershipsPage extends BasePage {
  const AddMembershipsPage({super.key});

  @override
  _AddMembershipsPageState createState() => _AddMembershipsPageState();
}

class _AddMembershipsPageState extends BasePageState<AddMembershipsPage, AddMembershipsBloc> {

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
    return BlocConsumer<AddMembershipsBloc, AddMembershipsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: Container(
             width: MediaQuery.sizeOf(context).width,
             height: MediaQuery.sizeOf(context).height- 100,
             child: Form(
               child: Column(
                 children: [

                   Padding(
                     padding: const EdgeInsets.only(top: 20, bottom: 50),
                     child: Row(
                       children: [
                         wText(getLocalization().addMembershipOrAward, style: const TextStyle(
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
                     child: AppTextFormField(textFieldType: TextFieldType.NAME,
                         labelText: getLocalization().name),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: AppTextFormField(textFieldType: TextFieldType.NAME,
                       labelText: getLocalization().issuingOrganisations,),
                   ),
                   DateTextBox(labelText: getLocalization().issueDate,),
                   const Spacer(),
                   PrimaryButton(width: MediaQuery.sizeOf(context).width,onPressed: (){}, child: wText(getLocalization().add))

                 ],
               ),
             ),
           ),
         );
      },
    );
  }


  @override
  AddMembershipsBloc initBloc() {
    return locator<AddMembershipsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
}
