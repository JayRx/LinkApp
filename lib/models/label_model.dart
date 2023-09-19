class LabelModel {
  final String name;

  LabelModel(this.name);

  @override
  bool operator ==(Object other) {
    if (other is LabelModel) {
      return name == other.name;
    }

    return false;
  }

  @override
  int get hashCode => name.hashCode;
}
