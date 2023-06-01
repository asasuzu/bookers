class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string:body
      t.timestamps
    end
  end
end

# テーブルの作成,編集後[rails db:migrate]をする
# t.データ型名 :カラム名
# create_tableメソッドを「do」から「end」内に記述することで、カラムを定義。