# 雑多なメモ

## モデル関係

### 関連付けされているモデルをform_forで登録する

[一つのform_forで複数のテーブルに保存！！](https://qiita.com/shinichiro81/items/4edb8af4a64991897d5a)

> メモ
* required:trueの下りのところは何もしなくてもinsertできた。理由は不明。。
* 子（@recipe.images.buildの部分）の build は new のaliasなので、newでも行ける

### 子テーブルの値を使おうとしたらundefined methodで怒られる

[【Rails】undefined method `hoge' for #<Model::ActiveRecord_Associations_CollectionProxy>](https://qiita.com/Hassan/items/94d79bcae2ba033bc829)

> メモ
* has_many だと子テーブルがコレクション（ActiveRecord_Associations_CollectionProxy）で返ってくるので、each で回す必要があるっていうのがポイント
