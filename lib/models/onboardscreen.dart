// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBoarding {
  String title;
  String content;
  String image;
  OnBoarding({
    required this.title,
    required this.content,
    required this.image,
  });
}

List<OnBoarding> onBoardingContent = [
  OnBoarding(
    title: 'Get notified when\nwork happens',
    content:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    image: 'assets/svgs/onboarding-01.svg',
  ),
  OnBoarding(
    title: 'Stay organized with\nproject and team',
    content:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    image: 'assets/svgs/onboarding-02.svg',
  ),
  OnBoarding(
    title: 'Create tasks and\nassign them ',
    content:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    image: 'assets/svgs/onboarding-03.svg',
  ),
  OnBoarding(
    title: 'Track your work\nGet results!',
    content:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    image: 'assets/svgs/onboarding-04.svg',
  )
];
