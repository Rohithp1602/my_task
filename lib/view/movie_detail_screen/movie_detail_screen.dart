import 'package:flutter/material.dart';
import 'package:my_task/model/cat_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final DataModel dataModel;
  const MovieDetailScreen({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(dataModel.name),
            const Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(dataModel.description),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
