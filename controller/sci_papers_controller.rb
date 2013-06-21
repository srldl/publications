class Sci_papersController < Controller

layout 'default'
require 'pp'
map '/sci_papers'


def index
end

def view_submit_index
end


def authors
    @author = ['Strom, Hallvar (NPI)', 'Steen, Harald (NPI)', 'Koc, Nalan (NPI)', 'Holmen, Kim (NPI)']
end

def authors_create
   puts "authors_create"
   form = request.params
   pp form
end

def publication
end

def publication_create
    puts "publication_create"
    form = request.params
    pp form
end


def publication_details    
end

def publication_details_create
    puts "publication_details_create"
    form = request.params
    pp form
end


def identificators
    puts "identificators -----"
    @pub_identificator = ['ISBN','ISSN']
end

def identificators_create
    puts "identificators_create"
    form = request.params
    pp form
end

def paper_upload
end

def paper_upload_create
    puts "paper_upload_create"
    form = request.params
    pp form
end



end
