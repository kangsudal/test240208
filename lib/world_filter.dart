Map<String, int> countBlackWords(
  String userContent,
  List<String> blackWordList,
) {
  Map<String, int> checkedMap = {};
  List<String> splitedUserContent = userContent.split(' ');
  for (String blackWord in blackWordList) {
    for (String word in splitedUserContent) {
      List<int> indexList = []; //'바보바보'가 나왔을때 indexList는 [0,2]
      int index = word.indexOf(blackWord);

      while (index != -1) {
        //금지어가 하나도 안남아있을때까지, 금지어가 없을땐 -1로 바로 스킵
        indexList.add(index);
        index = word.indexOf(blackWord, index + blackWord.length);
      }

      if (indexList.isNotEmpty) {
        //금지어가 하나라도있으면
        if (checkedMap[blackWord] == null) {
          //금지어 처음 나온경우 value값 초기화
          checkedMap[blackWord] = indexList.length;
        } else {
          //금지어 횟수 추가
          checkedMap[blackWord] = checkedMap[blackWord]! + indexList.length;
        }
      }
    }
  }
  return checkedMap;
}
