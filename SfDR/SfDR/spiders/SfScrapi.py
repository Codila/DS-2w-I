import scrapy


class BootstrapTableSpider(scrapy.Spider):
	name = "bootstrapt"
	
	
	def start_requests(self):
		urls = ['https://hivdb.stanford.edu/cgi-bin/NewSubmissions.cgi']
		for url in urls:
			yield scrapy.Request(url=url, callback=self.parse)
			
	def parse(self, response):
		rows= response.xpath('//*[@class="data"]//tr')
		for i in range(1,len(rows)):
			yield {
				'group' : rows[i].xpath('td//text()').extract()[4],
				'author' : rows[i].xpath('td//text()').extract()[0],
				'title' : rows[i].xpath('td//text()').extract()[1]
				
				}

