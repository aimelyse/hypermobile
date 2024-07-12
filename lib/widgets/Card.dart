import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  final IconData rankIcon;
  final Color rankIconColor;
  final String imageUrl;
  final String title;
  final double rating;
  final int ratingCount;
  final List<String> tags;
  final String description;

  ProductCard({
    required this.rankIcon,
    required this.rankIconColor,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.ratingCount,
    required this.tags,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  rankIcon,
                  color: rankIconColor,
                  size: 30,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Image.asset(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '$rating',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' ($ratingCount)',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 6.0,
                        runSpacing: 6.0,
                        children: tags
                            .map((tag) => Chip(
                          label: Text(tag),
                          backgroundColor: Colors.grey[200],
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}