class ShowController < ApplicationController
#  layout false  
  def index
#    @books = Book.limit(6)
    # doesn't work in sqlite    @books = Book.limit(6).order("RAND()")
    ids = Book.pluck(:id).shuffle[0..5]
    @books = Book.where(id: ids)
  end
end
