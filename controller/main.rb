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
require 'ramaze'
require 'pp'
require_relative '../lib/Server.rb'
require 'json'

class MainController < Controller
  map '/'
  helper :blue_form

  # the index action is called automatically when no other action is specified

  def index
  end

  # the publications 
  def publications
    @publication = Object.new
    @publication_process = ['Planned', 'In-press', 'Published']
    @publication_category = ['Peer-reviewed publications', 'Book and book chapters', 'PhD thesis', 'Master thesis', 'Proceedings', 'Abstracts', 'Posters', 'Report series', 'Brief report series', 'Popular science']
    @assistance_info_section = ""
    @pub_identificator = ['ISBN','ISSN']
    @journal = ['Nature', 'Science', 'Cryosphere', 'Biology']
    @author = ['Strom, Hallvar (NPI)', 'Steen, Harald (NPI)', 'Koc, Nalan (NPI)', 'Holmen, Kim (NPI)'] 
  end

  def edit
    server = Couch::Server.new("localhost","5984")
    res = server.get("/publications?revs=true")
    json = res.body
    puts "----start showing-------"
    puts json
  end

  def create
     form = request.params
     pp form
     pp "commit----------"
     
     @publication_category = form['publication_category']
     @dataset = form['dataset']
     @project = form['project']
     @published_year = form['published_year']
     @volume = form['volume']
     @issue = form['issue']
     @suppl = form['suppl']
     server = Couch::Server.new("localhost","5984")
     #server.put("/publications35", "")
     res = server.post("/publications", form.to_json)
     pp "---get id-------"
     #pp res.id  
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
  #  @title = 'Welcome to Ramaze!'
    
    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end
end
