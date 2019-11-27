---
title: ITSA end-to-end service guide
weight: 1
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Income Tax Self Assessment end-to-end service guide

Version 3.0 issued XX November 2019
***

This service guide is to help software designers and vendors understand how their software fits in with HMRC APIs.
It covers elements of the service delivered by HMRC to show how the Income Tax end-to-end service works.

Product owners, developers and business analysts can also use this guide to learn more about Making Tax Digital for Income Tax Self Assessment (ITSA).

## Overview

Making Tax Digital for Income Tax is a service that will improve Self Assessment for the 7 million businesses that currently submit a tax return.
 
Like MTD for VAT, MTD for Income Tax requires businesses and landlords to keep their records digitally and submit information about business income to HMRC using MTD-compatible software. Instead of an annual tax return, businesses and landlords will be required to send HMRC a quarterly summary update of their business income and expenditure with a finalisation process at the end of the year. They will receive a view of their emerging tax position based on the information provided, helping them budget for their tax better throughout the year. There are no changes to payment dates.
 
Customers will be mandated to provide the following information through software:

* providing information about income and expenses for each self-employment and property businesses at least every 3 months.
* provide information about allowances and adjustments for each self-employment and property business at least once a year, at the end of the accounting period
* finalising each of those income sources with an End of Period Statement (EoPS)
* and later partnerships to provide information mentioned above for the partnership, individual partners will not be mandated to report the income as part of MTD but will have to as part of their final tax return
 
HMRC are also providing the APIs for software to support a customer’s full self-assessment journey, including providing personal data and the final tax return. Although these elements will not be mandated through software, there will be demand for software that enables all users to finalise the entirety of their tax affairs.
 
By developing a product now, you will support mandation of the service, influence its design and ensure you have a product ready for the millions of business and agents that will need MTD compatible software.

## Software vendor overview

to be populated after meeting in Shipley 26/27th November 

## Terms of use

Your application must comply with our [terms of use](https://developer.service.hmrc.gov.uk/api-documentation/docs/terms-of-use). You must accept the terms of use before we issue your application’s production credentials.

## Software choices

HMRC publishes a [list of compatible software](https://www.tax.service.gov.uk/making-tax-digital-software) for Making Tax Digital for Income Tax on GOV.UK. HMRC will add software vendors to this list when they have completed the necessary steps in the ‘Software vendor overview’ section. 

From our experience with VAT, businesses, agents and 3rd parties will use this as the definitive list of MTD compatible software. All software listed on the page must allow the user to submit a summary of business and/or property information up to and including the End of Period Statement. 

The current flat text list will be developed over time in line with user needs, including filters that help users to find appropriate software. 

HMRC expects demand for products that serve all of the requirements of MTD, including keeping the required digital records for business and/or property income and the ability to submit all relevant non-business information to HMRC. 

HMRC has committed to the availability of free software for the simplest businesses, as set out here: 

https://www.gov.uk/government/publications/making-tax-digital-software-suppliers-terms-of-collaboration/terms-of-collaboration-between-hm-revenue-and-customs-and-software-developers#Annex-C 



## End-to-end journey

ADD LINKS TO CONTENT WHEN AVAILABLE

## Related API documentation
<!--- Section owner: MTD Programme --->

  * [Income Tax (MTD) REST API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api?filter=income-tax)
  * [Create Test User API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/api-platform-test-user/1.0)
