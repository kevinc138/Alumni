class Alumnu < ActiveRecord::Base


def self.to_csv(options ={})
	CSV.generate(options) do |csv|
		csv << column_names
		all.each do |alumnu|
			csv << alumnu.attributes.values_at(*column_names)
		end
	end
end

def accessible_attributes
	["firstname","lastname","gradyear","email","major","address"]
end

def self.import(file)
		#CSV.foreach(file.path, headers: true) do |row|
			#Alumnu.create! row.to_hash


  	spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  		(2..spreadsheet.last_row).each do |i|
   			row = Hash[[header, spreadsheet.row(i)].transpose]
   			alumnu = find_by_id(row["id"]) || new
    			alumnu.attributes = row.to_hash.slice(*row.to_hash.keys)
    			alumnu.save!
  		
	end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::CSV.new(file.path)
  when ".xls" then Roo::Excel.new(file.path)
  when ".xlsx" then Roo::Excelx.new(file.path)
  else raise "Unknown file type: #{file.original_filename}"
  end
end

end
