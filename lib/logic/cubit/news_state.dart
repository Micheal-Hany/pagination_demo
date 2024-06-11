part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<NewsModel> newsList;
  NewsSuccess({required this.newsList});
}

final class NewsFailure extends NewsState {
  final String errorMessage;
  NewsFailure({required this.errorMessage});
}
