class Book < ActiveRecord::Base
  
  require 'csv'
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      
      book_hash = row.to_hash
      book = Book.where(id: book_hash["id"])
      
      if book.count == 1
        book.first.update_attributes(book_hash)
      else
        Book.create!(book_hash)
      end
    end
  end
  
end
