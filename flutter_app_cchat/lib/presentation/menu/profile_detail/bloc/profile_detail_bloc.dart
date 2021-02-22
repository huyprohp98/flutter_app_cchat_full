import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/bloc/profile_detail_event.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/bloc/profile_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  final UserRepository _userRepository;

  ProfileDetailBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ProfileDetailState get initialState => ProfileDetailLoaded();

  @override
  Stream<ProfileDetailState> mapEventToState(ProfileDetailEvent event) async* {
    if (event is OpenFullnameForm) {
      yield* _mapOpenFullnameFormToState();
    } else if (event is OpenPhoneForm) {
      yield* _mapOpenPhoneFormToState();
    } else if (event is OpenEmailForm) {
      yield* _mapOpenEmailFormToState();
    } else if (event is OpenBirthdayForm) {
      yield* _mapOpenBirthdayFormToState();
    }
  }

  Stream<ProfileDetailState> _mapOpenFullnameFormToState() async* {
    yield ProfileDetailFullnameFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenPhoneFormToState() async* {
    yield ProfileDetailPhoneFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenEmailFormToState() async* {
    yield ProfileDetailEmailFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenBirthdayFormToState() async* {
    yield ProfileDetailBirthdayFormOpened();
  }
}
