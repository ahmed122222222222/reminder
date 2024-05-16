import 'package:ah/core/local_noif.dart';

import 'package:workmanager/workmanager.dart';


class WorkManagerService {
  void registerMyTask() async {
  
    await Workmanager().registerPeriodicTask(
      'id1',
      'show simple notification',
      frequency: const Duration(minutes: 15),
    );
  }
  Future<void> init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    registerMyTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void actionTask() {
  Workmanager().executeTask((taskName, inputData) {
    LocalNotification.showNotification();
    return Future.value(true);
  });
}
