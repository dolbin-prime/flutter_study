# WebAssembly Study with Flutter
## References
- [What is WASM?](https://webassembly.org/)
- [LLVM-WASM](https://www.google.com/search?sca_esv=5fbf67e4323cad9e&hl=ko&sxsrf=ADLYWIIqMKPkh__pUJyIqnUyXoq6ZPC38Q:1724773431140&q=llvm+wasm&udm=2&fbs=AEQNm0DmKhoYsBCHazhZSCWuALW8l8eUs1i3TeMYPF4tXSfZ96qP8jk59Ek0sz1u1YABeO8HG8dr9Z0pIiXpKYIhEwOJ2k8lQbNlrF2IBe5Y93_wn9LHCHy2FaF0KKbztyTUZFQHXIggu3gNrurZCQffcLucBtuMtScH6tDaOHBzJLJCyDoKzGyW63Vg0cVRXuL2sl0ed1PmZSb3edMKls55TLNhRbnakw&sa=X&ved=2ahUKEwisl7ndwZWIAxWkjVYBHVDFHIsQtKgLegQIEhAB&biw=1920&bih=945&dpr=1)
- [medium "웹 어셈블리에 주목하라"](https://medium.com/@yujso66/%EB%B2%88%EC%97%AD-%EC%9B%B9%EC%96%B4%EC%85%88%EB%B8%94%EB%A6%AC%EC%97%90-%EC%A3%BC%EB%AA%A9%ED%95%98%EB%9D%BC-280ff4e9ce01)
  - 웹 어셈블리의 강점
  - 웹어셈블리는 어디에 유용한가?
    - Figma
      - Skia(Flutter!)
  - 컨테이너
- [웹 어셈블리가 (자바스크립트보다)빠른 이유](https://tech.kakao.com/posts/438)
- [JS API](https://webassembly.org/getting-started/js-api/)
- [WASI](https://wasi.dev/)
- [WAT to WASM](https://github.com/WebAssembly/wabt?tab=readme-ov-file)
  - Example
## Deep dive 🤔
- 전체 앱을 Wasm으로 빌드했을 때 웹 브라우저가 이를 어떻게 불러오는지?
  - main.dart.js
  - flutter_bootstrap.js 
