/// 할 일 입력 유효성 검사를 담당하는 클래스
class TodoValidator {
  // 최소 길이 상수
  static const int minLength = 3;
  // 최대 길이 상수
  static const int maxLength = 10;

  /// 할 일 제목의 유효성을 검사합니다.
  ///
  /// [title] 검사할 할 일 제목
  ///
  /// 반환값:
  /// - null: 유효한 입력
  /// - String: 에러 메시지
  static String? validateTitle(String? title) {
    // null 또는 빈 문자열 검사
    if (title == null || title.trim().isEmpty) {
      return '할 일을 입력해주세요.';
    }

    final trimmedTitle = title.trim();

    // 최소 길이 검사
    if (trimmedTitle.length < minLength) {
      return '할 일을 최소 ${minLength}자 이상 입력해주세요.';
    }

    // 최대 길이 검사
    if (trimmedTitle.length > maxLength) {
      return '할 일은 ${maxLength}자 이하로 입력해주세요.';
    }

    // 유효한 입력
    return null;
  }

  /// 할 일 제목이 유효한지 확인합니다.
  ///
  /// [title] 검사할 할 일 제목
  ///
  /// 반환값: true면 유효, false면 무효
  static bool isValidTitle(String? title) {
    return validateTitle(title) == null;
  }

  /// 입력 필드에 표시할 힌트 텍스트를 반환합니다.
  static String get hintText {
    return '할 일을 ${minLength}자 이상 ${maxLength}자 이하로 입력하세요.';
  }
}
