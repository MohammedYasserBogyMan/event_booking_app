import 'package:bloc/bloc.dart';
import 'package:event_booking_app/features/search/data/repos/search_repo.dart';
import 'package:event_booking_app/features/search/presentation/manager/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(InitialSearchState());
  SearchRepo searchRepo;

  searchCategory({required String category}) async {
    emit(LoadingSearchState());
    var result = await searchRepo.getSpecificEventsByTitel(
      targetSearch: category,
    );
    result.fold(
      (failure) {
        emit(FailureSearchState(errMessage: failure.message));
      },
      (events) {
        emit(SuccessSearchState(events: events));
      },
    );
  }
}
