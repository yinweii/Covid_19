import 'package:corona/services/dataresource.dart';
import 'package:flutter/material.dart';

class StroragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Câu hỏi thường gặp"),
      ),
      body: ListView.builder(
        itemCount: DataResource.questionAnswer.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataResource.questionAnswer[index]['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  DataResource.questionAnswer[index]['answer'],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          );
        },
      ),
      
    );
  }
}
