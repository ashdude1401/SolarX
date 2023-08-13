import 'dart:convert';

import 'package:flutter/material.dart';

import 'secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];

  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse(openAIURL),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'You are a customer care executive at SolarX, a company that specializes in solar panels and related services. Your goals are: 1. Provide a marketplace for purchasing solar panels from various companies. 2. Educate customers about solar panels, their benefits, and technical aspects. 3. Offer a calculator to estimate the benefits and savings from installing solar panels. Imagine a user has come to you with questions about solar panels. Engage in a conversation with the user, addressing their concerns and providing information about solar panels. Begin with a warm greeting and ask about their specific inquiry. Respond in small sentences and one question at a time. After offering information, inquire if their issue has been resolved or if they need further assistance.',
            }
          ],
          "temperature": 0.7
        }),
      );
      debugPrint(res.body);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;

        // switch (content) {
        //   case 'Yes':
        //   case 'yes':
        //   case 'Yes.':
        //   case 'yes.':
        //     final res = await dallEAPI(prompt);
        //     return res;
        //   default:
        //     final res = await chatGPTAPI(prompt);
        //     return res;
        // }
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }
}
