import 'subject.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../models/task.dart';
import 'observer.dart';

class EmailNotification extends Observer {
  final String username = "shecaapp@gmail.com";
  final String password = "ucxjuysnjvvfvngp";

  EmailNotification(Subject subject) {
    this.subject = subject;
    this.subject.attachObserver(this);
  }

  @override
  Future<void> notify(String text) async {
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add("Phong46037@gmail.com")  // Địa chỉ email của người nhận
      ..subject = 'Thông báo: Tạo task thành công'  // Tiêu đề email
      ..text = text;  // Nội dung email
    try {
      final sendReport = await send(message, smtpServer);
      print('Email gửi thành công');
    } catch (e) {
      print('Lỗi khi gửi email: $e');
    }
  }
}