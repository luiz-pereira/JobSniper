class Scraper


	def scrape_indeed (params)
		binding.pry
		doc = Nokogiri::HTML(open(format_link(params)))
	end

	def format_link(params)
		"https://www.indeed.ca/jobs?as_and=#{params[:include].join('+')}&as_phr=#{params[:title].gsub(' ','+')}&as_any=&as_not=#{params[:include].join('+')}&as_ttl=&as_cmp=&jt=fulltime&st=&as_src=&salary=&radius=5&l=Toronto%2C+ON&fromage=any&limit=50&sort=date&psf=advsrch"
	end



end