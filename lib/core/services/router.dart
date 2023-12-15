import 'package:fun_chat/src/auth/domain/usercases/sign_in.dart';
import 'package:fun_chat/src/auth/presentation/on_boarding_screen.dart';
import 'package:fun_chat/src/auth/presentation/views/sign_in.dart';
import 'package:fun_chat/src/auth/presentation/views/sign_up.dart';
import 'package:fun_chat/src/chat/presentation/views/chat_page.dart';
import 'package:fun_chat/src/dashboard/presentation/views/dashboard.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/dashboard',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const OnBoarding();
        },
      ),
      GoRoute(
          path: '/signUp',
          builder: (context, state) {
            return const SignUp();
          }),
      GoRoute(
          path: '/signIn',
          builder: (context, state) {
            return const SignInPage();
          }),
      GoRoute(
        name: '/messages',
        path: '/messages/:id',
        builder: (_, state) {
          return ChatPage(currentUser: state.pathParameters['id'] ?? '');
        },
      ),
      GoRoute(
          path: '/dashboard',
          builder: (context, state) {
            return Dashboard();
          })
    ],
  );
}
