import 'package:flutter/material.dart';
import 'package:styleguide/style.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    this.userName = 'User',
    this.userPhotoURL,
    super.key,
  });

  final String userName;
  final ImageProvider? userPhotoURL;

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return Container(
      height: mediaQueryHeight / 6,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(Dimens.size32),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.size32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildUserAvatar(mediaQueryHeight, context)),
            AppSpaces.gap20,
            Expanded(child: _buildUserName(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildUserAvatar(double mediaQueryHeight, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          child: CircleAvatar(
            radius: mediaQueryHeight / 15,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
        ),
        CircleAvatar(
          radius: mediaQueryHeight / 20,
          backgroundImage: userPhotoURL,
        ),
      ],
    );
  }

  Widget _buildUserName(BuildContext context) {
    return Text(
      userName,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Theme.of(context).colorScheme.onPrimary,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
