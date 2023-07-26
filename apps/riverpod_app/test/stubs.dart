import 'package:api_repository/api_repository.dart';
import 'package:utils/utils.dart';

final plantsStub = [happyPlant, sadPlant];

final happyPlant = Plant(
  commonName: 'Happy plant',
  otherName: ['0'],
  sunlight: [Sunlight.fullSun],
  watering: Watering.frequent,
);

final sadPlant = Plant(
  commonName: 'Sad plant',
  otherName: ['1'],
  sunlight: [Sunlight.fullShade],
  watering: Watering.none,
);
