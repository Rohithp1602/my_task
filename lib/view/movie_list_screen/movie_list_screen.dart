import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/model/cat_model.dart';
import 'package:my_task/view/movie_list_screen/bloc/movie_list_cubit.dart';
import 'package:my_task/widgets/movie_card.dart';

import '../movie_detail_screen/movie_detail_screen.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MovieListCubit>().getDataFromApi().then((value) {
      List<DataModel> dataList = value;
      context.read<MovieListCubit>().getListData(dataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie')),
      body: BlocBuilder<MovieListCubit, MovieListState>(
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              (state.dataList != null && state.dataList!.isNotEmpty)
                  ? ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      itemCount: state.dataList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MovieDetailScreen(
                                  dataModel: state.dataList![index],
                                );
                              },
                            ));
                          },
                          child: MovieCard(
                            image:
                                'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
                            dataModel: state.dataList![index],
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink(),
              Visibility(
                  visible: state.isLoading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ))
            ],
          );
        },
      ),
    );
  }
}
