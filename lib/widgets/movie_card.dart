import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_task/model/cat_model.dart';

class MovieCard extends StatelessWidget {
  final DataModel dataModel;
  final String image;

  const MovieCard({super.key, required this.dataModel, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                height: 200,
                placeholder: (context, url) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Center(
                    child: Icon(
                      Icons.error,
                      size: 50,
                    ),
                  );
                },
                width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  dataModel.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  dataModel.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
