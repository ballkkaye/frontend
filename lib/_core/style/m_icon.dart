import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MIcon {
  static final nav = _Nav();
  static final page = _Page();
}

// Nav 아이콘 (Top, Bottom)
class _Nav {
  final top = _Top();
  final bottom = _Bottom();
}

class _Top {
  final Widget plus = SvgPicture.asset('assets/icons/nav_top_plus.svg');
  final Widget write = SvgPicture.asset('assets/icons/nav_top_write.svg');
}

class _Bottom {
  final Widget chat = SvgPicture.asset('assets/icons/nav_bottom_chat.svg');
  final Widget home = SvgPicture.asset('assets/icons/nav_bottom_home.svg');
  final Widget match = SvgPicture.asset('assets/icons/nav_bottom_match.svg');
  final Widget prediction = SvgPicture.asset('assets/icons/nav_bottom_prediction.svg');
  final Widget record = SvgPicture.asset('assets/icons/nav_bottom_record.svg');
}

// Page 아이콘
class _Page {
  final predictionList = _PredictionList();
  final rainout = _Rainout();
  final userMatch = _UserMatch();
  final record = _Record();
  final mypage = _Mypage();
  final community = _Community();
}

class _PredictionList {
  final Widget prediction = SvgPicture.asset('assets/icons/page_prediction_list_prediction.svg');
  final Widget rain = SvgPicture.asset('assets/icons/page_prediction_list_rain.svg');
  final Widget ranking = SvgPicture.asset('assets/icons/page_prediction_list_ranking.svg');
  final Widget todayGame = SvgPicture.asset('assets/icons/page_prediction_list_today_game.svg');
  final Widget userPrediction = SvgPicture.asset('assets/icons/page_prediction_list_user_prediction.svg');
}

class _Rainout {
  final Widget bCloud = SvgPicture.asset('assets/icons/page_rainout_b_cloud.svg');
  final Widget bCloudSunny = SvgPicture.asset('assets/icons/page_rainout_b_cloud_sunny.svg');
  final Widget bHumidity = SvgPicture.asset('assets/icons/page_rainout_b_humidity.svg');
  final Widget bRain = SvgPicture.asset('assets/icons/page_rainout_b_rain.svg');
  final Widget bSunny = SvgPicture.asset('assets/icons/page_rainout_b_sunny.svg');
  final Widget bWind = SvgPicture.asset('assets/icons/page_rainout_b_wind.svg');
  final Widget sCloud = SvgPicture.asset('assets/icons/page_rainout_s_cloud.svg');
  final Widget sCloudSunny = SvgPicture.asset('assets/icons/page_rainout_s_cloud_sunny.svg');
  final Widget sRain = SvgPicture.asset('assets/icons/page_rainout_s_rain.svg');
  final Widget sSunny = SvgPicture.asset('assets/icons/page_rainout_s_sunny.svg');
}

class _UserMatch {
  final Widget calendarBlack = SvgPicture.asset('assets/icons/page_user_match_calendar_black.svg');
  final Widget calenderGrey = SvgPicture.asset('assets/icons/page_user_match_calender_grey.svg');
  final Widget checkedBox = SvgPicture.asset('assets/icons/page_user_match_checked_box.svg');
  final Widget dotHorizontal = SvgPicture.asset('assets/icons/page_user_match_dot_horizontal.svg');
  final Widget dotVertical = SvgPicture.asset('assets/icons/page_user_match_dot_vertical.svg');
  final Widget like = SvgPicture.asset('assets/icons/page_user_match_like.svg');
  final Widget liked = SvgPicture.asset('assets/icons/page_user_match_liked.svg');
}

class _Record {
  final Widget camera = SvgPicture.asset('assets/icons/page_record_camera.svg');
  final Widget image = SvgPicture.asset('assets/icons/page_record_image.svg');
}

class _Mypage {
  final Widget chat = SvgPicture.asset('assets/icons/page_mypage_chat.svg');
  final Widget community = SvgPicture.asset('assets/icons/page_mypage_community.svg');
  final Widget match = SvgPicture.asset('assets/icons/page_mypage_match.svg');
  final Widget plus = SvgPicture.asset('assets/icons/page_mypage_plus.svg');
  final Widget prediction = SvgPicture.asset('assets/icons/page_mypage_prediction.svg');
  final Widget rain = SvgPicture.asset('assets/icons/page_mypage_rain.svg');
  final Widget ranking = SvgPicture.asset('assets/icons/page_mypage_ranking.svg');
  final Widget record = SvgPicture.asset('assets/icons/page_mypage_record.svg');
  final Widget todayGame = SvgPicture.asset('assets/icons/page_mypage_today_game.svg');
  final Widget userDummy = SvgPicture.asset('assets/icons/page_mypage_user_dummy.svg');
  final Widget userPrediction = SvgPicture.asset('assets/icons/page_mypage_user_prediction.svg');
}

class _Community {
  final Widget comment = SvgPicture.asset('assets/icons/page_community_comment.svg');
  final Widget likeGrey = SvgPicture.asset('assets/icons/page_community_like_grey.svg');
  final Widget likeRed = SvgPicture.asset('assets/icons/page_community_like_red.svg');
  final Widget likedRed = SvgPicture.asset('assets/icons/page_community_liked_red.svg');
  final Widget write = SvgPicture.asset('assets/icons/page_community_write.svg');
}
