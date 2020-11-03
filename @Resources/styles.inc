[TextStyle]
FontFace=#MyFont#
InlineSetting=Case | Upper
FontColor=#MyFontColor#
FontSize=16
AntiAlias=1

[PeriodTimeStyle]
FontSize=11
AntiAlias=1
FontColor=#primary#, 155
InlineSetting=CharacterSpacing | 0 | .3
X=22

[Active]
FontFace=#MyFont#
StringStyle=Bold
InlineSetting=CharacterSpacing | 0 | .5
InlineSetting2=Case | Upper
FontColor=#primary#
FontSize=14
Y=40r
X=20

[NonActive]
FontFace=#MyFont#
InlineSetting=Case | Upper
FontSize=13
FontColor=#MyFontColor#
AntiAlias=1
Y=40r
X=15

[Transition]
FontFace=#MyFont#
StringStyle=Bold
InlineSetting=Case | Upper
InlineSetting2=CharacterSpacing | .5 | 0
InlinePattern3=\d (.*)
InlineSetting3=Color | #secondary#, [TextBlink]
FontColor=#secondary#
FontSize=13
Y=40r
X=17
DynamicVariables=1
