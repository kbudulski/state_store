enum SunlightFilter {
  fullShade('Full shade', 'full_shade'),
  partShade('Part shade', 'part_shade'),
  partShadePartSun('Part sun/part shade', 'sun-part_shade'),
  fullSun('Full sun', 'full_sun');

  const SunlightFilter(this.displayText, this.filterText);

  final String displayText;
  final String filterText;
}

enum WateringFilter {
  frequent('Frequent', 'frequent'),
  average('Average', 'average'),
  minimum('Minimum', 'minimum'),
  none('None', 'none');

  const WateringFilter(this.displayText, this.filterText);

  final String displayText;
  final String filterText;
}
