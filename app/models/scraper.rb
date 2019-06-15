class Scraper
	attr_accessor :request_id, :criteria

	def	initialize (request, criteria)
		@reqest = request
		@criteria = criteria
	end

	def process_request (params)
		get_jobs (params)
		clean_jobs (@criteria)
	end

	def get_jobs (params)
		params[:page] = "0"
		doc = Nokogiri::HTML(open(format_link(params)))
		pages = get_pages(doc)
		for i in 0...pages do
			page = i * 50
			params[:page] = page.to_s
			doc = Nokogiri::HTML(open(format_link(params)))
			get_data(doc)
		end
		binding.pry
	end

	def format_link(params)
		"https://www.indeed.ca/jobs?as_and=#{params[:include].join('+')}&as_phr=#{params[:title].gsub(' ','+')}&as_any=&as_not=#{params[:exclude].join('+')}&as_ttl=&as_cmp=&jt=fulltime&st=&as_src=&salary=&radius=5&l=Toronto%2C+ON&fromage=any&limit=50&sort=date&psf=advsrch&filter=0&start=#{params[:page]}"
	end

	def get_data(doc)
		doc.search(".jobsearch-SerpJobCard").each do |job|
			attribs = {}
			attribs[:title] = job.css(".title").text.strip
			attribs[:company] = job.css(".company").text.strip
			attribs[:summary] = job.css(".summary").text.strip
			attribs[:link] = "https://ca.indeed.com/viewjob?jk=" + job['id'].split('_')[1]
			attribs[:request_id] = @request_id
			attribs[:source] = "indeed"
			attribs[:tipe] = "full-time"
			attribs[:city] = "Toronto"
			attribs[:province] = "Ontario"
			attribs[:country] = "Canada"
			attribs[:criteria] = @criteria
			@reqest.jobs << Job.create(attribs)
		end
	end

	def get_pages(doc)
		(doc.search("#searchCount").text.strip.gsub("Page 1 of ","").gsub("jobs","").strip.to_i / 50.00001 + 1).to_i
	end

	def clean_jobs (criteria)
		binding.pry
		jobs = @reqest.jobs.where(criteria: criteria)
		jobs = jobs.select{|a|!a.title.include?(criteria)}
		jobs.each{|a|a.destroy}
		binding.pry
	end



end