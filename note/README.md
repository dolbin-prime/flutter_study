# Flutter Note
Notes for flutter that I've learned.

## Element
### Widget - Element - RenderObject
실제로 화면에 그려지는 것은 Element 이며,
이 Element를 어떻게 나타낼 지에 대한 정보를 가지고 있는 것이 RenderObject이다.
우리가 사용하는 Widget은 전부 Element로 변환되며 Widget 트리에서의 위치 등에 대한 정보를 가지고 있다.
Widget은 우리가 쉽게 앱을 만들 수 있도록 Flutter가 제공하는 것이다.
### BuildContext
BuildContext는 사실 Element 객체이며 현재 WidgetBuilder 함수가 반환하는 Widget의 '부모' Element이다.
그래서 WidgetBuilder 안에서 생성하는 무언가를 같은 함수 안에서 BuildContext를 통해 접근하려고 하면(예를 들어 Theme.of(context) 등) 실패하는 것이다.
이는 Builder Widget를 통해 해결할 수 있는데, Builder.builder 콜백이 제공하는 BuildContext는 그 Builder 자체의 BuildContext이기 때문이다
(즉 Builder Widget을 WidgetBuilder가 반환한다고 생각했을 때 Builder Widget의 BuildContext는 그 부모가 되므로, 이를 통해 접근하고자 하는 것을 찾을 수 있다).
