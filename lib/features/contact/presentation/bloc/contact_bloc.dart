import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

import '../../domain/entities/contact_page_entity.dart';
import '../../domain/use_cases/get_my_reviews_page_entity_use_case.dart';


part 'contact_event.dart';
part 'contact_state.dart';

@injectable
class ContactPageBloc extends BaseBloc<ContactPageEvent, ContactPageState> {
  ContactPageBloc() : super(ContactPageInitialState());
}
