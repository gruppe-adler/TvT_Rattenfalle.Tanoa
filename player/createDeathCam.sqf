_quotes = [
["Der Tod eines Mannes ist eine Tragödie, aber der Tod von Millionen nur eine Statistik.","Joseph Stalin"],
["Ich bin überzeugt, dass Menschen heute am Leben wären, wenn es die Todesstrafe gäbe.","Nancy Reagan"],
["Am schnellsten beendet man einen Krieg, indem man ihn verliert.","George Orwell"],
["Ich bin nicht sicher, mit welchen Waffen der dritte Weltkrieg ausgetragen wird, aber im vierten Weltkrieg werden sie mit Stöcken und Steinen kämpfen.","Albert Einstein"],
["Der Krieg ist viel zu wichtig, um ihn dem Militär anzuvertrauen.","Georges Clemenceau"],
["Der Krieg ist eine Serie von Fehlschlägen, aus der ein Sieger hervorgeht.","Georges Clemenceau"],
["Krieg ist nicht nett.","Barbara Bush"],
["Krieg ist ein Spiel, bei dem man lächelt. Wenn man nicht lächeln kann, sollte man grinsen. Wenn man nicht grinsen kann, sollte man sich für eine Zeit nicht blicken lassen.","Winston Churchill"],
["Wer auf den Krieg vorbereitet ist, kann den Frieden am Besten wahren.","George Washington"],
["Blockier' nicht den Weg, wenn du alt werden willst.","Pink Floyd"],
["Der Tod ist eine trübselige Angelegenheit, und ich rate Ihnen, nichts damit zu tun zu haben.","W. Somerset Maugham"],
["Viele, die leben, verdienen den Tod.  Und mache, die sterben, verdienen zu leben.","J.R.R. Tolkien"],
["Und schließlich gibt es das älteste und tiefste Verlangen, die große Flucht: Dem Tod zu entrinnen.","J.R.R. Tolkien"],
["Und was dich angeht, Leben, so sehe ich dich als Überbleibsel vieler Tode. Sicher bin auch ich selbst schon zehntausend Mal gestorben.","Walt Whitman"],
["Männer führen Kriege gegeneinander, weil jeder Mann in sich selbst einen Krieg ausficht.","Francis Meehan"],
["Ich habe keine Angst vor dem Tod, ich möchte nur nicht dabeisein, wenn's passiert.","Woody Allen"],
["It is hard to have patience with people who say 'There is no death' or 'Death doesn't matter.' There is death and whatever is matters.","C.S.Lewis"],
["Der Tod eines Mannes ist eher eine Angelegenheit seiner Hinterbliebenen denn seine eigene.","Thomas Mann"],
["Ich glaube nicht an ein Schicksal, welches die Menschen unabhängig von Ihren Handlungen ereilt. Ich glaube eher an ein Schicksal, welches die Menschen ereilt, wenn sie nicht handeln.","G. K. Chesterton"],
["Ein Mensch, der für nichts zu sterben gewillt ist, verdient nicht zu leben.","Martin Luther King"],
["Wenn das Spiel zuende ist, landen König und Bauer wieder in derselben Schachtel.","Italienisches Sprichwort"],
["Ich habe den Kampf noch nicht begonnen!","John Paul Jones"],
["Die Menschheit muß dem Krieg ein Ende setzen, oder der Krieg setzt der Menschheit ein Ende.","John Fitzgerald Kennedy"],
["Kriege haben noch nie jemandem geschadet, außer denen, die in ihnen umkommen.","Salvador Dali"],
["Der Krieg entscheidet nicht darüber, wer Recht hat, sondern nur darüber, wer übrig bleibt.","Bertrand Russell"],
["Wir verbessern uns durch die Siege über uns selbst. Es muss Wettstreit geben, in dem man gewinnt.","Edward Gibbon"],
["Wir sind nur dadurch erfolgreich, dass wir uns im Leben oder im Krieg oder wo auch immer ein einzelnes beherrschendes Ziel setzen und diesem Ziel alle anderen Überlegungen unterordnen.","Dwight D. Eisenhower"],
["Die Erfahrung ist ein strenger Schulmeister: Sie prüft uns, bevor sie uns lehrt.","Vernon Sanders Law"],
["Man kann besser auf die Nase fallen, als sich zu weit zurück zu lehnen.","Sprichwort"],
["Mut ist, wenn man Todesangst hat, aber sich trotzdem in den Sattel schwingt.","John Wayne"],
["Der Tod ist allgemeiner als das Leben: Jeder stirbt, aber nicht jeder lebt.","A.Sachs"],
["Die Fantasie ist die einzige Waffe im Kampf gegen die Wirklichkeit.","Jules de Gaultier"],
["Man kann nicht sagen, dass die Zivilisation keine Fortschritte macht: Für jeden Krieg wird eine neue Todesart entwickelt.","Will Rogers"],
["...Stell dir vor, es ist Krieg, und keiner geht hin.","Carl Sandburg"],
["Der Krieg ist aus gutem Grund so schrecklich, ansonsten würden wir ihn zu sehr genießen.","Robert E. Lee"],
["Man kann einen Krieg genauso wenig gewinnen wie ein Erdbeben.","Jeanette Rankin"],
["Der Krieg ist eine der Plagen, mit denen Gott die Menschheit straft.","Cardinal Richelieu"],
["In einem Krieg gibt es keinen Ersatz für den Sieg.","General Douglas MacArthur"],
["In einem Krieg geht es nicht ums Recht, sondern ums Überleben.","Anders Russell"],
["Das Ziel in einem Krieg ist nicht, dass man für sein Land stirbt, sondern das der Lump da drüben für seins stirbt.","General G. C. Patton"],
["Viel gute Arbeit wird mangels etwas mehr Arbeit verschwendet.","Edward Harriman"],
["Nimm eine Niederlage als Zeichen, dass deine Pläne nicht solide waren. Plane um und verfolge dein Ziel erneut.","Napolean Hill"],
["Tapfere Männer sind wie Wirbeltiere: Außen weich, aber innen mit einem harten Kern.","Lewis Carroll"],
["You're shit at dying, you know that?","Sandor 'The Hound' Clegane - George R.R. Martin"],
["Death is so terribly final, while life is full of possibilities.","Tyrion Lannister - George R.R. Martin"],
["The man who fears losing has already lost.","George R.R. Martin"],
["Rhaegar fought valiantly, Rhaegar fought nobly, Rhaegar fought honorably. And Rhaegar died.","Tyrion Lannister - George R.R. Martin"]
];



