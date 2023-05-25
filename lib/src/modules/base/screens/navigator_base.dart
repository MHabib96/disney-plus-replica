import 'package:disney_plus_replica/src/modules/base/types/tab_type.dart';
import 'package:disney_plus_replica/src/modules/base/widgets/tab_navigator.dart';
import 'package:flutter/material.dart';

class NavigatorBase extends StatefulWidget {
  const NavigatorBase({super.key});

  @override
  State<NavigatorBase> createState() => _NavigatorBaseState();
}

class _NavigatorBaseState extends State<NavigatorBase> {
  TabType _currentTab = TabType.home;
  int _currentIndex = 0;

  final Map<TabType, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabType.home: GlobalKey<NavigatorState>(),
    TabType.search: GlobalKey<NavigatorState>(),
  };

  void _onSelectedTab(TabType selectedTab) {
    //Navigate back to tab route when current tab is selected.
    if (selectedTab == _currentTab) {
      _navigatorKeys[selectedTab]!.currentState!.popUntil((route) => route.isFirst);
    }
    //Update state to newly selected tab screen.
    else {
      setState(() {
        _currentTab = selectedTab;
        _currentIndex = selectedTab.index;
      });
    }
  }

  Widget _buildOffstageNavigator(TabType tab) {
    return Offstage(
      offstage: _currentTab != tab,
      child: TabNavigator(
        tab: tab,
        navigatorKey: _navigatorKeys[tab]!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(TabType.home),
            _buildOffstageNavigator(TabType.search),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => _onSelectedTab(TabType.values[index]),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }
}
