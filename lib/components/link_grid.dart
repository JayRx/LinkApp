import 'package:flutter/material.dart';
import 'package:linkapp/components/link_item.dart';
import 'package:linkapp/models/category_model.dart';

class LinkGrid extends StatefulWidget {
  final CategoryModel category;

  const LinkGrid({super.key, required this.category});

  @override
  State<LinkGrid> createState() => _LinkGridState();
}

class _LinkGridState extends State<LinkGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.category.name,
          style: const TextStyle(fontSize: 20),
        ),
        GridView.count(
          padding: const EdgeInsets.only(top: 8.0),
          shrinkWrap: true,
          crossAxisCount: 5,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 16.0,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (var item in widget.category.links) LinkItem(link: item)
          ],
        )
      ]),
    );
  }
}
