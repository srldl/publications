# Default url mappings are:
# 
# * a controller called Main is mapped on the root of the site: /
# * a controller called Something is mapped on: /something
# 
# If you want to override this, add a line like this inside the class:
#
#  map '/otherurl'
#
# this will force the controller to be mounted on: /otherurl.

#require pp

class MainController < Controller

  #Select available publications submitted or drafts 
  def index
    @publications = ['Polar bears in the mist', 'Arctic foxes in the mist', 'Sea gulls in the mist']
  end

  def create
     puts "-------------create-----------------"
     form = request.params
     #pp form
     redirect("../index2"){|uri| uri.scheme = 'http'}
  end

  #Select publication type
  def index2
    @publication_category = ['Peer-reviewed publications', 'Book and book chapters', 'PhD thesis', 'Master thesis', 'Proceedings', 'Abstracts', 'Posters', 'Report series', 'Brief report series', 'Popular science']
  end

  def publications

    #Get selected choice
    @publication_category = request.params['publication_category']
    
    #Redirect to fitting url
    case @publication_category 
    when 'Peer-reviewed publications'
        redirect("../sci_papers"){|uri| uri.scheme = 'http'}
    when 'Book and book chapters'
        redirect("../books"){|uri| uri.scheme = 'http'}
    when 'PhD thesis'
        redirect("../phd_thesis"){|uri| uri.scheme = 'http'}
    when 'Master thesis'
        redirect("../master_thesis"){|uri| uri.scheme = 'http'}
    when 'Proceedings'
        redirect("../proceedings"){|uri| uri.scheme = 'http'}
    when 'Abstracts'
        rendirect("../abstracts"){|uri| uri.scheme = 'http'}
    when 'Posters'
        redirect("../posters"){|uri| uri.scheme = 'http'}
    when 'Report series'
        redirect("../report_series"){|uri| uri.scheme = 'http'}
    when 'Brief report series'
        redirect("../brief_report_series"){|uri| uri.scheme = 'http'}
    else #'Popular science'
        redirect("../popular_sci"){|uri| uri.scheme = 'http'}
    end 
  end

 
end
