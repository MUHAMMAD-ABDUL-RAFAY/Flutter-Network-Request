import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:network_req/social_media_post.dart';
import 'package:network_req/social_media_post_automatic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SocialMedia(),
    );
  }
}

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});
  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  // String base_url = 'https://jsonplaceholder.typicode.com/posts';
  late SocialMediaPost obj;

  // @override
  // void initState() {
  //   super.initState();
  //   print('here');
  //   obj = makeApiCall();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Network Request")),
      ),
      body: FutureBuilder(
          future: makeApiCall(),
          builder: (context, snapshot) => snapshot.hasData
              ? Center(
                  child: Container(
                      height: 200,
                      // color: Color(0xFFFFC107),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      // height: 100,
                      // width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              snapshot.data!.email,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                child: Text(
                                  'Comment:',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                )),
                            Text(snapshot.data!.body),
                          ],
                        ),
                      )),
                )
              : Center(
                  child: Container(
                      height: 200,
                      // color: Color(0xFFFFC107),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      // height: 100,
                      width: 500,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Center(child: Text('Loading...'))],
                      )),
                )),
    );
  }
}

Future<SocialMediaPost> makeApiCall() async {
  try {
    // print('hello');
    var url = Uri.https('jsonplaceholder.typicode.com', '/comments/2');
    var response = await http.get(url);
    await Future.delayed(const Duration(seconds: 2));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return SocialMediaPost.fromJson(json.decode(response.body));
  } catch (e) {
    // print(e);
    throw e;
  }
  // print('hello');
  // var url = Uri.https('https://jsonplaceholder.typicode.com/comments/2');
  // var response = await http.get(url);
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
  // return SocialMediaPost.fromJson(json.decode(response.body));
}
