import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_one_application/applicationController.dart';
import 'package:team_one_application/authentication/authController.dart';
import 'package:team_one_application/authentication/authView.dart';
import 'package:team_one_application/authentication/login_state_enums.dart';
import 'package:team_one_application/filter/filterView.dart';
import 'package:team_one_application/schedule/scheduleView.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationController>(
      // Rebuilds from here if the appState ever notifies listeners
      builder: (context, appState, _) {
        final bool _isDoneInit = appState.doneInit;
        final bool _isLoggedIn =
            _isDoneInit && appState.authController?.authState.isLoggedIn;

        final bool _hasSelected = appState.scheduleController != null;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Quick Share"),
            actions: [
              // Sign-Out Button
              if (_isDoneInit && _isLoggedIn)
                ElevatedButton(
                    onPressed: () => appState.authController!.signOut(),
                    child: const Text('Log Out'))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Login Button + Login Flow
              if (_isDoneInit && !_isLoggedIn)
                AuthView(authController: appState.authController!),
              if (_isDoneInit && _isLoggedIn)
                FilterView(filterController: appState.filterController!),
              if (_isDoneInit && _hasSelected)
                ScheduleView(scheduleController: appState.scheduleController!)
            ],
          ),
        );
      },
    );
  }
}
