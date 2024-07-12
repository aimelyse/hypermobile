import 'package:flutter/material.dart';

class ReviewerProfileScreen extends StatelessWidget {
  final String reviewerName;
  final String reviewerImage;
  final String reviewerLevel;
  final String reviewerBio;
  final List<Map<String, dynamic>> reviews;

  ReviewerProfileScreen({
    required this.reviewerName,
    required this.reviewerImage,
    required this.reviewerLevel,
    required this.reviewerBio,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(''),
        centerTitle: true,
        flexibleSpace: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '랭킹 1위',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Text(
                '베스트 리뷰어',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[200],
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(reviewerImage),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reviewerName,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.emoji_events, color: Colors.amber, size: 24),
                        const SizedBox(width: 4),
                        Text(
                          reviewerLevel,
                          style: const TextStyle(fontSize: 16, color: Colors.amber),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        reviewerBio,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Text(
                    '작성한 리뷰',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '총 35개',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                review['productImage'],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review['productName'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        Icon(Icons.star, color: Colors.grey[100], size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          review['rating'].toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '(${review['date']})',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(reviewerImage),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    reviewerName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  Icon(Icons.star, color: Colors.grey[100], size: 16),
                                  Text(
                                    review['date'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.bookmark_border, color:Colors.grey)
                            ],
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8.0,
                            children: review['tags'].map<Widget>((tag) {
                              return Text(
                                tag,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.flash_on,
                                color: Colors.indigo),
                              SizedBox(
                                width: 295,
                                child: Text(
                                  review['reviewText'],
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                  Icons.flash_on,
                                  color: Colors.grey),
                              SizedBox(
                                width: 295,
                                child: Text(
                                  review['reviewText2'],
                                  style: const TextStyle(fontSize: 10),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: review['images'].map<Widget>((image) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset(
                                  image,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
