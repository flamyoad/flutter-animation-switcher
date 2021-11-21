class Genre {
  String? name;
  String? description;
  bool isSelected;

  Genre({
    this.name,
    this.description,
    this.isSelected = false,
  });

  Genre copyWith(bool selected) {
    return Genre(
      name: this.name,
      description: this.description,
      isSelected: selected,
    );
  }
}
