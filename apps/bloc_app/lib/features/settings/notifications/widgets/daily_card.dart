import 'package:bloc_app/features/global/user_data/user_data_cubit.dart';
import 'package:bloc_app/features/settings/notifications/cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styleguide/components.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final subToDaily = context.watch<UserDataCubit>().subscribedToDaily;
    return AppListTile(
      icon: Icons.access_time,
      title: 'Daily',
      subtitle: 'Subscribe to daily messages',
      iconBackgroundColor: Colors.cyan,
      onTap: () {
        context.read<NotificationsCubit>().toggleDaily(subscribed: !subToDaily);
        context.read<UserDataCubit>().saveDailySubscription();
      },
      trailing: AbsorbPointer(
        child: Switch(
          value: subToDaily,
          onChanged: (_) {},
          activeColor: Colors.white,
          activeTrackColor: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}
