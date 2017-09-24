module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      required(:book).schema do
      required(:title).filled(:str?)
      required(:author).filled(:str?)
      end
    end

    def call(params)
      params.valid? ? create_book(params) : self.status = 422
    end

    def create_book(params)
      @book = BookRepository.new.create(params[:book])
      redirect_to routes.books_path
    end
  end

end
