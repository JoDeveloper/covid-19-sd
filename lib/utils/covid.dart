import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/expansion_card.dart';

launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}

var questions = [
  SizedBox(
    height: 25.0,
  ),
  ListTile(
    title: Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        "كورونا ؟",
        style: TextStyle(
          color: Colors.white,
          fontSize: 50.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
    trailing: Icon(
      Icons.local_hospital,
      size: 50.0,
      color: Colors.white,
    ),
  ),
  SizedBox(
    height: 50.0,
  ),
  getCard(" ما هو فيروس كورونا ؟",
      """ فيروسات كورونا هي فصيلة كبيرة من الفيروسات التي قد تسبب المرض للحيوان والإنسان.  ومن المعروف أن عدداً من فيروسات كورونا تسبب لدى البشر حالات عدوى الجهاز التنفسي التي تتراوح حدتها من نزلات البرد الشائعة إلى الأمراض الأشد وخامة مثل متلازمة الشرق الأوسط التنفسية والمتلازمة التنفسية الحادة الوخيمة (السارس). ويسبب فيروس كورونا المُكتشف مؤخراً مرض فيروس كورونا كوفيد-19. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("ما هو مرض كوفيد-19 ؟",
      """مرض كوفيد-19 هو مرض معد يسببه فيروس كورونا المُكتشف مؤخراً. ولم يكن هناك أي علم بوجود هذا الفيروس وهذا المرض المستجدين قبل اندلاع الفاشية في مدينة يوهان الصينية في كانون الأول/ ديسمبر 2019. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("ما هي أعراض مرض كوفيد-19 ؟",
      """تتمثل الأعراض الأكثر شيوعاً لمرض كوفيد-19 في الحمى والإرهاق والسعال الجاف. وقد يعاني بعض المرضى من الآلام والأوجاع، أو احتقان الأنف، أو الرشح، أو ألم الحلق، أو الإسهال. وعادة ما تكون هذه الأعراض خفيفة وتبدأ تدريجياً. ويصاب بعض الناس بالعدوى دون أن تظهر عليهم أي أعراض ودون أن يشعروا بالمرض. ويتعافى معظم الأشخاص (نحو 80%) من المرض دون الحاجة إلى علاج خاص. وتشتد حدة المرض لدى شخص واحد تقريباً من كل 6 أشخاص يصابون بعدوى كوفيد-19 حيث يعانون من صعوبة التنفس. وتزداد احتمالات إصابة المسنين والأشخاص المصابين بمشكلات طبية أساسية مثل ارتفاع ضغط الدم أو أمراض القلب أو داء السكري، بأمراض وخيمة. وقد توفى نحو 2% من الأشخاص الذين أُصيبوا بالمرض. وينبغي للأشخاص الذين يعانون من الحمى والسعال وصعوبة التنفس التماس الرعاية الطبية. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("كيف ينتشر مرض كوفيد-19 ؟",
      """ يمكن أن يصاب الأشخاص بعدوى مرض كوفيد-19 عن طريق الأشخاص الآخرين المصابين بالفيروس. ويمكن للمرض أن ينتقل من شخص إلى شخص عن طريق القُطيرات الصغيرة التي تتناثر من الأنف أو الفم عندما يسعل الشخص المصاب بمرض كوفيد-19 أو يعطس. وتتساقط هذه القُطيرات على الأشياء والأسطح المحيطة بالشخص. ويمكن حينها أن يصاب الأشخاص الآخرون بمرض كوفيد-19 عند ملامستهم لهذه الأشياء أو الأسطح ثم لمس عينيهم أو أنفهم أو فمهم. كما يمكن أن يصاب الأشخاص بمرض كوفيد-19 إذا تنفسوا القُطيرات التي تخرج من الشخص المصاب بالمرض مع سعاله أو زفيره. ولذا فمن الأهمية بمكان الابتعاد عن الشخص المريض بمسافة تزيد على متر واحد (3 أقدام).

وتعكف المنظمة على تقييم البحوث الجارية بشأن طرق انتشار مرض كوفيد-19 وستواصل نشر أحدث ما تتوصل إليه من نتائج. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل يمكن للفيروس المسبب لمرض كوفيد-19 أن ينتقل عبر الهواء ؟",
      """ تشير الدراسات التي أُجريت حتى يومنا هذا إلى أن الفيروس الذي يسبب مرض كوفيد-19 ينتقل في المقام الأول عن طريق ملامسة القُطيرات التنفسية لا عن طريق الهواء. انظر الإجابة عن السؤال السابق: "كيف ينتشر مرض كوفيد-19 ؟"""),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل يمكن أن يصاب المرء بالمرض عن طريق شخص عديم الأعراض ؟",
      """تتمثل الطريقة الرئيسية لانتقال المرض في القُطيرات التنفسية التي يفرزها الشخص عند السعال. وتتضاءل احتمالات الإصابة بمرض كوفيد-19 عن طريق شخص عديم الأعراض بالمرة. ولكن العديد من الأشخاص المصابين بالمرض لا يعانون إلا من أعراض طفيفة. وينطبق ذلك بصفة خاصة على المراحل المبكرة للمرض. ولذا فمن الممكن الإصابة بمرض كوفيد-19 عن طريق شخص يعاني مثلاً من سعال خفيف ولا يشعر بالمرض. وتعكف المنظمة على تقييم البحوث الجارية بشأن فترة انتقال مرض كوفيد-19 وستواصل نشر أحدث النتائج.  """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل يمكن أن أصاب بمرض كوفيد-19 عن طريق براز شخص مصاب بالمرض ؟",
      """تبدو مخاطر انتقال مرض كوفيد-19 عن طريق براز الشخص المصاب بالعدوى محدودة. وفي حين أن التحريات المبدئية تشير إلى أن الفيروس قد يتواجد في البراز في بعض الحالات، فإن انتشاره عبر هذا المسار لا يشكل إحدى السمات الرئيسية للفاشية. وتعكف المنظمة على تقييم البحوث الجارية بشأن طرق انتشار مرض كوفيد-19 وستواصل نشر النتائج الجديدة. ولكن نظراً إلى ما ينطوي عليه ذلك من مخاطر، فإنه يعد سبباً آخر لتنظيف اليدين بانتظام بعد استخدام دورة المياه وقبل تناول الطعام. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("كيف يمكنني حماية نفسي ومنع انتشار المرض ؟",
      """ اطّلع باستمرار على آخر المعلومات عن فاشية مرض كوفيد-19 التي تُتاح على موقع المنظمة الإلكتروني والتي تصدرها سلطة الصحة العمومية الوطنية والمحلية في بلدك. لقد سجّلت بلدان كثيرة في العالم حالات إصابة بمرض كوفيد-19، وشهد العديد منها فاشيات. ولقد نجحت السلطات المعنية في الصين وفي بعض البلدان الأخرى في إبطاء وتيرة انتشار فاشياتها أو وقفها تماما. ونظرا لأنه من الصعب التنبؤ بتطور الوضع، يرجى الاطلاع بانتظام على آخر الأخبار.

 يمكنك الحد من احتمال إصابتك بمرض كوفيد-19 أو من انتشاره باتخاذ بعض الاحتياطات البسيطة:

نظف يديك جيداً بانتظام بفركهما مطهر كحولي لليدين أو بغسلهما بالماء والصابون.
لماذا ؟ إن تنظيف يديك بالماء والصابون أو فركهما بمطهر كحولي من شأنه أن يقتل الفيروسات التي قد تكون على يديك.
احتفظ بمسافة لا تقل عن متر واحد (3 أقدام) بينك وبين أي شخص يسعل أو يعطس.
لماذا ؟ عندما يسعل الشخص أو يعطس، تتناثر من أنفه أو فمه قُطيرات سائلة صغيرة قد تحتوي على الفيروس. فإذا كنت شديد الاقتراب منه يمكن أن تتنفس هذه القُطيرات، بما في ذلك الفيروس المسبب لمرض كوفيد-19 إذا كان الشخص مصاباً به.
تجنب لمس عينيك وأنفك وفمك.
لماذا ؟ تلمس اليدين العديد من الأسطح ويمكنها أن تلتقط الفيروسات. وإذا تلوثت اليدان فإنهما قد تنقلان الفيروس إلى العينين أو الأنف أو الفم. ويمكن للفيروس أن يدخل الجسم عن طريق هذه المنافذ ويصيبك بالمرض.

تأكد من اتّباعك أنت والمحيطين بك لممارسات النظافة التنفسية الجيدة. ويعني ذلك أن تغطي فمك وأنفك بكوعك المثني أو بمنديل ورقي عند السعال أو العطس، ثم التخلص من المنديل المستعمل على الفور.
لماذا ؟ إن القُطيرات تنشر الفيروس. وباتّباع ممارسات النظافة التنفسية الجيدة تحمي الأشخاص من حولك من الفيروسات مثل فيروسات البرد والأنفلونزا وكوفيد-19.

إلزم المنزل إذا شعرت بالمرض. إذا كنت مصاباً بالحمى والسعال وصعوبة التنفس، التمس الرعاية الطبية واتصل بمقدم الرعاية قبل التوجه إليه. واتّبع توجيهات السلطات الصحية المحلية.
لماذا ؟ تتوفر للسلطات الوطنية والمحلية أحدث المعلومات عن الوضع في منطقتك. واتصالك المسبق بمقدم الرعاية الصحية سيسمح له بتوجيهك سريعاً إلى مرفق الرعاية الصحية المناسب. وسيسهم ذلك في حمايتك ومنع انتشار الفيروسات وسائر أنواع العدوى.

اطلع باستمرار على آخر تطورات مرض كوفيد-19. واتّبع المشورة التي يسديها مقدم الرعاية الصحية أو سلطات الصحة العمومية الوطنية والمحلية أو صاحب العمل بشأن كيفية حماية نفسك والآخرين من مرض كوفيد-19.
لماذا ؟ تتوفر للسلطات الوطنية والمحلية أحدث المعلومات عما إذا كان مرض كوفيد-19 ينتشر في منطقتك. فهي الأقدر على إسداء المشورة بشأن الإجراءات التي يمكن أن يتخذها الأشخاص في منطقتك لحماية أنفسهم.

اطّلع باستمرار على آخر المعلومات عن بؤر تفشي عدوى كوفيد-19 (المدن أو المناطق المحلية التي ينتشر فيها مرض كوفيد-19 على نطاق واسع). وتجنب السفر إلى هذه الأماكن قدر الإمكان، خصوصا إذا كنت مسنّاً أو مصابًا بداء السكري أو بأحد أمراض القلب أو الرئة.
لماذا ؟ لأن هناك احتمال أكبر أن تصاب بعدوى مرض كوفيد-19 في إحدى هذه المناطق."""),
  SizedBox(
    height: 15.0,
  ),
  getCard(
      "تدابير الحماية للأشخاص الذي يزورون مناطق ينتشر فيها مرض كوفيد-19 أو زاروها مؤخراً (الأيام الأربعة عشر الماضية)",
      """ اتّبع الإرشادات الموضحة أعلاه (تدابير الحماية للجميع)
في حال بدأت تشعر بالتوعك، ولو بأعراض خفيفة كالصداع والحمى المنخفضة الدرجة (37.3 درجة مئوية أو أكثر) ورشح خفيف في الأنف، اعزل نفسك بالبقاء في المنزل حتى تتعافى تماما. وإذا تطلّب الأمر الاستعانة بشخص ما لإحضار ما تحتاج إليه من لوازم أو كنت مضطرا إلى الخروج لشراء ما تأكله مثلا، فارتد قناعا لتجنب نقل العدوى إلى أشخاص آخرين.
لماذا ؟ سيسمح تجنبك لمخالطة الآخرين وزيارتك للمرافق الطبية بأن تعمل هذه المرافق بمزيد من الفعّالية، وسيساعدان على حمايتك أنت والآخرين من الفيروس المسبب لمرض كوفيد-19 وسائر الفيروسات.

وإذا كنت تعاني من الحمى والسعال وصعوبة التنفس، التمس المشورة الطبية على الفور، فقد تكون مصاباً بعدوى الجهاز التنفسي أو حالة مرضية وخيمة أخرى. واتصل قبل الذهاب إلى مقدم الرعاية وأخبره إن كنت قد سافرت أو خالطت أي مسافرين مؤخراً.
لماذا ؟ إن اتصالك المسبق بمقدم الرعاية سيسمح له بتوجيهك سريعاً إلى مرفق الرعاية الصحية المناسب. وسيساعد ذلك أيضاً على منع أي انتشار محتمل للفيروس المسبب لمرض كوفيد-19 وغيره من الفيروسات."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("ما هي احتمالات إصابتي بمرض كوفيد-19",
      """ يتوقف الخطر على المكان الذي تتواجد فيه، وبشكل أكثر تحديدًا، ما إذا كانت عدوى كوفيد-19 تتفشي في هذا المكان.

وبالنسبة لمعظم الناس في معظم الأماكن، لا يزال خطر الإصابة بعدوى مرض كوفيد-19 ضعيفا. ومع ذلك، هناك بعض الأماكن في العالم (مدن أو مناطق) التي ينتشر فيها المرض حاليا. ويكون خطر الإصابة بعدوى مرض كوفيد-19 أعلى لدى الأشخاص الذين يعيشون في هذه المناطق أو يزورونها. وتتخذ الحكومات والسلطات الصحية حاليا إجراءات صارمة كلما كُشف عن حالة إصابة جديدة بمرض كوفيد-19. لذا، تأكّد من التزامك بأي قيود تُفرض محليا على السفر أو التنقل أو التجمعات الكبيرة. فالتعاون مع الجهات المعنية بمكافحة الأمراض من شأنه أن يحدّ من خطر الإصابة بمرض كوفيد-19 وانتشاره.

ويمكن احتواء فاشيات مرض كوفيد-19 ووقف انتقال العدوى، كما تجلّى ذلك في الصين وفي بلدان أخرى. ولكن، لسوء الحظ، يمكن أن تظهر فاشيات جديدة بسرعة. لذا، من المهم أن تطّلع على الوضع في المكان الذي تتواجد فيه أو تنوي الذهاب إليه. وتنشر المنظمة يوميا أحدث المعلومات عن وضع عدوى كوفيد-19 في العالم."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل ينبغي أن أشعر بالقلق من الإصابة بمرض كوفيد-19 ؟",
      """إن المرض الذي تسببه العدوى بفيروس كورونا المستجد (كوفيد-19) خفيف بشكل عام، لاسيما عند الأطفال والشباب. ومع ذلك، فإنه يمكن أن يسبب مرضًا خطيرًا، إذ يحتاج نحو شخص واحد من كل 5 أشخاص مصابين بهذا المرض إلى تلقّي الرعاية في المستشفى. لذا، فإن من الطبيعي أن يشعر الناس بالقلق إزاء كيفية تأثير فاشية مرض كوفيد-19 عليهم وعلى أحبائهم.

ويمكننا توجيه قلقنا على النحو الصحيح بتحويله إلى إجراءات لحماية أنفسنا وأحبائنا ومجتمعاتنا المحلية. وعلى رأس هذه الإجراءات غسل اليدين بشكل منتظم ومسهب واتّباع ممارسات النظافة التنفسية الجيدة. ثانيا، الاطلاع على مشورة السلطات الصحية المحلية والتقيّد بها، بما في ذلك القيود التي قد تُفرض على السفر والتنقل والتجمعات. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("من هم الأشخاص المعرضون لخطر الإصابة بمرض وخيم ؟",
      """مازلنا نتعرف على تأثير مرض كوفيد-19 على الناس، ومع ذلك فيبدو أن المسنين والأشخاص المصابين بحالات طبية موجودة مسبقاً (مثل ارتفاع ضغط الدم وأمراض القلب وداء السكري) يصابون بمرض وخيم أكثر من غيرهم. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل المضادات الحيوية فعّالة في الوقاية من مرض كوفيد-2019 أو علاجه ؟",
      """لا. لا تقضي المضادات الحيوية على الفيروسات، فهي لا تقضي إلا على العدوى الجرثومية. وبما أن مرض كوفيد-19 سببه فيروس، فإن المضادات الحيوية لا تقضي عليه. فلا ينبغي استعمال المضادات الحيوية كوسيلة للوقاية من مرض كوفيد-19 أو علاجه. ولا ينبغي استعمالها إلا وفقاً لتعليمات الطبيب لعلاج حالات العدوى الجرثومية.  """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل توجد أي أدوية أو علاجات يمكنها الوقاية من مرض كوفيد-19 أو علاجه ؟",
      """ في حين قد تريح بعض الأدوية الغربية أو التقليدية أو المنزلية من بعض أعراض كوفيد-19 أو تخففها، فليست هناك بيّنة على وجود أدوية حالياً من شأنها الوقاية من هذا المرض أو علاجه. ولا توصي المنظمة بالتطبيب الذاتي بواسطة أي أدوية، بما في ذلك المضادات الحيوية، سواء على سبيل الوقاية من مرض كوفيد-19 أو معالجته. غير أن هناك عدة تجارب سريرية جارية تتضمن أدوية غربية وتقليدية معاً. وستواصل المنظمة إتاحة معلومات محدّثة بهذا الشأن عندما تتوفر النتائج السريرية. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل هناك لقاح أو دواء أو علاج لمرض كوفيد-2019 ؟",
      """ ليس بعد. لا يوجد حتى يومنا هذا لقاح ولا دواء محدد مضاد للفيروسات للوقاية من مرض كوفيد-2019 أو علاجه. ومع ذلك، فينبغي أن يتلقى المصابون به الرعاية لتخفيف الأعراض. وينبغي إدخال الأشخاص المصابين بمرض وخيم إلى المستشفيات. ويتعافى معظم المرضى بفضل الرعاية الداعمة.

ويجري حالياً تحري بعض اللقاحات المحتملة والأدوية الخاصة بعلاج هذا المرض تحديداً. ويجري اختبارها عن طريق التجارب السريرية. وتقوم المنظمة بتنسيق الجهود المبذولة لتطوير اللقاحات والأدوية للوقاية من مرض كوفيد-19 وعلاجه.

وتتمثل السبل الأكثر فعّالية لحماية نفسك والآخرين من مرض كوفيد-19 في المواظبة على تنظيف اليدين، وتغطية الفم عند السعال بثني المرفق أو بمنديل ورقي، والابتعاد مسافة لا تقل عن متر واحد (3 أقدام) عن الأشخاص الذين يسعلون أو يعطسون. (انظر: كيف يمكنني حماية نفسي ومنع انتشار المرض ؟)."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل مرض كوفيد-19 هو نفسه مرض سارس ؟",
      """لا. هناك ارتباط جيني بين الفيروس المسبب لمرض كوفيد-19 والفيروس المسبب للمتلازمة التنفسية الحادة الوخيمة (سارس)، ولكنهما مختلفان. ويعد مرض السارس أكثر فتكا من مرض كوفيد-19 ولكنه أقل عدوى منه بكثير. ولم يشهد أي مكان في العالم فاشية السارس منذ عام 2003. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل ينبغي أن أضع كمامة لحماية نفسي ؟",
      """ لا تضع كمامة إلا إذا ظهرت عليك أعراض مرض كوفيد-19 (خاصة السعال) أو إذا كنت تقدم الرعاية لشخص يُحتمل أنه مصاب بهذا الـمرض. ولا يمكنك استعمال الكمامة وحيدة الاستعمال إلا مرة واحدة. أما إذا لم تكن مريضا أو إذا قائما على رعاية شخص مريض، فستكون قد أهدرت كمامة دون داع. ونظرا للنقص في إمدادات الكمامات على الصعيد العالمي، فإن المنظمة تحث الناس على التحلي بالحكمة في استخدامها.

وتنصح المنظمة باستخدام الكمامات استخداما رشيدا لتفادي إهدار الموارد الثمينة دون داع وإساءة استخدامها (انظر الإرشادات بشأن استخدام الكمامات).

وتتمثل السبل الأكثر فعّالية لحماية نفسك والآخرين من مرض كوفيد-19 في تنظيف يديك بشكل متكرر وتغطية الفم عند السعال بثني المرفق أو بمنديل ورقي، وترك مسافة لا تقل عن متر واحد (3 أقدام) عن الأشخاص الذين يسعلون أو يعطسون. ولمزيد من المعلومات، انظر تدابير الحماية الأساسية من فيروس كورونا المستجد.

 

وتنصح المنظمة بالاستخدام الرشيد للكمامات الطبية لتلافي إهدار الموارد الثمينة وإساءة استخدام الأقنعة (انظر النصائح الخاصة باستخدام الكمامات). لا تستخدم الكمامة إلا إذا كنت مصاباً بأعراض تنفسية (السعال والعطس)، أو يُشتبه بإصابتك بعدوى مرض كوفيد-19 المصحوبة بأعراض خفيفة، أو كنت تقدم الرعاية إلى شخص يشتبه بإصابته بهذه العدوى. وترتبط العدوى المشتبه فيها بمرض كوفيد-19 بالسفر إلى المناطق التي أبلغت عن وجود حالات، أو بالمخالطة الوثيقة لشخص سافر إلى تلك المناطق وأُصيب بالمرض.

وتتمثل السبل الأكثر فعّالية لحماية نفسك والآخرين من مرض كوفيد-19 في المواظبة على تنظيف اليدين، وتغطية الفم عند السعال بثني المرفق أو بمنديل ورقي، والابتعاد مسافة لا تقل عن متر واحد (3 أقدام) عن الأشخاص الذين يسعلون أو يعطسون. انظر تدابير الحماية للاطلاع على المزيد من المعلومات."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("طريقة وضع الكمامة واستخدامها ونزعها والتخلص منها",
      """1-       تذكر أن استخدام الكمامة ينبغي أن يقتصر على العاملين الصحيين ومقدمي الرعاية والأشخاص المصابين بأعراض تنفسية مثل الحمى والسعال.

2-       قبل لمس الكمامة، نظف يديك بفركهما بمطهر كحولي أو بغسلهما بالماء والصابون.

3-      أمسك الكمامة وافحصها للتأكد من أنها غير ممزقة أو مثقوبة.

4-      حدد الطرف العلوي من الكمامة (موضع الشريط المعدني).

5-      تأكد من توجيه الجانب الصحيح من الكمامة إلى الخارج (الجهة الملونة).

6-      ضع الكمامة على وجهك. اضغط على الشريط المعدني أو الطرف المقوى للكمامة ليتخذ شكل أنفك.

7-      اسحب الجزء السفلي من الكمامة لتغطي فمك وذقنك.

8-      بعد الاستخدام، اخلع الكمامة بنزع الشريط المطاطي من خلف الأذنين مبعداً الكمامة  عن وجهك وملابسك لتجنب ملامسة أجزاء الكمامة التي يحتمل أن تكون ملوثة.

9-      تخلص من الكمامة المستعملة على الفور برميها في صندوق نفايات مغلق.

15-  نظف يديك بعد ملامسة الكمامة أو رميها بفركهما بمطهر كحولي، أو إذا بغسلهما بالماء والصابون إذا كانت متسختين بوضوح. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("كم تستغرق فترة حضانة مرض كوفيد-19 ؟",
      """ مصطلح "فترة الحضانة" يشير إلى المدة من الإصابة بالفيروس إلى بدء ظهور أعراض المرض. وتتراوح معظم تقديرات فترة حضانة مرض كوفيد-19 ما بين يوم واحد و14 يوماً، وعادة ما تستمر خمسة أيام. وستُحدّث هذه التقديرات كلما توفر المزيد من البيانات."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل يمكن أن تنتقل عدوى مرض كوفيد-19 إلى البشر من مصدر حيواني ؟",
      """ فيروسات كورونا هي فصيلة كبيرة من الفيروسات الشائعة بين الخفافيش والحيوانات. ويصاب الأشخاص في حالات نادرة بعدوى هذه الفيروسات التي ينقلونها بعد ذلك إلى الآخرين. ومن الأمثلة على ذلك أن فيروس كورونا المسبب لمتلازمة الالتهاب الرئوي الحاد الوخيم (سارس) الذي ارتبط بقطط الزباد، وفيروس كورونا المسبب لمتلازمة الشرق الأوسط التنفسية الذي انتقل طريق الإبل. ولم تتأكد بعد المصادر الحيوانية المحتملة لمرض كوفيد-19. 

ولحماية نفسك، عندما تزور أسواق الحيوانات الحية مثلاً، تجنب الملامسة المباشرة للحيوانات وللأسطح الملامسة للحيوانات. وتأكد من اتّباع ممارسات السلامة الغذائية الجيدة في جميع الأوقات بتوخى العناية الواجبة عند التعامل مع اللحوم النيئة والحليب الخام وأعضاء الحيوانات لتلافي تلوث الأغذية غير المطهوة، وتجنب تناول المنتجات الحيوانية النيئة أو غير المطبوخة جيداً."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل يمكن أن أُصاب بمرض كوفيد-19 عن طريق حيواني الأليف ؟",
      """ على الرغم من تسجيل حالة إصابة كلب بعدوى كوفيد-19 في هونغ كونغ، فلا يوجد حتى اليوم دليل علمي على إمكانية انتقال عدوى كوفيد-19 من كلب أو قط أو أي حيوان أليف. فمرض كوفيد-19 ينتشر بشكل أساسي عن طريق القطيرات التي يفرزها الشخص المصاب بالعدوى عندما يسعل أو يعطس أو يتكلم. ولحماية نفسك من العدوى، نظف يديك بشكل جيد ومتكرر.
وتواصل منظمة الصحة العالمية رصد آخر الأبحاث في هذا المجال وغيره من المواضيع المتصلة بكوفيد-19 وتحرص على تحديث هذه المعلومات كلما توفرت استنتاجات جديدة في هذا الصدد."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("كم من الوقت يظل الفيروس حياً على الأسطح ؟",
      """ لا يُعرف على وجه اليقين فترة استمرار الفيروس المسبب لمرض كوفيد-19 حياً على الأسطح، ولكن يبدو أنه يشبه في ذلك سائر فيروسات كورونا. وتشير الدراسات إلى أن فيروسات كورونا (بما في ذلك المعلومات الأولية عن الفيروس المسبب لمرض كوفيد-19) قد تظل حية على الأسطح لبضع ساعات أو لعدة أيام. وقد يختلف ذلك باختلاف الظروف (مثل نوع السطح ودرجة الحرارة أو الرطوبة البيئية).

إذا كنت تعتقد أن سطحاً ما قد يكون ملوثاً، نظفه بمطهر عادي لقتل الفيروس وحماية نفسك والآخرين. ونظف يديك بفركهما بمطهر كحولي أو بغسلهما بالماء والصابون. وتجنب لمس عينيك أو فمك أو أنفك."""),
  SizedBox(
    height: 15.0,
  ),
  getCard(
      "هل من الآمن تلقي الطرود من المناطق التي أبلغت عن حالات إصابة بمرض كوفيد-19 ؟",
      """ نعم. إن احتمالات تلوث السلع التجارية عن طريق شخص مصاب بالعدوى هي احتمالات ضعيفة، كما أن مخاطر الإصابة بالفيروس الذي يسبب مرض كوفيد-19 عن طريق طرد نُقل وشُحن وتعرض لمختلف الظروف ودرجات الحرارة، هي مخاطر ضئيلة."""),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل هناك أمور ينبغي أن أتجنبها ؟",
      """التدابير التالية غير فعّالة في مواجهة مرض كوفيد-19 بل قد تكون ضارة:

التدخين
استخدام كمامات متعددة
تعاطي المضادات الحيوية (أنظر هل توجد أي أدوية أو علاجات يمكنها الوقاية من مرض كوفيد-19 أو علاجه ؟)
في جميع الأحوال، إذا كنت مصاباً بالحمى والسعال وصعوبة التنفس، التمس الرعاية الطبية مبكراً من أجل الحد من مخاطر الإصابة بعدوى أشد وطأة، وتأكد من إطلاع مقدم الرعاية الصحية على أي أماكن سافرت إليها في الآونة الأخيرة. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل لفيروس كورونا المسبب لمرض كوفيد-19 مصدر معروف ؟",
      """حالياً، لا يزال مصدر فيروس كورونا-سارس-2، وهو فيروس كورونا المسبب لمرض كوفيد-19، غير معروف. غير أن جميع البيّنات المتاحة تشير إلى أن منشأ هذا الفيروس حيواني طبيعي وأنه ليس فيروساً مصنّعاً. والأرجح أن المستودع البيئي لفيروس كورونا-سارس-2 هو الخفافيش. وينحدر فيروس كورونا-سارس-2 من مجموعة فيروسات متقاربة جينياً تشمل فيروس كورونا لمسبب لمتلازمة سارس وعدد من فيروسات كورونا الأخرى المعزولة من أسراب الخفافيش. وينحدر فيروس كورونا المسبب لمتلازمة ميرس أيضاً من هذه الفصيلة، ولكن خصائصه تختلف عنها بعض الشيء. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("كيف حدثت أول عدوى بشرية بفيروس كورونا-سارس-2 ؟",
      """اكتُشفت أول حالات عدوى بشرية بمرض كوفيد-19 في مدينة ووهان الصينية في كانون الأول/ديسمبر 2019. ولا يمكن في هذه المرحلة تحديد كيف انتقلت عدوى الفيروس لأول مرة إلى البشر في ووهان.

غير أن فيروس كورونا-سارس، الذي كان السبب في تفشي متلازمة سارس في عام 2003، طفر من مستودع حيواني (سنانير الزباد، وهو حيوان بري تتم تربيته في المزارع) إلى البشر ثم سرعان ما انتشر بينهم. وعلى نفس الشاكلة، يُعتقد أن فيروس كورونا-سارس-2 قد اخترق حاجز الأجناس وانتقلت عدواه إلى البشر عبر كائن مضيف وسيط على الأرجح، أي عن طريق نوع حيواني يتعامل معه البشر بشكل اعتيادي. وقد يكون حيواناً منزلياً أو حيواناً برياً أو حيواناً برياً مدجّناً، وهو ما لم يتسن تحديده حتى الآن.

وإلى أن يتسنى تحديد مصدر هذا الفيروس والسيطرة عليه، فسيظل الخطر قائماً من عودة انتقاله إلى البشر واندلاع فاشيات جديدة كالتي نشهدها حالياً. """),
  SizedBox(
    height: 15.0,
  ),
  getCard("هل تنتقل عدوى كوفيد-19 بالهواء ؟",
      """ ينتقل الفيروس المسبب لمرض كوفيد-19 بشكل أساسي عن طريق القطيرات المنبعثة من الشخص المصاب بالعدوى عندما يعطس أو يسعل أو يتكلم. ووزن هذه القطيرات أثقل من أن يسمح لها بالبقاء معلقة في الهواء، فهي سرعان ما تسقط على الأرض أو الأسطح.

ويمكن أن تنتقل إليك عدوى الفيروس بالاستنشاق إذا كنت على مسافة متر واحد من شخص مصاب بمرض كوفيد-19 أو إذا لامست سطحاً ملوثاً ثم لمست عينيك أو أنفك أو فمك قبل أن تغسل يديك."""),
  SizedBox(
    height: 50.0,
  ),
  Center(
    child: InkWell(
      onTap: () => launchUrl(
          "https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public/q-a-coronaviruses"),
      child: Text(
        "المصدر",
        style: TextStyle(
            color: Colors.blue, fontFamily: GoogleFonts.ubuntu().fontFamily),
      ),
    ),
  ),
  SizedBox(
    height: 20.0,
  )
];

final List<String> covidList =[
  'images/protect-yourself_against_coronoa_at_workspace_1.jpg',
  'images/protect-yourself_against_coronoa_at_workspace_2.jpg',
  'images/protect-yourself_against_coronoa_at_workspace_3.jpg',
  'images/protect-yourself_against_coronoa_at_workspace_4.jpg',
  'images/protect-yourself_against_coronoa_at_workspace_5.jpg',
  'images/protect-yourself_against_coronoa_at_workspace_6.jpg',
  'images/protect-yourself_against_coronoa_at_workspace_7.jpg',
  'images/protect-yourself_against_coronoa_at_workspace_8.jpg',
  'images/corona_virus_mask_1.jpg',
  'images/corona_virus_mask_2.jpg',
  'images/corona_virus_mask_3.jpg',
  'images/corona_virus_mask_4.jpg',
  'images/corona_virus_mask_5.jpg',
  'images/corona_virus_mask_6.jpg',
  'images/corona_virus_mask_7.jpg',
  'images/covid-19-myth-alcohol.png',
  'images/covid-19-myth-disinfectant.png',
  'images/covid-19-myth-feaces.png',
  'images/covid-19-myth-gloves.png',
  'images/covid-19-myth-goods.png',
  'images/covid-19-myth-greetings.png',
  'images/covid-19-myth-hand-shaking.png',
  'images/covid-19-myth-hot-weather.png',
  'images/covid-19-myth-sanitizer.png',
  'images/covid-19-myth-smoking.png',
  'images/covid-19-myth-water.png',
  'images/myth_alcohol.jpg',
  'images/myth_antibiotics.jpg',
  'images/myth_fire_works.jpg',
  'images/myth_garlic.jpg',
  'images/myth_hand_dryer.jpg',
  'images/myth_medicine.jpg',
  'images/myth_nasal_wash.jpg',
  'images/myth_susceptible_people.jpg',
  'images/myth_thermometers.jpg',
  'images/myth_ultraviolet_lamp.jpg',
  'images/myth_vaccines.jpg',
];
