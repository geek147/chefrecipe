import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:chefrecipe/feature/search/presentation/pages/search_by_image.dart';
import 'package:chefrecipe/feature/search/presentation/pages/ssearch_by_ing.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                backgroundColor: const Color.fromARGB(255, 58, 123, 92),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.image),
                    text: "Search By Image",
                  ),
                  Tab(
                    icon: Icon(Icons.cookie),
                    text: "Search By Ingredients",
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: SearchImageView(),
                    ),
                    Center(
                      child: SearchIngredientsView(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
