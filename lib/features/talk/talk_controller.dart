import '../../core/models/suggested_reply_model.dart';
import '../../core/safety/ai_safety_guard.dart';
import '../../core/safety/response_simplifier.dart';
import '../../core/safety/topic_router.dart';

class LiaTalkState {
  final String title;
  final String reply;
  final List<SuggestedReplyModel> suggestions;
  final bool completed;
  final String? completedLessonId;
  final String? completedBadge;

  const LiaTalkState({
    required this.title,
    required this.reply,
    required this.suggestions,
    this.completed = false,
    this.completedLessonId,
    this.completedBadge,
  });
}

class LiaTalkController {
  static const _homeSuggestions = <SuggestedReplyModel>[
    SuggestedReplyModel(label: 'Colors', actionId: 'lesson:colors'),
    SuggestedReplyModel(label: 'Numbers', actionId: 'lesson:numbers'),
    SuggestedReplyModel(label: 'Shapes', actionId: 'lesson:shapes'),
    SuggestedReplyModel(label: 'Feelings', actionId: 'lesson:feelings'),
    SuggestedReplyModel(label: 'Animals', actionId: 'lesson:animals'),
    SuggestedReplyModel(label: 'Body Parts', actionId: 'lesson:body_parts'),
  ];

  LiaTalkState initialState() {
    return const LiaTalkState(
      title: 'Choose a Topic',
      reply: 'Hi, friend. We can learn colors, numbers, shapes, or feelings.',
      suggestions: _homeSuggestions,
    );
  }

  LiaTalkState respond(LiaTalkState currentState, String input) {
    if (containsUnsafeContent(input)) {
      return const LiaTalkState(
        title: 'Safe Learning',
        reply: 'Let us choose a safe learning game instead.',
        suggestions: [
          SuggestedReplyModel(label: 'Colors', actionId: 'lesson:colors'),
          SuggestedReplyModel(label: 'Numbers', actionId: 'lesson:numbers'),
        ],
      );
    }

    if (input.startsWith('lesson:')) {
      return _startLesson(input.replaceFirst('lesson:', ''));
    }

    if (input.startsWith('choice:')) {
      return _resolveChoice(input.replaceFirst('choice:', ''));
    }

    if (input == 'action:back_home') {
      return initialState();
    }

    final topic = routeTopic(input);
    switch (topic) {
      case 'colors':
        return _startLesson('colors');
      case 'numbers':
        return _startLesson('numbers');
      case 'shapes':
        return _startLesson('shapes');
      case 'feelings':
        return _startLesson('feelings');
      default:
        return _buildHome(
          'Let us go back to our learning game. Colors or numbers?',
        );
    }
  }

