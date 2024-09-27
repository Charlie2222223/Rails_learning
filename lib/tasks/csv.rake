namespace :import do
  desc "Import users from CSV"
  task users: :environment do
    require 'csv'

    csv_file_path = Rails.root.join('db', 'csv', 'test.csv')
    user_data = []

    ActiveRecord::Base.transaction do
      CSV.foreach(csv_file_path, headers: true) do |row|
        user_data << {
          name: row['name'],
          ruby: row['ruby'],
          sex: row['sex'],
          tel: row['tel'],
          mobile: row['mobile'],
          mail: row['mail'],
          zip: row['zip'],
          address1: row['address1'],
          address2: row['address2'],
          address3: row['address3'],
          address4: row['address4'],
          address5: row['address5'].blank? ? "入力されてません" : row['address5'],
          birthday: row['birthday']
        }
      end

      # バルクインサートの実行
      begin
        User.insert_all(user_data)
        puts "ユーザーを #{user_data.size} 件、正常に登録しました。"
      rescue => ActiveRecord::RecordInvalid => exception
        puts "ユーザーの登録中にエラーが発生しました: #{e.message}"
        raise ActiveRecord::Rollback # トランザクションをロールバックする
      end
    end # ここでトランザクションを閉じる
  end # ここでタスクを閉じる
end # ここでネームスペースを閉じる