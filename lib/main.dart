import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //! phương pháp này giúp lưu lại những gì đang hoạt động.
    //! người dùng có thể chuyển đổi ứng dụng của bạn sang ứng dụng khác thì bạn có thể lưu ở trong đây.
    //! phương pháp này làm thay đổi trạng thái vòng đời của ứng dụng.
    setState(() {
      _appLifecycleState = state;
      print("My App State: $_appLifecycleState");
      //! nếu bạn muốn lưu cùng một số dữ liệu khi người dùng chuyển từ ứng dụng của bạn sang ứng dụng khác thì bạn có thể lưu
    });
  }

  //todo:--------------------
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: "",
//       home: new Scaffold(
//         body: new Center(
//           child: new Text(_appLifecycleState.toString(),style: new TextStyle(fontSize: 20),),
//         ),
//       ),
//     );
//   }
// }
//todo: ----------------------------
//nếu muốn thay đổi màu trên color khi xoay màn hình
// được tạo từ phương thức oncreate và sau đó bạn phải xử lý bằng cách lưu trường hợp đó vào một gói để đó là thứ bạn
// cần phải làm nhưng một rung động sẽ giúp chúng ta thay đổi hướng nhưng trong trường hợp giả sử tôi muốn thay đổi màu văn bản
// khi tôi thay đổi hướng thì làm sao chúng ta có thể làm điều đó đúng nếu bạn muốn thực hiện một số thay đổi với ứng dụng khi người dùng thay đổi
// hướng như bạn có thể thấy rằng trong chế độ dọc có ít không gian hơn chiều rộng nhỏ nhưng chiều cao nhiều hơn
// nhưng ở chế độ ngang nếu chúng ta thấy thì chiều rộng rất lớn hoặc bạn có thể nói rất lớn và chiều cao rất nhỏ nên
// thì rõ ràng chúng ta có thể có một số thay đổi tùy thuộc vào bạn có thể nói tùy thuộc vào hướng, vì vậy hãy xem cách
// chúng ta có thể làm điều đó vì vậy ở đây trong nhà bạn có màn hình giữ lối thoát mới này và sau đó chúng ta có cái này trong cơ thể mới được gửi hoặc chúng ta
// có thể gói cái này với một widget mới. bạn muốn thay đổi hướng và bạn có thể gói nó hoặc bạn có thể tạo một tiện ích mẹ
// đó là nhà tạo giống định hướng.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "",
      home: new Scaffold(
        body: OrientationBuilder(
          builder: (context, orientation) {
            return new Center(
                child: new Text(
              _appLifecycleState.toString(),
              style: new TextStyle(
                  fontSize: 20,
                  color: orientation == Orientation.portrait
                      ? Colors.blue
                      : Colors.red),
            ));
          },
        ),
      ),
    );
  }
}
