// class HiveProvider {
//   static late Box userBox;
//   static late Box<TaskModel> taskBox;
//   static String nameKey = "name";
//   static String imageKey = "image";
//   static String userBoxName = "userBox";
//   static String isUploadKey = "isUpload";
//   static String taskBoxName = "taskBox";
//   static String isDarkKey="isDark";
//   static Future<void> init() async {
//     // Register TaskModel adapter once, using the correct typeId (matches @HiveType(typeId: 0))
//     if (!Hive.isAdapterRegistered(0)) {
//       Hive.registerAdapter(TaskModelAdapter());
//     }
//     userBox = await Hive.openBox(userBoxName);
//     taskBox = await Hive.openBox<TaskModel>(taskBoxName);
//   }

//   static void cachUserData(String key,dynamic value){
//     userBox.put(key, value);
//   }

//  static dynamic getUserData(String key){
//   if (!Hive.isBoxOpen(userBoxName)) return null;
//   return userBox.get(key);
//  }

//  static void cachTaskData(String key,TaskModel task){
//    taskBox.put(key, task);
//  }
//  static TaskModel? getTaskData(String key){
//    return taskBox.get(key);
//  }

// }
