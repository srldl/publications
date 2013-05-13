class Sci_papersController < Controller

layout 'default'
map '/sci_papers'

def authors

end

def publication_details
    

end

def authors
    @author = ['Strom, Hallvar (NPI)', 'Steen, Harald (NPI)', 'Koc, Nalan (NPI)', 'Holmen, Kim (NPI)']
end

def identificators
    puts "identificators -----"
    @pub_identificator = ['ISBN','ISSN']
end

end
