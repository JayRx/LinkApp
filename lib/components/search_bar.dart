import 'package:flutter/material.dart';
import 'package:linkapp/helpers/my_flutter_app_icons.dart';

class CustomSearchBar extends StatefulWidget {
  final Function searchTextChangedCallback;

  const CustomSearchBar({super.key, required this.searchTextChangedCallback});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final searchTextController = TextEditingController();

  @override
  void initState() {
    searchTextController.addListener(searchTextChanged);
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void searchTextChanged() {
    final searchText = searchTextController.text;

    widget.searchTextChangedCallback(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          const Icon(
            MyFlutterApp.search,
            color: Color.fromARGB(255, 163, 172, 188),
            size: 20,
          ),
          Expanded(
            child: TextField(
              controller: searchTextController,
              decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 163, 172, 188),
                      fontWeight: FontWeight.w300),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0)),
            ),
          ),
        ],
      ),
    );
  }
}
