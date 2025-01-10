part of 'package:phone_data_sender/src/presentation/pages/main/home/home_page.dart';

mixin HomeMixin on State<HomePage> {
  // late final ScrollController _scrollController;
  // late final PageController _pageController;
  // late final HomeBloc bloc = context.read<HomeBloc>();
  //
  // late final ValueNotifier<int> _bannerListener = ValueNotifier<int>(999);
  // late Timer _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController = ScrollController();
  //   _pageController = PageController(
  //     initialPage: 999,
  //     keepPage: false,
  //   );
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _timer = Timer.periodic(
  //     const Duration(seconds: 5),
  //     (t) async {
  //       _bannerListener.value = _bannerListener.value + 1;
  //       await _pageController.animateToPage(
  //         _bannerListener.value,
  //         duration: const Duration(milliseconds: 300),
  //         curve: Curves.easeInOut,
  //       );
  //     },
  //   );
  // }
  //
  // Future<void> listener(BuildContext context, HomeState state) async {
  //   if (state.isScrollingTop) {
  //     await _scrollController.animateTo(
  //       0,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //     bloc.add(const HomeScroll(isScrollingTop: false));
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   _timer.cancel();
  //   _scrollController.dispose();
  //   _pageController.dispose();
  //   super.dispose();
  // }
}
