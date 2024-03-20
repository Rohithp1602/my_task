import 'package:flutter/material.dart';
import 'package:my_task/model/cat_model.dart';
import 'package:url_launcher/url_launcher.dart';
class CatDetailScreen extends StatelessWidget {
  final CateDataModel dataModel;

  const CatDetailScreen({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://cdn2.thecatapi.com/images/${dataModel.referenceImageId}.jpg',
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              dataModel.description ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Temperament:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              dataModel.temperament ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Life Span:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              dataModel.lifeSpan ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Origin:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              dataModel.origin ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed:() async {
                String url = dataModel.wikipediaUrl ?? "";
                await launchUrl(Uri.parse(url));
              },
              child: const Text(
                'More Info on Wikipedia',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
