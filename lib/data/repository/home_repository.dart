import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class HomeRepository {
  Future<Map<String, dynamic>> getHome() async {
    Response response = await dio.get("/api/home");
    final responseBody = response.data;
    // final responseBody = {
    //   "status": 200,
    //   "msg": "성공",
    //   "body": {
    //     "todayGames": [
    //       {
    //         "gameId": 423,
    //         "gameStatus": "SCHEDULED",
    //         "gameTime": "18:30",
    //         "stadiumShortName": "잠실",
    //         "broadcastChannel": "MS_T",
    //         "homePitcherName": "콜어빈",
    //         "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/09/Doosan_Bears.png",
    //         "awayPitcherName": "김건우",
    //         "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/0/02/SSG_Landers.png",
    //         "ticketLink":
    //             "https://ticket.interpark.com/Contents/Sports/GoodsInfo?SportsCode=07001&TeamCode=PB004"
    //       },
    //       {
    //         "gameId": 424,
    //         "gameStatus": "SCHEDULED",
    //         "gameTime": "18:30",
    //         "stadiumShortName": "대구",
    //         "broadcastChannel": "KN_T",
    //         "homePitcherName": "가라비토",
    //         "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/95/Samsung_Lions.png",
    //         "awayPitcherName": "문동주",
    //         "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/99/Hanwha_Eagles.png",
    //         "ticketLink": "https://www.ticketlink.co.kr/sports#reservation"
    //       },
    //       {
    //         "gameId": 425,
    //         "gameStatus": "SCHEDULED",
    //         "gameTime": "18:30",
    //         "stadiumShortName": "창원",
    //         "broadcastChannel": "SS_T",
    //         "homePitcherName": "최성영",
    //         "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/bd/NC_Dinos.png",
    //         "awayPitcherName": "감보아",
    //         "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/9/91/Lotte_Giants.png",
    //         "ticketLink": "https://ticket.ncdinos.com/login"
    //       },
    //       {
    //         "gameId": 426,
    //         "gameStatus": "SCHEDULED",
    //         "gameTime": "18:30",
    //         "stadiumShortName": "수원",
    //         "broadcastChannel": "SPO_T",
    //         "homePitcherName": "소형준",
    //         "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/b/b3/KT_Wiz.png",
    //         "awayPitcherName": "임찬규",
    //         "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/4/4f/LG_Twins.png",
    //         "ticketLink": "https://www.ktwiz.co.kr/ticket/reservation"
    //       },
    //       {
    //         "gameId": 427,
    //         "gameStatus": "SCHEDULED",
    //         "gameTime": "18:30",
    //         "stadiumShortName": "고척",
    //         "broadcastChannel": "SPO_2T",
    //         "homePitcherName": "하영민",
    //         "homeTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/5/52/Kiwoom_Heroes.png",
    //         "awayPitcherName": "김건국",
    //         "awayTeamLogoUrl": "https://upload.wikimedia.org/wikipedia/ko/6/6e/KIA_Tigers.png",
    //         "ticketLink":
    //             "https://ticket.interpark.com/Contents/Sports/GoodsInfo?SportsCode=07001&TeamCode=PB003"
    //       }
    //     ],
    //     "winPredictions": [
    //       {
    //         "gameId": 423,
    //         "homeTeamName": "두산",
    //         "awayTeamName": "SSG",
    //         "homePitcherName": "콜어빈",
    //         "awayPitcherName": "김건우",
    //         "homePitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/55257.png",
    //         "awayPitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/51867.png",
    //         "homePredictionScore": 4.2,
    //         "awayPredictionScore": 3.9,
    //         "totalPredictionScore": 8.1,
    //         "homeWinPercent": 52.0,
    //         "awayWinPercent": 48.0
    //       },
    //       {
    //         "gameId": 424,
    //         "homeTeamName": "삼성",
    //         "awayTeamName": "한화",
    //         "homePitcherName": "가라비토",
    //         "awayPitcherName": "문동주",
    //         "homePitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/55460.png",
    //         "awayPitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/52701.png",
    //         "homePredictionScore": 3.7,
    //         "awayPredictionScore": 3.8,
    //         "totalPredictionScore": 7.5,
    //         "homeWinPercent": 49.2,
    //         "awayWinPercent": 50.8
    //       },
    //       {
    //         "gameId": 425,
    //         "homeTeamName": "NC",
    //         "awayTeamName": "롯데",
    //         "homePitcherName": "최성영",
    //         "awayPitcherName": "감보아",
    //         "homePitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/66920.png",
    //         "awayPitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/55532.png",
    //         "homePredictionScore": 4.5,
    //         "awayPredictionScore": 3.6,
    //         "totalPredictionScore": 8.1,
    //         "homeWinPercent": 55.6,
    //         "awayWinPercent": 44.4
    //       },
    //       {
    //         "gameId": 426,
    //         "homeTeamName": "KT",
    //         "awayTeamName": "LG",
    //         "homePitcherName": "소형준",
    //         "awayPitcherName": "임찬규",
    //         "homePitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/50030.png",
    //         "awayPitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/61101.png",
    //         "homePredictionScore": 3.8,
    //         "awayPredictionScore": 3.8,
    //         "totalPredictionScore": 7.6,
    //         "homeWinPercent": 50.0,
    //         "awayWinPercent": 50.0
    //       },
    //       {
    //         "gameId": 427,
    //         "homeTeamName": "키움",
    //         "awayTeamName": "KIA",
    //         "homePitcherName": "하영민",
    //         "awayPitcherName": "김건국",
    //         "homePitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/64350.png",
    //         "awayPitcherProfileUrl":
    //             "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/kbo/2025/76225.png",
    //         "homePredictionScore": 3.5,
    //         "awayPredictionScore": 3.9,
    //         "totalPredictionScore": 7.4,
    //         "homeWinPercent": 47.6,
    //         "awayWinPercent": 52.4
    //       }
    //     ],
    //     "boards": [
    //       {"title": "직관 다녀온 후기", "content": "롯데 경기 진짜 재밌었음. 9회말 역전승은 감동이었어."},
    //       {"title": "직관 다녀온 후기", "content": "롯데 경기 진짜 재밌었음. 9회말 역전승은 감동이었어."},
    //       {"title": "직관 다녀온 후기", "content": "롯데 경기 진짜 재밌었음. 9회말 역전승은 감동이었어."},
    //       {"title": "직관 다녀온 후기", "content": "롯데 경기 진짜 재밌었음. 9회말 역전승은 감동이었어."},
    //       {"title": "직관 다녀온 후기", "content": "롯데 경기 진짜 재밌었음. 9회말 역전승은 감동이었어."}
    //     ]
    //   }
    // };
    Logger().d('HomeRepository getHome: ${responseBody}');
    return responseBody;
  }
}