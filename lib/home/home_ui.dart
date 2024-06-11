import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_demo/logic/cubit/news_cubit.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  late ScrollController _scrollController;
  late NewsCubit _newsCubit;

  @override
  void initState() {
    super.initState();
    _newsCubit = BlocProvider.of<NewsCubit>(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _newsCubit.fetchSources();
  }

  void _onScroll() {
    if (_isBottom) {
      _newsCubit.loadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.95);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Sources'),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return const Center(child: Text('Press the button to fetch data'));
          } else if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsSuccess) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.newsList.fold(
                  0,
                  (count, newsModel) =>
                      count! + (newsModel.sources?.length ?? 0)),
              itemBuilder: (context, index) {
                final source = state.newsList
                    .expand((newsModel) => newsModel.sources ?? [])
                    .toList()[index];
                return ListTile(
                  title: Text(source.name ?? 'No name'),
                  subtitle: Text(source.description ?? 'No description'),
                );
              },
            );
          } else if (state is NewsFailure) {
            return Center(
                child: Text('Failed to fetch data: ${state.errorMessage}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
