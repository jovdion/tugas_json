import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/posts_screen.dart';
import './screens/comments_screen.dart';
import './screens/users_screen.dart';
import './screens/create_post_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Placeholder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostsScreen(), // Langsung ke halaman postingan
      routes: {
        '/home': (context) => HomeScreen(),
        '/posts': (context) => PostsScreen(),
        '/comments': (context) => CommentsScreen(),
        '/users': (context) => UsersScreen(),
        '/create_post': (context) => CreatePostScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
