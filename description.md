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

### NAVIGATOR 2

- MaterialPageRoute를 사용하면 url이 변하지 않는다.
- Navigator 1.0은 웹에서 앞으로 가기 버튼을 지원하지 않는다.
- URL을 바꾸고 싶을 땐 GoRouter를 사용하고 바꾸고 싶지 않을땐 사용하지 않는다.
- pushReplacementNamed는 push는 되지만 뒤로 갈 수가 없다.
- push란 데이터 등을 스택 위에 추가한다는 뜻이다. 뒤로가기 버튼을 통해서 뒤로 갈수 있다. push를 하면 pop을 할수 있다.
- go를 한다면 말그대로 그냥 그 경로로 간다는 뜻이다. 경로가 바뀌어버리고, 기존 스택에 추가하는게 아니다. 스택을 교체하는 것이다. context.go를 사용하는 이유는 그냥 그 경로로 가고 싶기 때문이다. 기존 스택은 신경쓰지 않고 새로운 URL로 이동
- 자식 경로는 /로 시작할 수 없다
- routeName과 routeURL이 다를 수 있기 때문에 을 따로 두면 좋다.

### STATE MANAGEMENT

- InheritedWidget에서는 위젯 트리 맨 위에 정의된 값을 가져다 쓸수 있다.
- updateShouldNotify는 위젯을 rebuild 할지 말지를 정할수 있게 해준다.
- videoConfig라는 타입의 InheritedWidget을 가져오라고 context에 명령할수 있다.
- 다른 모든 화면과 위젯에게 데이터와 데이터 변경 메소드 접근권한을 주기 위해서 InheritedWidget를 쓰는 것이다.
- InheritedWidget는 단지 데이터 전달자일뿐이다.
- changeNotifier는 두 기능을 감싸서 하나로 만드는 것이다.
- provider는 앱에 많은 것을 제공하고 어디서나 열람할수 있게 해준다

### MVVM WITH PROVIDER

- MVVM는 Model View ViewModel 아키텍처이다.
- 아키텍처가 필요한 이유는 코드를 어떤 패턴에 맞춰서 정리해야 하기 때문이다
- 관심사의 분리는 소프트웨어 설계의 가장 중요한 원칙이다.
- 관심사의 분리의 의미는 한 파일은 한가지 일만을 하고 그것만 잘해야한다는 뜻이다.
- MVVM 아키텍처를 사용하면 직관적으로 이해햐기 쉽게 코드를 정리할수 있다.
- context.watch는 변하는 프로퍼티의 값을 알고 싶을때 사용한다.
- context.read는 변하지 않는 것을 한번만 읽고 싶을때 사용한다.(에를 들어 메소드 함수)

### RIVERPOD

- Riverpod은 관심사의 분리를 가능케 해준다는 점에서 Provider와 비슷하다
- Riverpod은 View로직과 Business로직을 각기 다른곳에 위치하게 만들어주고 dependency들을 주입시켜서 Provider들을 어디에서나 읽을수 있게 해준다.
- Riverpod은 여러개의 Provider들이 동일한 type의 값을 노출할 수 있게끔 해준다.
- Riverpod은 Provider보다 더 잘 설계된 패키지이고 로직을 극적으로 간소화시켜줄수 있다.

### FIREBASE

- 프로토타입을 만들때 Firebase는 아주 좋다.
- 백엔드를 만드는데 시간을 쓸 필요가 없으니까 UI만 만들면 금방 사용자를 만날수 있다.
- Firebase의 단점은 커스텀 솔루션을 만들때이다.
- Firebase는 작은 아이디어나 스타트업에서 사용하기 적합하다.
- cURL 명령어를 실행
  curl -sL https://firebase.tools | bash
- firebase login
- dart pub global activate flutterfire_cli
- Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path. 이 에러가 나올경우
  - open ~/.zshrc
  - export PATH="$PATH":"$HOME/.pub-cache/bin"
  - source ~/.zshrc
- flutterfire configure
- flutter pub add firebase_core
- firebase 플러그인을 추가하거나 제거할때마다 flutterfire configure를 실행해야한다.
  - flutterfire configure
- ios 디버거 실행시 아래의 에러가 나온다면
  Error (Xcode): DT_TOOLCHAIN_DIR cannot be used to evaluate LIBRARY_SEARCH_PATHS, use TOOLCHAIN_DIR instead
  - https://stackoverflow.com/questions/77219650/dt-toolchain-dir-cannot-be-used-to-evaluate-library-search-paths-use-toolchain
- firestore는 nosql 데이터베이스이고 어떤 면에서는 document 데이터베이스와 비슷하다.

### VIDEO UPLOAD

- Cloud Functions는 구글의 백엔드에 어떤 코드도 배포할 수 있게 해주는 제품이다.
