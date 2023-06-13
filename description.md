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
- Stack은 위젯들을 위에다가 쌓을 수 있게 해준다. 팬케이크나 카드를 쌓듯이.
- Dart는 private, protected, public이라는 개념이 없다. 대신 만약에 메서드나 프로퍼티 이름 앞에 `_`가 있다면 다른 파일에서 보기에는 private이 되는것이다.
- Controller는 코드, 메서드 등으로 TextField와 같은 위젯을 컨트롤 할수 있게 해준다.
- Controller를 생성하기 위해서는 먼저 StatelessWidget을 StatefulWidget으로 변경해야한다.
- Controller를 생성한 다음에, Controller를 위젯에 넘겨주고 그 위젯에서의 변화를 감지하면된다.
- AnimatedDefaultTextStyle은 텍스트가 바뀔때 애니메이션 효과를 준다.
- 모든 것의 뒤에 super.dispose()를 선언하는 것이 가장 설득력이는 답이다.
- 위젯과 그 상태를 초기화할때 먼저 initState()를 호출한 뒤에 원하는 것을 하고 위젯이 제거되려고 할때 다른 것들을 모두 정리한뒤 super.dispose()로 마무리한다.
- TextButton은 onPressed를 통해 눌릴때 처리할 콜백함수를 가질 수 있고 Text를 가지는 자식을 가질수 있다.
- TextButton를 사용하지 않는 이유는 사용자 지정 UI를 만들기 때문이다.
- username 화면에서 \_onNextTap()은 context를 받는 것이 필요하지 않다. 그 이유는 StatefulWidget안의 State안에 있다면 어디서든 context를 사용할수 있다.
- TextField는 입력을 제공하는 멋진 위젯이지만 폼에 좀더 강력한 유효성 검사가 필요하고 입력 칸이 딱 하나인게 아니라면 다른 위젯으로 대체하는게 좋다.

### ONBOARDING

- onboarding은 유저가 가장 처음 앱을 실행했을때 유저를 맞이하고 앱에 관해 설명해주는 방식을 말한다.