  LiaTalkState _startLesson(String lessonId) {
    switch (lessonId) {
      case 'colors':
        return const LiaTalkState(
          title: 'Colors',
          reply: 'Blue is cool and bright. Which one is usually blue?',
          suggestions: [
            SuggestedReplyModel(label: 'Sky', actionId: 'choice:colors_sky'),
            SuggestedReplyModel(
                label: 'Banana', actionId: 'choice:colors_banana'),
            SuggestedReplyModel(
                label: 'Grass', actionId: 'choice:colors_grass'),
          ],
        );
      case 'numbers':
        return const LiaTalkState(
          title: 'Numbers',
          reply: 'Let us count. Which number comes after 2?',
          suggestions: [
            SuggestedReplyModel(label: '3', actionId: 'choice:numbers_3'),
            SuggestedReplyModel(label: '5', actionId: 'choice:numbers_5'),
            SuggestedReplyModel(label: '1', actionId: 'choice:numbers_1'),
          ],
        );
      case 'shapes':
        return const LiaTalkState(
          title: 'Shapes',
          reply: 'A circle is smooth and round. Which one has no corners?',
          suggestions: [
            SuggestedReplyModel(
                label: 'Circle', actionId: 'choice:shapes_circle'),
            SuggestedReplyModel(
                label: 'Square', actionId: 'choice:shapes_square'),
            SuggestedReplyModel(
                label: 'Triangle', actionId: 'choice:shapes_triangle'),
          ],
        );
      case 'feelings':
        return const LiaTalkState(
          title: 'Feelings',
          reply: 'If you feel happy, which face would match that feeling best?',
          suggestions: [
            SuggestedReplyModel(
                label: 'Smiling', actionId: 'choice:feelings_smiling'),
            SuggestedReplyModel(
                label: 'Yawning', actionId: 'choice:feelings_yawning'),
            SuggestedReplyModel(
                label: 'Sleeping', actionId: 'choice:feelings_sleeping'),
          ],
        );
      case 'animals':
        return const LiaTalkState(
          title: 'Animals',
          reply: 'Which animal says meow?',
          suggestions: [
            SuggestedReplyModel(label: 'Cat', actionId: 'choice:animals_cat'),
            SuggestedReplyModel(label: 'Dog', actionId: 'choice:animals_dog'),
            SuggestedReplyModel(label: 'Fish', actionId: 'choice:animals_fish'),
          ],
        );
      case 'body_parts':
        return const LiaTalkState(
          title: 'Body Parts',
          reply: 'Which body part helps you hear sounds?',
          suggestions: [
            SuggestedReplyModel(
                label: 'Ears', actionId: 'choice:body_parts_ears'),
            SuggestedReplyModel(
                label: 'Feet', actionId: 'choice:body_parts_feet'),
            SuggestedReplyModel(
                label: 'Hands', actionId: 'choice:body_parts_hands'),
          ],
        );
      default:
        return initialState();
    }
  }

  LiaTalkState _resolveChoice(String choiceId) {
    switch (choiceId) {
      case 'colors_sky':
        return _buildCompletion(
          title: 'Colors',
          reply:
              'Yes. The sky is often blue. You finished a color chat with Lia.',
          lessonId: 'talk_colors',
          badge: 'Talk Colors',
        );
      case 'numbers_3':
        return _buildCompletion(
          title: 'Numbers',
          reply: 'That is right. After 2 comes 3. Great counting.',
          lessonId: 'talk_numbers',
          badge: 'Talk Numbers',
        );
      case 'shapes_circle':
        return _buildCompletion(
          title: 'Shapes',
          reply: 'Yes. A circle has no corners. Nice spotting.',
          lessonId: 'talk_shapes',
          badge: 'Talk Shapes',
        );
      case 'feelings_smiling':
        return _buildCompletion(
          title: 'Feelings',
          reply:
              'Yes. A smiling face can show happiness. That was kind thinking.',
          lessonId: 'talk_feelings',
          badge: 'Talk Feelings',
        );
      case 'animals_cat':
        return _buildCompletion(
          title: 'Animals',
          reply: 'Correct. A cat says meow. You are learning fast.',
          lessonId: 'talk_animals',
          badge: 'Talk Animals',
        );
      case 'body_parts_ears':
        return _buildCompletion(
          title: 'Body Parts',
          reply: 'Yes. Ears help us hear music and voices.',
          lessonId: 'talk_body_parts',
          badge: 'Talk Body Parts',
        );
      default:
        return _buildHome(
          'Good try. Let us choose another little learning chat.',
        );
    }
  }

  LiaTalkState _buildCompletion({
    required String title,
    required String reply,
    required String lessonId,
    required String badge,
  }) {
    return LiaTalkState(
      title: title,
      reply: simplifyReply(reply),
      completed: true,
      completedLessonId: lessonId,
      completedBadge: badge,
      suggestions: const [
        SuggestedReplyModel(
            label: 'Try another topic', actionId: 'action:back_home'),
      ],
    );
  }

  LiaTalkState _buildHome(String reply) {
    return LiaTalkState(
      title: 'Choose a Topic',
      reply: simplifyReply(reply),
      suggestions: _homeSuggestions,
    );
  }
}
