import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination_demo/api_service/api_service.dart';

import '../../models/news_model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._service) : super(NewsInitial());
  final ApiService _service;

  int currentPage = 1;
  bool isFetching = false;

  Future<void> fetchSources({bool isPagination = false}) async {
    if (isFetching) return;
    isFetching = true;

    if (!isPagination) {
      emit(NewsLoading());
    }

    try {
      final newsModel = await _service.fetchSources();
      if (state is NewsSuccess) {
        final currentState = state as NewsSuccess;
        emit(NewsSuccess(newsList: currentState.newsList + [newsModel]));
      } else {
        emit(NewsSuccess(newsList: [newsModel]));
      }
    } catch (e) {
      emit(NewsFailure(errorMessage: e.toString()));
    }

    isFetching = false;
  }

  void loadMore() {
    fetchSources(isPagination: true);
  }
}
