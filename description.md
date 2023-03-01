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
