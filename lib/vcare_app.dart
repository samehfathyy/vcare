import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/features/appointment/get%20appointments/appointment_screen.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/home/screens/home.dart';
import 'package:vcare/features/profile/profile_screen.dart';
import 'package:vcare/features/user_profile/data/cubit/cubit/userprofile_cubit.dart';

class VcareApp extends StatefulWidget {
  const VcareApp({super.key});

  @override
  State<VcareApp> createState() => _VcareAppState();
}

class _VcareAppState extends State<VcareApp> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // List of screens
  final List<Widget> _screens = [
    const Home(),
    const AppointmentScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  // Method to handle navigation bar taps
  void _onItemTapped(int index) {
    // if (index == _selectedIndex && index == 0) {
    //   context.read<HomeCubit>().getdata();
    // } else {
    // setState(() {
    //   _selectedIndex = index;
    // });
    _pageController.jumpToPage(index);
    // }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getdata();
    context.read<UserprofileCubit>().getuserprofile();
  }

  @override
  Widget build(BuildContext context) {
    //context.read<HomeCubit>().getdata();
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe gestures
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        showSelectedLabels: false,
        selectedItemColor: AppColors.mainpurple,
        unselectedItemColor: AppColors.darkgray2,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (index == _selectedIndex && index == 0) {
            context.read<HomeCubit>().getdata();
            context.read<UserprofileCubit>().getuserprofile();
          } else if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
            });
          }
          _onItemTapped(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 26.sp,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 26.sp,
            ),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              size: 26.sp,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 26.sp,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
