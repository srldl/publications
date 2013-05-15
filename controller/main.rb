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

class MainController < Controller
  # the index action is called automatically when no other action is specified
  def index
    puts "kom til index----------------------------------"
    @title = 'NP Publications'
    @publication_category = ['Peer-reviewed publications', 'Book and book chapters', 'PhD thesis', 'Master thesis', 'Proceedings', 'Abstracts', 'Posters', 'Report series', 'Brief report series', 'Popular science']
  end

  def publications
    form = request.params
    puts form
    puts "kom til publications----------------------------------"
    @publication_category = form['publication_category']
    puts @publication_category
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

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'NP Publications'
    
    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end
end
