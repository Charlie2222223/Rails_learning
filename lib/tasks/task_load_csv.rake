# frozen_string_literal: true

require 'csv'

desc 'csvからデータを読み込みDBに追加する'
task load_csv: [:environment] do
  list = []
  CSV.foreach('db/csv/test.csv', headers: true) do |row|
    list << {
      department_id: 1,
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
      address5: row['address5'],
      birthday: row['birthday']
    }
  end
  begin
    User.create!(list)
    puts 'completed!!'
  rescue ActiveModel::UnknownAttributeError
    puts 'エラー発生：属性が不明です'
  end
end
