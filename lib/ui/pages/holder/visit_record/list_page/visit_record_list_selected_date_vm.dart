import 'package:flutter_riverpod/flutter_riverpod.dart';

// 선택된 날짜 상태를 관리하는 프로바이더,
// null이면 선택되지 않은 상태. 기본 상태는 null.
final VisitRecordListselectedDateProvider = StateProvider<DateTime?>((ref) => null);
