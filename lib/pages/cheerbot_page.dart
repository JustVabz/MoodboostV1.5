import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hey there! I'm CheerBot. How are you feeling today? 😊",
      isBot: true,
      timestamp: DateTime.now(),
    ),
  ];
  bool _isBotTyping = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    // Add user message
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isBot: false,
        timestamp: DateTime.now(),
      ));
      _isBotTyping = true;
    });

    // Clear input
    _messageController.clear();

    // Simulate bot thinking
    Future.delayed(const Duration(seconds: 1), () {
      _respondToUser(text);
    });
  }

  void _respondToUser(String userMessage) {
    String response;

    // Simple response logic - you can replace this with API calls to a real chatbot
    if (userMessage.toLowerCase().contains('overwhelm') ||
        userMessage.toLowerCase().contains('stress')) {
      response =
          "I'm sorry you're feeling this way. Have you tried taking deep breaths? It can help calm your mind.";
    } else if (userMessage.toLowerCase().contains('happy') ||
        userMessage.toLowerCase().contains('good')) {
      response = "That's wonderful to hear! What's making you feel happy today?";
    } else if (userMessage.toLowerCase().contains('sad') ||
        userMessage.toLowerCase().contains('depress')) {
      response =
          "I'm here for you. Would you like to talk more about what's bothering you?";
    } else {
      response =
          "I understand. Sometimes it helps to talk things out. Can you tell me more?";
    }

    setState(() {
      _isBotTyping = false;
      _messages.add(ChatMessage(
        text: response,
        isBot: true,
        timestamp: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CheerBot Therapy Session",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _messages.length + (_isBotTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _messages.length) {
                  return _ChatBubble(
                    message: _messages[index],
                  );
                } else {
                  return const _TypingIndicator();
                }
              },
            ),
          ),
          _MessageInput(
            controller: _messageController,
            onSubmitted: _handleSubmitted,
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isBot;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isBot,
    required this.timestamp,
  });
}

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isBot
              ? Theme.of(context).primaryColor
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.text),
            const SizedBox(height: 4),
            Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                fontSize: 10,
                color: message.isBot ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<double> _dotOpacities = [0.0, 0.0, 0.0];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    
    _controller.addListener(() {
      final value = _controller.value;
      setState(() {
        _dotOpacities[0] = _calculateOpacity(value, 0);
        _dotOpacities[1] = _calculateOpacity(value, 0.33);
        _dotOpacities[2] = _calculateOpacity(value, 0.66);
      });
    });
  }

  double _calculateOpacity(double value, double offset) {
    final adjustedValue = (value - offset) % 1.0;
    return adjustedValue < 0.5 ? adjustedValue * 2 : (1 - adjustedValue) * 2;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: _dotOpacities[0],
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Opacity(
              opacity: _dotOpacities[1],
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Opacity(
              opacity: _dotOpacities[2],
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const _MessageInput({
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Your response here...",
                filled: true,
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              onSubmitted(controller.text);
            },
          ),
        ],
      ),
    );
  }
}