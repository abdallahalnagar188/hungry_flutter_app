import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: Icon(
            isRtl ? Icons.arrow_back_ios_new : Icons.arrow_back_ios,
            color: Colors.black,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'محمد الخالدي',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '12/01/2025 - 20/01/2025',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://placehold.co/100x100/EFEFEF/AAAAAA?text=User'),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    isRtl ? Icons.chevron_left : Icons.chevron_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                reverse: true,
                children: [
                  _buildSenderBubble(
                    "This is a much longer message to demonstrate how text wrapping works inside the chat bubble. It should handle multiple lines gracefully.",
                    "11:32 ص",
                    screenWidth,
                  ),
                  _buildSenderBubble("مرحبا 👋", "11:31 ص", screenWidth),
                  _buildReceiverBubble("مراحب يا هلا", "11:35 AM", screenWidth),
                  _buildReceiverBubble("Hello! How are you?", "11:36 AM", screenWidth),
                ],
              ),
            ),
            _buildChatInputField(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiverBubble(String message, String time, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                backGroundColor: Colors.white,
                elevation: 2,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.7,
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                child: Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
                'https://placehold.co/100x100/C7C7C7/AAAAAA?text=Sender'),
          ),
        ],
      ),
    );
  }

  Widget _buildSenderBubble(String message, String time, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFEFEFEF),
            child: Icon(Icons.person, size: 20, color: Colors.grey),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                alignment: Alignment.topLeft,
                backGroundColor: const Color(0xFF2F5FFF),
                elevation: 1,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        time,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatInputField(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0)
          .copyWith(bottom: 24.0 + bottomPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF2F5FFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.send, color: Colors.white, textDirection: TextDirection.ltr),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'اكتب رسالتك',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}