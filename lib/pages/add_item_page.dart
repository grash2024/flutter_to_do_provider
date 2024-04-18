import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_provider/task_operation.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtCtrl = TextEditingController();
    return Consumer<TaskOperation>(
      builder: (context, taskOperation, child) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Add Item',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                  controller: txtCtrl,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.tertiary),
                    ),
                    onPressed: () {
                      taskOperation.addToTaskList(txtCtrl.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Enter',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
