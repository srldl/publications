class Sci_papersController < Controller

layout 'default'
map '/sci_papers'

def index
end

def view_submit_index
    puts "kom til view submit index---"
end


def authors
    @author = ['Strom, Hallvar (NPI)', 'Steen, Harald (NPI)', 'Koc, Nalan (NPI)', 'Holmen, Kim (NPI)']
end


def publication_details
    
end


def identificators
    puts "identificators -----"
    @pub_identificator = ['ISBN','ISSN']
end

end
