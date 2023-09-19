import 'package:linkapp/models/label_model.dart';

class LinkModel {
  final String name;
  final String link;
  final List<LabelModel> labels;

  LinkModel(this.name, this.link, this.labels);
}
