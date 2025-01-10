import 'package:flutter/material.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildListDelegate(
          [
            const Padding(
              padding: AppUtils.kPaddingAllB16,
              child: Text('Сервисы'),
            ),
            SizedBox(
              height: 152,
              child: ListView.separated(
                itemCount: 3,
                padding: AppUtils.kPaddingAll16,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Container(
                  width: 120,
                  padding: AppUtils.kPaddingAll12,
                  decoration: const BoxDecoration(
                    borderRadius: AppUtils.kBorderRadius10,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        AppIcons.home_health,
                        color: context.colorScheme.primary,
                      ),
                      Text(
                        'Сервис $index',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => AppUtils.kGap12,
              ),
            ),
            Padding(
              padding: AppUtils.kPaddingAll16,
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: AppUtils.kPaddingHorizontal12,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppUtils.kBorderRadius10,
                ),
                tileColor: context.colorScheme.primary,
                leading: Icon(
                  AppIcons.cart,
                  color: context.colorScheme.surface,
                ),
                title: const Text(
                  'Кешбек до 5%',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'Посмотреть услуги с кэшбеком',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: AppUtils.kPaddingAll16,
              child: Text('Популярные услуги'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (var i = 0; i < 3; i++)
                    Container(
                      padding: AppUtils.kPaddingAll12,
                      decoration: const BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius32,
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Определение пола ребёнка по крови матери',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
