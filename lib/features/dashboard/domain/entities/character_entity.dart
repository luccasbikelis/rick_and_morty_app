class CharacterEntity {
  final String name;
  final String image;
  final String status;
  final String type;
  final String species;
  final String gender;
  final Map<String, dynamic> origin;
  final String created;
  final List<dynamic> episode;

  CharacterEntity(this.name, this.image, this.status, this.type, this.species, this.gender, this.origin, this.created, this.episode);
}
