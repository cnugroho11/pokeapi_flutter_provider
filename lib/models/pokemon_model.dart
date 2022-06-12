class Pokemon {
  int id;
  List<Ability> ability;
  String name;
  int baseExperience;
  int height;
  int order;
  int weight;
  Species species;
  List<Stat> stat;
  List<Type> type;
  String image;

  Pokemon({
    required this.id,
    required this.ability,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.order,
    required this.weight,
    required this.species,
    required this.stat,
    required this.type,
    required this.image
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'] ?? 0,
        ability: (json.containsKey('abilities')) ? (json['abilities'] as List)
          .map((e) => Ability.fromJson(e))
          .toList() : [],
        name: json['name'] ?? '',
        baseExperience: json['base_experience'] ?? 0,
        height: json['height'] ?? 0,
        order: json['order'] ?? 0,
        weight: json['weight'] ?? 0,
        species: Species.fromJson(json['species']),
        stat: (json.containsKey('stats')) ? (json['stats'] as List)
          .map((e) => Stat.fromJson(e))
          .toList() : [],
        type: (json.containsKey('types')) ? (json['types'] as List)
          .map((e) => Type.fromJson(e))
          .toList() : [],
        image: json['sprites']['other']['official-artwork']['front_default'],
    );
  }
}

class Ability {
  Species ability;
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      ability: Species.fromJson(json['ability']),
      isHidden: json['is_hidden'],
      slot: json['slot']
    );
  }
}

class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'], 
      url: json['url']
    );
  }
}

class Type {
  int slot;
  Species type;

  Type({
    required this.slot,
    required this.type
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      slot: json['slot'],
      type: Species.fromJson(json['type']),
    );
  }
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: Species.fromJson(json['stat']),
    );
  }
}