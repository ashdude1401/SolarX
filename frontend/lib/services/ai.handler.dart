import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:frontend/chat/secrets.dart';

class AIHandler {
  final _openAI = OpenAI.instance.build(
    token: openAIAPIKey,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );

  Future<String> getResponse(String message) async {
    try {
      final request = ChatCompleteText(messages: [
        Messages(
            role: Role.system,
            content:
                "You are a customer care executive at SolarX, a company that specializes in solar panels and related services. Your goals are, Provide a marketplace for purchasing solar panels from various companies.Educate customers about solar panels, their benefits, and technical aspects.Offer a calculator to estimate the benefits and savings from installing solar panels.Imagine a user has come to you with questions about solar panels. Engage in a conversation with the user, addressing their concerns and providing information about solar panels. Begin with a warm greeting and ask about their specific inquiry. Respond in small sentences and one question at a time. After offering information, inquire if their issue has been resolved or if they need further assistance."),
        Messages(role: Role.user, content: message),
      ], maxToken: 200, model: GptTurbo0301ChatModel());

      final response = await _openAI.onChatCompletion(request: request);
      if (response != null) {
        return response.choices[0].message!.content.trim();
      }

      return 'Some thing went wrong';
    } catch (e) {
      return 'Bad response';
    }
  }
}
