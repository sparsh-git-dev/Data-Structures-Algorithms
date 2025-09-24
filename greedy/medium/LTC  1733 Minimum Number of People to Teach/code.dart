import 'dart:math';

int minimumTeachings(
    int n, List<List<int>> languages, List<List<int>> friendships) {
  Set<int> sadUsers = {}; // users who can't talk to their friend
  for (var friends in friendships) {
    int user1 = friends[0] - 1;
    int user2 = friends[1] - 1;

    Set<int> langSet = {};
    for (var lang in languages[user1]) langSet.add(lang);

    bool canTalk = false;
    for (var lang in languages[user2]) {
      if (langSet.contains(lang)) {
        canTalk = true;
        break;
      }
    }

    if (!canTalk) {
      sadUsers.add(user1);
      sadUsers.add(user2);
    }
  }

  // Count how many sadUsers already know each language
  Map<int, int> languagesFreq = {};
  int mostKnownLang = 0;

  for (int user in sadUsers) {
    for (int lang in languages[user]) {
      if (languagesFreq.containsKey(lang)) {
        languagesFreq[lang] = (languagesFreq[lang] ?? 0) + 1;
      } else {
        languagesFreq[lang] = 1;
      }

      mostKnownLang = max(mostKnownLang, languagesFreq[lang]!);
    }
  }

  // total sadUsers - mostKnownLang
  return sadUsers.length - mostKnownLang;
}
