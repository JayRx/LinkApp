import 'package:flutter/material.dart';
import 'package:linkapp/components/label_bar.dart';
import 'package:linkapp/components/link_grid.dart';
import 'package:linkapp/components/search_bar.dart';
import 'package:linkapp/models/category_model.dart';
import 'package:linkapp/models/label_model.dart';
import 'package:linkapp/models/link_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool screenActive = false;
  bool addButtonActive = false;

  List<CategoryModel> data = [
    CategoryModel("Socials", [
      LinkModel("HLTV", "https://www.hltv.org", [LabelModel("HLTV")]),
      LinkModel(
          "Instagram", "https://www.instagram.com", [LabelModel("Instagram")]),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
    ]),
    CategoryModel("Coding", [
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
    ]),
    CategoryModel("Other", [
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
    ]),
  ];

  List<CategoryModel> unfilteredData = [
    CategoryModel("Socials", [
      LinkModel("HLTV", "https://www.hltv.org", [LabelModel("HLTV")]),
      LinkModel(
          "Instagram", "https://www.instagram.com", [LabelModel("Instagram")]),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
    ]),
    CategoryModel("Coding", [
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
    ]),
    CategoryModel("Other", [
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
      LinkModel("Instagram", "https://www.instagram.com", []),
    ]),
  ];

  List<LabelModel> labels = [LabelModel("HLTV"), LabelModel("Instagram")];

  List<LabelModel> selectedLabels = [];
  String searchText = "";

  List<CategoryModel> filterData() {
    List<CategoryModel> filteredData = [];

    for (var category in unfilteredData) {
      var filteredCategoryLinksByText = category.links.where((element) =>
          element.name.toLowerCase().contains(searchText.toLowerCase()));

      var filteredCategoryLinksByTag = filteredCategoryLinksByText.where(
          (element) => Set.of(element.labels).containsAll(selectedLabels));

      if (filteredCategoryLinksByTag.isNotEmpty) {
        filteredData.add(
            CategoryModel(category.name, filteredCategoryLinksByTag.toList()));
      }
    }

    return filteredData;
  }

  void searchTextChanged(String text) {
    setState(() {
      searchText = text;
      data = filterData();
    });
  }

  void labelClicked(LabelModel label, bool active) {
    setState(() {
      if (active) {
        selectedLabels.add(label);
      } else {
        selectedLabels.remove(label);
      }

      data = filterData();
    });
  }

  void addButtonClick() {
    setState(() {
      addButtonActive = !addButtonActive;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          screenActive = true;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          CustomSearchBar(searchTextChangedCallback: searchTextChanged),
          LabelBar(labels: labels, labelClickedCallback: labelClicked),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: ListView(
                padding: const EdgeInsets.only(top: 0.0, bottom: 56.0),
                children: [
                  for (var category in data) LinkGrid(category: category),
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