_title = "<t color='#8f110a' size='3' align='center' shadow='0'>Du bist tot.</t>";
_selectedQuote = selectRandom _quotes;
_quote = "<t color='#f9f9f9' size='1.5' align='center' shadow='0'>" + (_selectedQuote select 0) + "</t>";
_author = "<t color='#f9f9f9' size='1' align='right' shadow='0'>" + (_selectedQuote select 1) + "</t>";

// diag_log format ["death message is %1 from %2", _quote, _author];

0 = createDialog "GRAD_DeathCamDisplay";
disableSerialization;
_display = uiNamespace getVariable ['GRAD_DeathCamDisplay',0];
waitUntil {!isNull _display};
cutRsc ["RscStatic", "PLAIN" , 3];
_ctrlHeadline = _display displayCtrl 7001;
_ctrlHeadline ctrlSetStructuredText parseText _title;
_ctrlHeadline ctrlSetFont "EtelkaNarrowMediumPro";
_ctrlHeadline ctrlCommit 0;

_ctrlQuote = _display displayCtrl 7002;
_ctrlQuote ctrlSetStructuredText parseText _quote;
_ctrlQuote ctrlSetFont "EtelkaNarrowMediumPro";
_ctrlQuote ctrlCommit 0;

_ctrlAuthor = _display displayCtrl 7003;
_ctrlAuthor ctrlSetStructuredText parseText _author;
_ctrlAuthor ctrlSetFont "EtelkaNarrowMediumPro";
_ctrlAuthor ctrlCommit 0;

// CAM STUFF

_unit = player;
_shooter = _unit getVariable ["ACE_medical_lastDamageSource",_unit];

showCinemaBorder true;

playSound "march_hell";
_filmgrain = ppEffectCreate ["FilmGrain",2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
_filmgrain ppEffectCommit 0;

_camera = "camera" camCreate (position _unit);
// _camera camSetTarget _unit;
_camera cameraEffect ["internal","back"];
_camera camSetFov 0.4;
_camera camCommit 1;
_camera camSetTarget _unit;
sleep 1;
_camera camSetPos [getpos _unit select 0, getpos _unit select 1,3];
_camera camSetFov 0.6;
_camera camCommit 2;
sleep 3;
_camera camSetTarget _shooter;
_camera camSetFov 0.2;
_camera camCommit 5;
sleep 10;
_camera camSetTarget _unit;
_camera camCommit 5;
_camera camSetPos [getpos _unit select 0, getpos _unit select 1,50];
_camera camSetFov 0.4;
_camera camCommit 55;
sleep 55;
cutRsc ["RscStatic", "PLAIN" , 3];
sleep 1;
cutText ["", "BLACK OUT", 1];
_filmgrain ppEffectEnable false;
ppEffectDestroy _filmgrain;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
showCinemaBorder false;
sleep 0.5;
true
