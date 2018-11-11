# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.
import scrapy
from SfDR.items import SfScrap
from datetime import datetime
import re


class SfScraping(scrapy.Spider):
	name = "my_scraper"
	start_urls = ["https://hivdb.stanford.edu/cgi-bin/NewSubmissions.cgi"]
	def parse(self, response):
		url= "https://hivdb.stanford.edu/cgi-bin/NewSubmissions.cgi"
		yield scrapy.Request(url, callback=self.parse_dir_contents)	
				
	def parse_dir_contents(self, response):
		item = SfScrap()

		# Getting Campaign Title
		i=0
		while i<1000:
			item['paperTitle'] =  response.xpath("//td/text()").extract()[i]
			i=i+4
			yield item	
	