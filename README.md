# AIR for iOS / Android のapp.xml 作成

iOS / Android 両対応アプリをつくるときのapp.xmlを作るテンプレートみたいなものです。


# Grunt

## App-xml作成

以下のコマンドですべてのappxmlを更新します

	$ grunt appxml

`common/appxml/`の中に格納されます



# なにをやってるのか

* base.config.coffeeに書かれている設定をベースに
* ios.config.coffee, android.config.coffeeなどで、個別設定を上書き・追加します
* その設定を元にbase.jadeを使ってapp.xmlを吐き出します。


