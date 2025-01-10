import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.innerBoxIsScrolled,
  });

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: AppUtils.kBorderRadius10,
        ),
      ),
      backgroundColor: MaterialStatePropertyAll(
        Colors.white.withOpacity(0.24),
      ),
    );
    final color = innerBoxIsScrolled ? context.color.secondaryText : context.colorScheme.surface;
    return SliverAppBar(
      pinned: true,
      floating: true,
      forceElevated: true,
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
      systemOverlayStyle: innerBoxIsScrolled ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      backgroundColor: innerBoxIsScrolled ? context.theme.appBarTheme.backgroundColor : context.colorScheme.primary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(AppIcons.main),
          AppUtils.kGap6,
          Text('MEDPAY'),
        ],
      ),
      actions: [
        IconButton(
          style: style,
          onPressed: () {},
          icon: const Icon(AppIcons.cart),
        ),
        IconButton(
          style: style,
          onPressed: () {},
          icon: const Icon(AppIcons.notifications),
        ),
        AppUtils.kGap16,
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: Padding(
          padding: AppUtils.kPaddingL16T8R16B12,
          child: TextField(
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: AppUtils.kPaddingAll8,
              hintText: 'Поиск медицинских услуг',
              hintStyle: TextStyle(color: color),
              border: const OutlineInputBorder(
                borderRadius: AppUtils.kBorderRadius10,
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                AppIcons.search,
                color: color,
              ),
              filled: true,
              fillColor: innerBoxIsScrolled ? context.colorScheme.surfaceVariant : Colors.white.withOpacity(0.24),
            ),
          ),
        ),
      ),
    );
  }
}
