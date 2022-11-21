import 'package:exceed_resources_frontend/app/modules/core/models/menu_section_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/enum_entension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class AppNavigation extends StatefulWidget {
  final EMenu currentMenu;

  const AppNavigation({
    Key? key,
    required this.currentMenu,
  }) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> with SingleTickerProviderStateMixin {
  late EMenu _currentMenuState;
  late AnimationController _controller;
  late Animation _transformAnimation;
  late Animation _opacityAnimation;
  late Animation<double> _curve;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _currentMenuState = widget.currentMenu;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 75),
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo);

    _transformAnimation = Tween(begin: 10.0, end: 0.0).animate(_curve);

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_curve);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  void pressedMenu(MMenuSection menu) {
    _controller.reverse().then(
          (value) => setState(
            () {
              _currentMenuState = menu.type;
              _controller.forward();
              Get.toNamed('/${menu.type.getName()}');
            },
          ),
        );
  }

  final List<MMenuSection> menuSections = const [
    MMenuSection(text: "Home", icon: "assets/icons/home.svg", type: EMenu.home),
    MMenuSection(text: "Task", icon: "assets/icons/task.svg", type: EMenu.task),
    MMenuSection(text: "Chat", icon: "assets/icons/chat.svg", type: EMenu.chat),
    MMenuSection(text: "Report", icon: "assets/icons/report.svg", type: EMenu.report),
    MMenuSection(text: "Misc", icon: "assets/icons/misc.svg", type: EMenu.misc),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.sm),
      child: SizedBox(
        height: AppSize.fotH,
        child: Row(
          children: List.from(
            menuSections.map(
              (menu) => Flexible(
                child: GestureDetector(
                  onTap: () => pressedMenu(menu),
                  child: LayoutBuilder(builder: (context, constraint) {
                    return SizedBox(
                      width: constraint.maxWidth,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, _) {
                              return MenuItemText(
                                key: UniqueKey(),
                                menu: menu,
                                isCurrentMenu: menu.type == _currentMenuState,
                                opacity: _opacityAnimation.value,
                              );
                            },
                          ),
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, _) {
                              return MenuItemIcon(
                                key: UniqueKey(),
                                menu: menu,
                                isCurrentMenu: menu.type == _currentMenuState,
                                transform: _transformAnimation.value,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItemText extends StatelessWidget {
  final MMenuSection menu;
  final bool isCurrentMenu;
  final double opacity;

  const MenuItemText({
    Key? key,
    required this.menu,
    required this.isCurrentMenu,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Opacity(
        opacity: isCurrentMenu ? opacity : 0.0,
        child: Text(
          menu.text,
          style: AppTheme.text(
            context: context,
            size: EText.h5,
          ),
        ),
      ),
    );
  }
}

class MenuItemIcon extends StatelessWidget {
  final MMenuSection menu;
  final bool isCurrentMenu;
  final double transform;

  const MenuItemIcon({
    Key? key,
    required this.menu,
    required this.isCurrentMenu,
    required this.transform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: isCurrentMenu ? null : 0,
      child: Transform(
        transform: Matrix4.identity()..translate(0.0, isCurrentMenu ? transform : 0.0, 0.0),
        child: Center(
          child: SizedBox(
            child: SvgPicture.asset(
              menu.icon,
              width: AppSize.icoMd,
              color: isCurrentMenu
                  ? AppTheme.of(context).color.primary
                  : AppTheme.of(context).color.primary.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
