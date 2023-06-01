enum GenreType {
  animation('Animation'),
  scienceFiction('Science Fiction'),
  fantasy('Fantasy'),
  superHero('Super Hero'),
  actionAdventure('Action-Adventure'),
  romance('Romance'),
  drama('Drama'),
  buddy('Buddy'),
  family('Family'),
  spy('Spy / Espionage'),
  musical('Musical');

  final String name;

  const GenreType(this.name);
}
