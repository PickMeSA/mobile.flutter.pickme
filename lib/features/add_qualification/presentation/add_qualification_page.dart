
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/constants/qualifications.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/add_qualification_bloc.dart';

@RoutePage()
class AddQualificationPage extends BasePage {
  const AddQualificationPage({super.key});

  @override
  _AddQualificationPageState createState() => _AddQualificationPageState();
}

class _AddQualificationPageState extends BasePageState<AddQualificationPage, AddQualificationBloc> {

  TextEditingController qualificationName = TextEditingController();
  TextEditingController issuingorganisation = TextEditingController();

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
                         wText(getLocalization().addAQualification, style: const TextStyle(
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
                     padding: const EdgeInsets.only(bottom:20 , right: 40),
                     child: AppDropdownMenu<Qualifications>(

                         label: wText(getLocalization().qualificationType),
                         enableFilter: true,
                         dropdownMenuEntries: state.entries??[],
                       width: MediaQuery.of(context).size.width-40,),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: AppTextFormField(textFieldType: TextFieldType.NAME,
                         labelText: getLocalization().qualificationName),
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
  AddQualificationBloc initBloc() {
    return locator<AddQualificationBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

}
