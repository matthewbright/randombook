class BooksController < ApplicationController
  layout false
  
  def index
    @books = Book.all
  end

#  def show
#  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(:action => 'index')  
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to(:action => 'index')  
    else
      render('edit')
    end
  end
  
  def delete
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
  
  def import
    Book.import(params[:file])
    redirect_to(:action => 'index')
    #, notice: "Products imported."
  end
  
  private
  def book_params
    params.require(:book).permit(:author, :title, :isbn, :bib, :location, :call_no)
  end
  
  
end
