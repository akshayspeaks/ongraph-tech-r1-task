import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyStarRatingField extends StatefulWidget {
  final int steps;
  final String title;
  MyStarRatingField({Key key, this.steps, this.title}) : super(key: key);

  @override
  _MyStarRatingFieldState createState() => _MyStarRatingFieldState();
}

class _MyStarRatingFieldState extends State<MyStarRatingField> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 5,
        ),
        RatingBar(
          initialRating: 1,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: widget.steps,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        )
      ],
    ));
  }
}
