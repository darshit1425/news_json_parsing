import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/news_provider.dart';

class News_Screen extends StatefulWidget {
  const News_Screen({Key? key}) : super(key: key);

  @override
  State<News_Screen> createState() => _News_ScreenState();
}

class _News_ScreenState extends State<News_Screen> {
  News_Provider? NProviderT;
  News_Provider? NProviderF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<News_Provider>(context, listen: false).newsJsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    NProviderT = Provider.of<News_Provider>(context, listen: true);
    NProviderF = Provider.of<News_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "news ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                NProviderF!.newsJsonParsing();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 105,
                child:   Text(
                  "news data",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            Expanded(
              child: NProviderT!.newsModel != null
                  ? ListView.builder(
                      itemCount: NProviderT!.newsModel!.articleList!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                              "${NProviderT!.newsModel!.articleList![index].author}"),
                          title: Text(
                              "${NProviderT!.newsModel!.articleList![index].url}"),
                          subtitle: Text(
                              "${NProviderT!.newsModel!.articleList![index].urltoimg}"),
                          // trailing: Text("${NProviderT!.userList[index].company}"),
                        );
                      },
                    )
                  : CircularProgressIndicator(
                      color: Colors.blueAccent,
                      backgroundColor: Colors.blueAccent,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
