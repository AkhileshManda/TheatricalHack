import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayOfTheDayCard extends StatelessWidget {
  final String title; final String author; final String url; final String image;
  const PlayOfTheDayCard({ Key? key, required this.title, 
  required this.author, required this.url, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image(image: AssetImage(image),),
        title: Text(title),
        subtitle: Text(author),
        onTap: ()async{

           //var url = 'http://shakespeare.mit.edu/hamlet/full.html';
              if(await canLaunch(url)){
                await launch(url);
              }else{
                throw 'Couldnt Launch';
            }
        }
      )
    );
  }
}