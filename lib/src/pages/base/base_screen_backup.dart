// import 'package:flutter/material.dart';
// import 'package:quitanda/src/pages/home/view/home_tab.dart';

// import '../cart/cart_tab.dart';
// import '../order/order_tab.dart';
// import '../profile/profile_tab.dart';

// class BaseScreen extends StatefulWidget {
//   const BaseScreen({Key? key}) : super(key: key);

//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }

// class _BaseScreenState extends State<BaseScreen> {
//   int currentIndex = 0;
//   final pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: pageController,
//         children: const [
//           HomeTab(),
//           CartTab(),
//           OrderTab(),
//           ProfileTab(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//             //pageController.jumpToPage(index);
//             pageController.animateToPage(
//               index,
//               duration: const Duration(milliseconds: 700),
//               curve: Curves.ease,
//             );
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.green,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withAlpha(100),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             label: 'Carrinho',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Pedidos',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Perfil',
//           ),
//         ],
//       ),
//     );
//   }
// }
