abstract class Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const app = '/app';

  // Tabs
  static const home = '/home';
  static const features = '/features';

  // From home
  static const settings = '$home/settings';

  static const api = '$home/plants';
  static const apiDetails = '$api/:id';

  static const helpFromHome = '$home/help';

  static const gallery = '$home/gallery';
  static const addImage = '$gallery/addImage';

  // From features
  static const profileFromFeatures = '$features/profile';
  static const themeFromFeatures = '$features/theme';
  static const notificationsFromFeatures = '$features/notifications';

  // Settings
  static const profile = '$settings/profile';
  static const theme = '$settings/theme';
  static const notifications = '$settings/notifications';
  static const help = '$settings/help';
  static const about = '$settings/about';
}
