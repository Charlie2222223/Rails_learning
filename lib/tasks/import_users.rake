namespace :import do
  desc "Import users from CSV"
  task users: :environment do
    require 'csv'

    csv_file_path = Rails.root.join('db', 'data', 'test.csv')
    
    CSV.foreach(csv_file_path, headers: true) do |row|
      # 既存のユーザーは更新せず、新規作成のみ行う
      User.find_or_create_by(mail: row['mail']) do |user|
        user.name = row['name']
        user.ruby = row['ruby']
        user.sex = row['sex']
        user.tel = row['tel']
        user.mobile = row['mobile']
        user.zip = row['zip']
        user.address1 = row['address1']
        user.address2 = row['address2']
        user.address3 = row['address3']
        user.address4 = row['address4']
        if row['address5'] == ""
          user.address5 = "入力されてません"
        else
          user.address5 = row['address5']
        end
        user.birthday = row['birthday']
      end
    end
  end
end