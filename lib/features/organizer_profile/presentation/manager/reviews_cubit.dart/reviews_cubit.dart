import 'package:bloc/bloc.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/manager/reviews_cubit.dart/reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsStates> {
  ReviewsCubit() : super(InitialReviewsState());
  getReviews({required String organizer}) {
    emit(LoadingReviewsState());
    // المفروض اكمل هنا على اساس ان فيه database for each organizer!!
    // استلم اسمه واولد البيانات الخاصة بيه هو شخصيا بس
  }
}
