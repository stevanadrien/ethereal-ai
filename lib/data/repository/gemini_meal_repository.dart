import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pic_2_plate_ai/domain/cubit/meal/meal_cubit.dart';
import 'package:pic_2_plate_ai/domain/repository/meal_repository.dart';

class GeminiMealRepository extends AbstractMealRepository {
  final apiKey = dotenv.env['PALM_API_KEY'];

  @override
  Future<List<String>> getMeals(MealSettingsParameters parameters) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey!,
    );

    final prompt = _generatePrompt(parameters);
    final image = await parameters.picture!.readAsBytes();
    final mimetype = parameters.picture!.mimeType ?? 'image/jpeg';

    final response = await model.generateContent([
      Content.multi([TextPart(prompt), DataPart(mimetype, image)])
    ]);

   // return response.skipWhile((response) => response.text != null).map((event) => event.text!);

    return [response.text!];
  }

  String _generatePrompt(MealSettingsParameters parameters) {
    String prompt =
        '''You are a very experienced diet Planner, i need some grocery planner that enough to cook for ${parameters.people.toString()} days and I only need to cook for ${parameters.maxTimeCooking.toString()} people I have preferences for this kind of food :  ${parameters.intoleranceOrLimits}, use Indonesian Language, also give me the total weight or the quantity of the item that i should buy at my grocery bills
  ''';

    if (parameters.intoleranceOrLimits != null) {
      prompt += 'I also have this extra ingredients ${parameters.intoleranceOrLimits}';
    }

    return prompt;
  }
}
