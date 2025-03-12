import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilem/models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.blue,),
                  );
                },
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 20,),
              Text(
                "Overview: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(movie.overview),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text("Release Date:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text(movie.releaseDate)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber,),
                  SizedBox(width: 10,),
                  Text("Rating:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text(movie.voteAverage.toString())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}