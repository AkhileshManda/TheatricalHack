import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ScriptCard extends StatelessWidget {
  final String title;
  final String description;
  const ScriptCard({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              subtitle: SizedBox(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          description,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(
                        height:50,
                        child: RatingBar.builder(
                          initialRating: 3,
                          allowHalfRating: false,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber[400],
                         ),
                         itemCount: 5,
                         itemSize: 35.0,
                         onRatingUpdate: (double value) {},
                     ),
                      ),
                    ],
                  )),
              trailing: Text("Click To review",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.w700)),
            ),
            // SizedBox(height: 5),
            
          ]),
    );
  }
}
