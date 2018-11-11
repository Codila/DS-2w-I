import scrapy
from SfDR.items import SfScrap
from datetime import datetime
import re


class SfScraping(scrapy.Spider):
	name = "my_scrapy"
	start_urls = ["https://hivdb.stanford.edu/cgi-bin/NewSubmissions.cgi"]
	def parse(self, response):
		url= "https://hivdb.stanford.edu/cgi-bin/NewSubmissions.cgi"
		yield scrapy.Request(url, callback=self.parse_dir_contents)	
				
	def parse_dir_contents(self, response):
		item = SfScrap()
		tables = response.xpath('//*[@class="data"]')
		for table in tables:
			for row in table.xpath('//tr')
		# Getting Campaign Title
		
	
	
	
	 def start_requests(self):
        urls = ['https://hivdb.stanford.edu/cgi-bin/NewSubmissions.cgi']
		            
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)
 
    def parse(self, response):
		tables = response.xpath('//*[@class="data"]')
		for table in tables:not
			item= table.xpath('tr//td//text()').extract()[0]
			yield item
                
					   
				
#for row in table.xpath('//tr')
#'paper'	 : row.xpath('td//text()').extract()[1],
#'group'  : row.xpath('td//text()').extract()[4]