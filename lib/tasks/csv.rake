# lib/tasks/import_users.rake
namespace :import do
  desc "Import users from CSV"
  task users: :environment do
    require 'csv'

    csv_file_path = Rails.root.join('db', 'csv', 'test.csv')

    error_count = 0

    user_data = []

    CSV.foreach(csv_file_path, headers: true) do |row|
      begin
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
      rescue => e
        error_count += 1
      end

    end
  
    User.insert_all(user_data)

    # puts "error件数#{error_count}"
  end
end