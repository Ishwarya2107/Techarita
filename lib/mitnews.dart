import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';


class MitNews extends StatefulWidget {
  const MitNews({Key? key}) : super(key: key);

  @override
  _MitNewsState createState() => _MitNewsState();
}

class Article {
  final String url;
  final String title;


  const Article({
    required this.url,
    required this.title,

  });
}

class _MitNewsState extends State<MitNews> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getWebsitesData();

    // Set up a periodic timer to refresh data every 15 minutes
    Timer.periodic(Duration(minutes: 15), (Timer timer) {
      getWebsitesData();
    });
  }

  Future<void> getWebsitesData() async {
    final url = Uri.parse('https://www.technologyreview.com/topic/artificial-intelligence/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    print(response.body);
    final updatedTitles = html
        .querySelectorAll('header > h3 > a')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll('header > h3 > a')
        .map(
          (element) => '${element.attributes['href']}',
    )
        .toList();

print(updatedTitles);

    setState(() {
      articles = List.generate(
        updatedTitles.length,
            (index) => Article(
          url: urls[index],
          title: updatedTitles[index],


        ),

      );
    });


  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text("MIT AI",style: TextStyle(
            color: Colors.white,),),
          backgroundColor: Colors.red,
        ),
        body: ArticleList(articles: articles),

      );

  }
}

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleTile(article: article);
      },
    );
  }
}

class ArticleTile extends StatelessWidget {
  final Article article;

  const ArticleTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://img.freepik.com/premium-vector/background-zeros-ones-white-gray-colors_444390-1661.jpg', // Replace with your image URL
              ),
              fit: BoxFit.cover,
            ),


            borderRadius: BorderRadius.circular(30.0),

          ),
          child:Column(
            children: [

              Text(article.title,textAlign: TextAlign.left, style: TextStyle(
                color: Colors.black, // Set the text color here
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),),
              FlatButton(
                child: const Text('Dive Deep', textAlign: TextAlign.left, style: TextStyle(

                  color: Colors.grey, // Set the text color here
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,

                ),),

                onPressed: () {
                  final Uri _url = Uri.parse(article.url);
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 5.0,
                  );
                  _launchUrl(_url);
                },
              ),
            ],),
        ),

        Divider(
          height: 20.0, // Adjust the height of the divider
          color: Colors.black, // Change the color of the divider
        ),

      ],






    );
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }}

