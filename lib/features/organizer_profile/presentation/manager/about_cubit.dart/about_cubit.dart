import 'package:bloc/bloc.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/manager/about_cubit.dart/about_state.dart';

class AboutCubit extends Cubit<AboutStates> {
  AboutCubit() : super(InitialAboutState());
  getReviews({required String organizer}) {
    emit(LoadingAboutState());
    // المفروض اكمل هنا على اساس ان فيه database for each organizer!!
    // استلم اسمه واولد البيانات الخاصة بيه هو شخصيا بس
  }
}
