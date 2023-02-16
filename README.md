# time_in_japanese

## in short English
Japanese format class for class TIME in Liberty Eiffel

## 日本語での説明

Liberty EiffelでTIMEを日本での形式に変換するものです。
詳細はTIME_IN_JAPANESE_TESTをコンパイルして出力を確認するのが手っ取り早いでしょう。
動作は基本的にはTIME_IN_ENGLISHなどに準じますが、以下が増えています。

```
   japanese_calendar_mode: BOOLEAN
      -- Japanese calendar (wareki) mode ?
   set_japanese_calendar_mode (value: BOOLEAN)
      ensure
        japanese_calendar_mode = value
```
名前から推測はつくと思いますが、年を令和や平成、昭和で表現します。

LOCALEで同じようなことはできるようなので、普通の人には不要なものな気がします。が、FreeBSDでLiberty Eiffelを動作させている場合、今のところLOCALEなどの国際化機能は使えませんので、そういう人にとってはちょっと嬉しいのではないでしょうか。あと、あちらだと、年号には流石に対応していないのではないかと、、、
