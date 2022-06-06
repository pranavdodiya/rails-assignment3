module BooksHelper
    def auth_helper()
        @author_option=[]
        Author.select('id', 'name').all.each { |x| @author_option << [ x.name,x.id] }
        return @author_option
    end
end
