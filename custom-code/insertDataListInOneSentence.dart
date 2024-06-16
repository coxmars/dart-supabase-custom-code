import 'package:supabase/supabase.dart';

Future<bool> insertSocialMediaLinks(
    List<SocialMediaLinkStruct> socialMediaLinks) async {
  final supabaseClient = SupaFlow.client;

  // Get Id from Auth User
  final User? user = supabaseClient.auth.currentUser;
  if (user == null) {
    print('No user is logged in');
    return false;
  }
  final userId = user.id;

  // Establish correct enum values
  final validEnumValues = {'FACEBOOK', 'X', 'INSTAGRAM', 'LINKEDIN', 'WEB'};

  // Convert SocialMediaLinkStruct to Map<String, dynamic>
  final List<Map<String, dynamic>> socialMediaLinksMap =
      socialMediaLinks.map((linkStruct) {
    final type = linkStruct.type.toUpperCase();
    if (!validEnumValues.contains(type)) {
      throw Exception('Invalid type: $type');
    }
    return {'type': type, 'url': linkStruct.url, 'user_uid': userId};
  }).toList();

  try {
    final response = await supabaseClient
        .from('social_networks')
        .insert(socialMediaLinksMap);

    if (response is PostgrestException) {
      print('Insert failed: ${response.message}');
      return false;
    } else {
      print('Insert successful');
      return true;
    }
  } catch (error) {
    print('Error: $error');
    return false;
  }
}