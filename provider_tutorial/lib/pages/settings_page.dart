import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: TextField(
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    context
                        .read<UserProvider>()
                        .changeUserName(newUserName: controller.text);
                  }
                },
                child: const Text('Update')),
          )
        ],
      ),
    );
  }
}
