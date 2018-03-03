# 雑多なメモ

## ■ デバッグ

### ◆ RailsをVSCでデバッグする

1. VSCをデバッグ窓にして歯車のボタンを押して、Rubyを選択
2. 以下をインストール（GemFilesに書いて、bundle install）

```ruby
gem 'ruby-debug-ide'
gem 'debase'
```

3. 下記実行

```cmd
bundle exec rdebug-ide --host 127.0.0.1 --port 1234 --dispatcher-port 26162 -- bin/rails s
```

4. VSCをデバッグ窓にして、左上のデバッグを、"Listen for rdebug-ide"にして、実行ボタンを押す
5. Railsが起動して、VSCでブレークポイント張るとブレイクされる

> メモ

* [Visual Studio Codeを使ってRailsをデバッグ実行してみよう](https://qiita.com/chimame/items/56e48ab3145312ff1786)
  * springのコマンドは実行しなくても良い
  * userBundlerも設定しなくて良い（というか、設定しようとしたらno allowって出る。補完が効かないのでオプションが無くなった？）
* [VSCのデバッグ説明ページ？](https://vscode-doc-jp.github.io/docs/userguide/debugging.html)

## ■ モデル関係

----

### ◆ 関連付けされているモデルをform_forで登録する

[一つのform_forで複数のテーブルに保存！！](https://qiita.com/shinichiro81/items/4edb8af4a64991897d5a)

> メモ
* required:trueの下りのところは何もしなくてもinsertできた。理由は不明。。
* 子（@recipe.images.buildの部分）の build は new のaliasなので、newでも行ける

----

### ◆ 複数の子レコードを作成・更新する

[複数の子レコードを作成・更新する. accepts_nested_attributes_for](https://qiita.com/hmuronaka/items/818c421dc632e3efb7a6)

> メモ
* params の permitにidを指定しないと、updateにならず、insertされるので注意  
例:params.require(:table1).permit(:col1, :col2, table1_child_attributes: [:id, :col1]) ※table1_child_attributesのとこ
* HTML的にはform_forしている時に勝手にhiddenでidが埋め込まれている  
* idがベタで埋め込まれるが、update文を実行する前にselect文で整合性を確認しているので、
HTML内のidを書き換えてもupdateが通らない  
※update前に↓のSQLが走り、ヒットしない子idがあると怒られる

```sql
SELECT `table1_children`.* FROM `table1_children` WHERE `table1_children`.`table1_id` = 27 AND `table1_children`.`id` IN (16, 17)
```

----

### ◆ 子テーブルの値を使おうとしたらundefined methodで怒られる

[【Rails】undefined method `hoge' for #<Model::ActiveRecord_Associations_CollectionProxy>](https://qiita.com/Hassan/items/94d79bcae2ba033bc829)

> メモ
* has_many だと子テーブルがコレクション（ActiveRecord_Associations_CollectionProxy）で返ってくるので、each で回す必要があるっていうのがポイント
