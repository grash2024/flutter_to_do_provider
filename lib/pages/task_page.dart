import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/pages/add_item_page.dart';
import 'package:todo_provider/task_operation.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TaskOperation>(
        builder: (context, taskOperation, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const AddItem(),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Icon(
                Icons.add,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'T-O-D-O',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Task Left : ${taskOperation.tasks.length.toString()}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: taskOperation.tasks.length,
                      itemBuilder: (context, index) {
                        String taskName = taskOperation.tasks[index].taskName;
                        return TaskTile(taskName: taskName, index: index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String taskName;
  final int index;

  const TaskTile({super.key, required this.taskName, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Consumer<TaskOperation>(
          builder: (context, taskOperation, child) {
            return ListTile(
              onLongPress: () {
                taskOperation.removeFromTaskList(index);
              },
              title: Text(
                taskName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Checkbox(
                value: taskOperation.tasks[index].checkState,
                onChanged: (value) {
                  taskOperation.toggleState(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
