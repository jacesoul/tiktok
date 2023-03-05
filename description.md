### Project Setup

- SizedBox는 기본적으로 고정된 크기를 갖는 Container이다.
- sizes, gaps는 utility class들이다.
- mobbin은 ios나 android 앱들의 스크린샷들을 모아둔 웹 사이트이다.

### Authentication

- Scaffold는 navigation bar, body, navbar 말고도 텍스트의 방향이나 사이즈 같은 Text 설정에 대해 아주 중요한 기능들이 있다.
- SafeArea를 사용하면 그 안에 있는 모든 것은 특정 공간에 있는다. 그리고 그 공간은 확실하게 뭔가에 가려지지 않는다.
- Navigator.of(context).push를 하면 화면을 기존 화면 위에 쌓게 된다.
- pop을 사용하면 Navigator의 가장 상단에 있는 화면 즉 유저가 보고 있는 현재 화면을 스택에서 제거할 수 있다.
- 스택에서 push와 pop이 있는데, 팬케이크를 예로 들면 push는 기존 팬케이크 위에 새 팬케이크를 두는것이고 pop은 제일 위에 있는 팬케이크를 빼는 것을 말하는것이다.
- `feature-driven architecture` 화면별로 생각하지 않고 기능별로 생각
- FractionallySizedBox는 기본적으로 Box 위젯인데 크기를 단순히 200px, 300px 픽셀로 정하는게 아니라 부모의 크기에 비례해서 크기를 정하게 해주는 위젯이다.
- 예를 들어 부모의 크기가 1000px이고 FractionallySizedBox의 widthFactor가 1이라고 한다면, FractionallySizedBox의 너비는 부모 너비의 100%가 될것이다.
- Font Awesome은 아이콘 라이브러리이다.
- Flutter에도 Material, Cupertino, Google, iOS등 몇몇 아이콘이 포함되어 있다.
- `font_awesome_flutter: 10.3.0`
- pubspec.yaml을 통해 새로운 패키지를 설치할 때마다 기존 디버그 세션을 닫고, 새로 시작하는게 좋은 습관이다.
- 어떤 패키지는 네이티브 쪽 무언가와 링크를 해야될 때도 있고, 에러도 좀 이상한 에러가 뜰 수도 있고, 에러가 코드 때문인지 새로 설치한 패키지 때문인지 알기 어려울 수도 있다.
- Expanded는 Row나 Column내에서 사용할 수 있는 만큼 공간을 전부 차지하는 위젯이다.
- Column은 여러 위젯들을 세로로 차례대로 배치할 수 있게 해준다.
- Row는 위젯들을 옆으로 배치할 수 있도록 해준다.
- Stack은 위젯들을 위에다가 쌓을 수 있게 해준다. 팬케이크나 카드를 쌓듯이
