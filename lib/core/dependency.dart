// import 'package:get_it/get_it.dart';
// import 'package:mobile_qdukaan/features/auth/bloc/auth_bloc.dart';
// import 'package:mobile_qdukaan/features/bills/bloc/bills_bloc.dart';
// import 'package:mobile_qdukaan/features/dashboard/bloc/dashboard_bloc.dart';
// import 'package:mobile_qdukaan/features/overview/bloc/overview_bloc.dart';
// import 'package:mobile_qdukaan/features/notification/bloc/notification_bloc.dart';
// import 'package:mobile_qdukaan/features/settings/bloc/settings_bloc.dart';
// import 'package:mobile_qdukaan/repo/auth_repo.dart';
// import 'package:mobile_qdukaan/repo/bill_repo.dart';
// import 'package:mobile_qdukaan/repo/dashboard_repo.dart';
// import 'package:mobile_qdukaan/repo/inventory_repo.dart';
// import 'package:mobile_qdukaan/repo/notification_repo.dart';
// import 'package:mobile_qdukaan/repo/store_repo.dart';
// import 'package:mobile_qdukaan/repo/user_repo.dart';
// import 'package:mobile_qdukaan/services/auth_services.dart';
// import 'package:mobile_qdukaan/services/local_storage_services.dart';
// import 'package:mobile_qdukaan/services/message_services.dart';
// import 'package:mobile_qdukaan/services/notification_services.dart';
// import 'package:mobile_qdukaan/utils/app_state_manager.dart';

// final locator = GetIt.instance;

// void setupServiceLocator() {
//   // Auth Repo
//   locator.registerSingleton<AuthRepo>(AuthRepo());

//   // User Repo
//   locator.registerSingleton<UserRepo>(UserRepo());

//   // Store Repo
//   locator.registerSingleton<StoreRepo>(StoreRepo());

//   // Inventory Repo
//   locator.registerSingleton<InventoryRepo>(InventoryRepo());

//   // Bill Repo
//   locator.registerSingleton<BillRepo>(BillRepo());

//   // Dashboard Repo
//   locator.registerSingleton<DashboardRepo>(DashboardRepo());

//   // Notification Repo
//   locator.registerSingleton<NotificationRepo>(NotificationRepo());

//   // Notification Service
//   locator.registerSingleton<NotificationService>(NotificationService());

//   // Message Service
//   locator.registerSingleton<MessageServices>(MessageServices());

//   // Local Storage Service
//   locator.registerSingleton<LocalStorageServices>(LocalStorageServices());

//   // Auth Service
//   locator.registerSingleton<AuthServices>(AuthServices(
//     auth: locator.get<AuthRepo>(),
//     localStorage: locator.get<LocalStorageServices>(),
//   ));

//   // Auth Bloc
//   locator.registerSingleton<AuthBloc>(AuthBloc());

//   // Overview Bloc
//   locator.registerSingleton<OverviewBloc>(OverviewBloc());

//   // Settings Bloc
//   locator.registerSingleton<SettingsBloc>(SettingsBloc());

//   // Bills Bloc
//   locator.registerSingleton<BillsBloc>(BillsBloc());

//   // Dashboard Bloc
//   locator.registerSingleton<DashboardBloc>(DashboardBloc());

//   // Notification Bloc
//   locator.registerSingleton<NotificationBloc>(NotificationBloc());

//   // App Session Manager
//   locator.registerSingleton<AppSessionManager>(AppSessionManager());
// }
