enum GenreType {
  scienceFiction('Science Fiction'),
  fantasy('Fantasy'),
  superHero('Super Hero'),
  actionAdventure('Action-Adventure'),
  romance('Romance'),
  drama('Drama'),
  buddy('Buddy'),
  spy('Spy / Espionage');

  final String name;

  const GenreType(this.name);
}
