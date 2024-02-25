import 'package:flutter_todo_list_app/ui/todo_view_model.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<TodoViewModel>(TodoViewModel());

  // getIt.registerFactory<TodoViewModel>(() => TodoViewModel());
}
