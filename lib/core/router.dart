import 'package:go_router/go_router.dart';
import 'package:schoolmanagement/features/student/ui/add_student_detail.dart';

import '../features/dashboard/ui/dashboard.dart';
import '../features/faculty/ui/faculty_screen.dart';
import '../features/student/ui/add_student_screen.dart';
import '../features/student/ui/student_screen.dart';
import '../features/student/ui/studentformscreen.dart';
import '../features/student/ui/studentscreen_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/', // 👈 root
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return DashboardLayout(child: child);
      },
      routes: [
        // ✅ ROOT DASHBOARD ROUTE (MUST)
     GoRoute(
          path: '/',
          builder: (context, state) =>  StudentScreen(),
        ),


        GoRoute(
          path: '/students',
          builder: (context, state) =>  StudentScreen(),
        ),

        GoRoute(
          path: '/addstudents',
          builder: (context, state) =>  AddStudent(),
        ),

        GoRoute(
          path: '/addstudentscreen',
          builder: (context, state) =>  StudentFormScreen(),
        ),

        GoRoute(
          path: '/faculty',
          builder: (context, state) =>  FacultyScreen(),
        ),
      ],
    ),
  ],
);
