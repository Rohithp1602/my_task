import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/model/cat_model.dart';
import 'package:my_task/view/movie_list_screen/bloc/cat_list_cubit.dart';
import 'package:my_task/widgets/cat_card.dart';

import '../movie_detail_screen/cat_detail_screen.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CatListCubit>().getDataFromApi().then((value) {
      List<CateDataModel> dataList = value;
      context.read<CatListCubit>().getListData(dataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat List')),
      body: BlocBuilder<CatListCubit, CatListState>(
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
                                return CatDetailScreen(
                                  dataModel: state.dataList![index],
                                );
                              },
                            ));
                          },
                          child: CatCard(
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
