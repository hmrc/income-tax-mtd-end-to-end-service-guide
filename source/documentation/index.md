# Income Tax (Making Tax Digital) end-to-end service guide

Version 3.0 issued June 2023


**Note:** This guide is currently under review to ensure it meets the needs of software providers. See the [changelog](#changelog) for latest updates.

***

This service guide describes HMRC’s Making Tax Digital (MTD) for Income Tax and explains how developers can connect their software to the MTD APIs.

## Overview

MTD for Income Tax is a service that enables businesses and landlords to keep their records digitally and submit information about their business income to HMRC using MTD-compatible software.

Instead of sending an annual tax return, businesses and landlords will be required to send HMRC quarterly summary updates of their business income and expenditure and complete a process to finalise their overall tax position at the end of the year.

Based on the information provided, they will receive a view of their emerging tax position, helping them to better budget for their tax throughout the year.

There are no changes to payment dates.


Businesses and landlords must provide the following information through the software:

* income and expenses for each self-employment and property businesses at least every 3 months
* allowances and adjustments for each self-employment and property business at least once a year, at the end of the accounting period
* finalisation of business income sources with an End of Period Statement (EOPS)

## Tax Terminology

### Obligations

Obligations are a set of date periods for which a customer must provide summary income and expense data.

Each obligation has a start date and an end date which together define the obligation period. For MTD, each business has multiple obligations which are based on its accounting period.

Please note – it may take up to an hour for a change to an obligation to be updated within HMRC systems.

### Update period
A period of time within an obligation, for which the customer can submit summarised income and expense data.

An update period might be a single day or the duration of the whole obligation period. Data may be provided as a single update covering the whole period, or as multiple, smaller updates.

### Annual summary
An annual summary is defined as a set of summary data for a tax year, containing allowances and adjustments broken down by category.

### End of period statement
End of period statement (EOPS) is the process that allows the customer to finalise their business income.

A customer must complete an EOPS for each source of business income (the equivalent of the current SA103, SA105 and SA106 forms). For example, if a customer has a self-employment business and a property business then they will have to complete two EOPS, one for each source of income.

The EOPS is linked to the accounting period for each source of income and cannot be completed until the end of the accounting period. However the customer does not need to complete it until 31st January Year 2.

### Final declaration
This is the process that allows the customer to finalise their end of year position. This includes any business and personal data they need to provide to HMRC to reach their final tax liability for a specific year.

Before starting the final declaration journey the software package will need to ensure that, for the relevant tax year the customer:

* has finalised EOPS for all their businesses (self-employment, uk-property and foreign-property)
* has already provided their entire income e.g. interest, dividends, other SA schedules
* does not have any additional information to provide

## Making Tax Digital APIs
This service guide explains how you can integrate your software with the [Income Tax (Making Tax Digital) APIs](https://developer.service.hmrc.gov.uk/api-documentation/docs/api?filter=income-tax). 


## Software provider overview

HMRC expects software providers to offer customers the ability to finalise their overall tax position using the software. This process is sometimes called final declaration.

In the future, partnerships will be required to provide the information mentioned above for the partnership. Individual partners will not be mandated to report their partner income quarterly.

HMRC will provide the APIs for the software to support all of the personal data items that need to be submitted under Self Assessment. Although these elements will not be mandated through the software, there will be market demand for software that enables any user to finalise the entirety of their tax affairs.

By developing a product now, you will support mandate of the service, influence its design and ensure you have a product ready for the millions of customers that will need MTD-compatible software.

### Developer journey to production credentials

It is important that quality software products are available for customers to submit their self-assessment returns through Making Tax Digital. HMRC is committed to providing help and support for software providers and developers throughout the software development process.

Here, we describe the steps developers go through from initially registering an application to gaining production credentials to submitting live data and also the support available at each stage and the interactions developers will have with HMRC.

1.	Sign in to the [developer hub](https://developer.service.hmrc.gov.uk/api-documentation) and register your application for sandbox testing.
2.	Review the API documentation and Income Tax end-to-end service guide.
3.	Test ITSA endpoints and develop your software application, any queries during this phase should be sent to <SDSTeam@hmrc.gov.uk>.
4.	Register your application for production credentials by creating a production application within your developer hub account and completing the requested sections.
5.	Testing document is sent to the developer by email.
6.	Provide testing logs and credentials used for testing to HMRC.
7.	Developer testing is reviewed by HMRC (including fraud header validity).  If testing is satisfactory an email questionnaire and request for product demonstration are sent. Otherwise, further testing and development will be required for review.
8.	The software vendor demonstrates its software to HMRC over online screen sharing.
9.	Production credentials are issued if all requirements are met or further development is required and a new demonstration needs to be organised.
10.	Software is listed on GOV.UK after going through the HMRC recognition process.

## Production approvals process for Making Tax Digital for Income Tax Self Assessment

Our key objectives for MTD for Income Tax are to:

* ensure customers have a streamlined end-to-end journey and software that supports everything a business customer needs to do to meet their Income Tax obligations
* safeguard customer data and protect HMRC systems against fraud and criminal attack

This section of the guide explains the features your product must include before production credentials are sought, together with features you should consider building into your products.

### Fraud Prevention Headers

You must supply fraud prevention header information for all our APIs before approval can be granted and production credentials issued.

HMRC must see evidence of fraud prevention headers being sent and be satisfied as to their level of accuracy.

The developer must test their fraud prevention headers and provide SDST with screenshot evidence that the correct response is received from the Test Fraud Header API. [Guidance on Fraud Prevention Headers](https://developer.service.hmrc.gov.uk/guides/fraud-prevention/) is available.

### Minimum functionality standards

Previously, the production approvals process included an assessment of whether a product includes certain minimum functionality.

In response to developer feedback, we are content for software developers to build MTD Income Tax products iteratively and be granted production credentials for specific elements of the minimum required functionality. However, an MTD Income Tax product will only be listed on the software choices viewer when it satisfies all the requirements listed below.

The minimum required functionality is as follows:  

* A software product must submit the fraud prevention header data required by law.
* A Making Tax Digital for Income Tax product must allow the customer to;
* Create and maintain all business records a customer is required by law to keep in digital form (but see below regarding bridging software)
* Submit quarterly update information for each business income source (self-employment, multiple self-employments, UK property income)
* Have the option to provide accounting and other adjustments and an estimate of allowances to be claimed for any business income source
* Submit an End of Period Statement for each business income source (with declaration of completeness)
* Call for and view an estimate of their Income Tax liability for each tax year at any time
* Make a self-assessment of the tax and Class 4 National Insurance contributions due on their total taxable income and a final declaration of completeness and correctness no later than 31 January following the end of tax year in which that income is taxable
* Carry forward or set sideways (when permitted) business losses occurring in any one year as well as to apply losses incurred in earlier years against current year profits
* Have visibility of all their Class 2 National Insurance contributions (so that they can make additional voluntary contributions if they wish)
* The Making Tax Digital for Income Tax APIs that include the endpoints for the functionality described above are:
    * [Business Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api/)
    * [Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api/)
    * [Business Income Source Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-biss-api/)
    * [Individuals Business End of Period Statement](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-business-eops-api/)
    * [Individual Calculations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api)
    * [Individual Losses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api)
    * [Individuals Disclosures (Class 2 NIC’s)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api)
    * [Business Source Adjustable Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api)
   
   

### Bridging software

Some customers may wish to integrate their existing software solution for digital record keeping with another product that can submit quarterly updates and the End of Period Statement, view tax liabilities, make a self assessment and final declaration and so on. We generally refer to these products as bridging products. It is unclear at this time if developers plan to offer such a product. If they do, then in order to be granted production credentials it must be digitally linked to software which allows customers to maintain business records required by law.

### Non-MTD products

Software products who wish to selectively use Making Tax Digital for Income Tax APIs and not build a Making Tax Digital product will have to submit a business case, justifying use of a particular or multiple API’s. Such products may be granted production credentials at HMRC discretion.

### Testing requirements

The following endpoints are required to be tested to cover the self-employment reporting:

1.	[Create a test user which is an organisation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/api-platform-test-user/1.0/oas/page#tag/create-test-user/operation/Createatestuserwhichisanorganisation) to create test data.
2.	‘Add a self-employment business’ endpoint to create an MTD
subscription for an individual within the sandbox environment.
3.	[Retrieve Income Tax (Self Assessment) Income and Expenditure Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api/2.0/oas/page#/paths/~1obligations~1details~1%7Bnino%7D~1income-and-expenditure/get) to return obligation
periods (this will return a canned response the sandbox).
4.	[Create a Self-Employment Period Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Period-Summaries/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1period/post) to make a submission.
5.	[Amend a Self-Employment Period Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Period-Summaries/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1period~1%7BperiodId%7D/put) to amend a submission
already made.
6.	[Create and Amend Self-Employment Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/put) to create or amend annual
summary information.
7.	[Trigger a Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/4.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) to request a calculation.
8.	[Retrieve a Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/4.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) to return the calculation liability (this will return a canned response from the sandbox).

    The following endpoints are to be tested to cover EOPS (End of Period Statement) and final declaration:

9.	[Submit End of Period Statement for a Business](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-business-eops-api/2.0/oas/page#/paths/~1individuals~1business~1end-of-period-statement~1%7Bnino%7D/post) to finalise your self- employment income. (Developers must also build the facility for a user to make a declaration of correctness and completeness in relation to the EOPS)
10.	[Retrieve Income Tax (Self Assessment) End of Period Statement Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api/2.0/oas/page#/paths/~1obligations~1details~1%7Bnino%7D~1end-of-period-statement/get) to check if an EOPS obligation has been fulfilled, this will return a canned response in the sandbox.
11.	‘Intent to crystallise’ to return the tax Calculation ID for final declaration.
12. [Retrieve a Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/4.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) with the tax Calculation ID for final declaration, to return the calculation liability. This will return a canned response in the sandbox.
13.	‘Final declaration’ to finalise the tax liability. (Developers must also build the facility for a user to make a declaration of correctness and completeness when making the final declaration.)

Once the testing is complete, send details of the dummy NINO (National Insurance Number) used to call the above endpoints in the sandbox to the SDS team at <SDSTeam@hmrc.gsi.gov.uk>.

You must contact us within 2 weeks of completing your API testing to enable us to view the data within our logs.
It takes 10 working days to advise of the outcome. If the testing is satisfactory a product demonstration will be arranged.

Developers need to:

* build functionality to allow business customers to report income from non-business sources
* consider the one-hour delay as part of the software workflow to update the status of obligations
* consider a 5 second delay before retrieving the calculation
* consider developing guidelines within the software for relevant users, including a reference to HMRC user interface journeys for customers and agents
* use APIs as efficiently as possible to prevent hitting the rate limit
* build relevant error responses so that the software can deal with exceptions
* when authorising software, the correct MTD gateway credentials or agent services credentials, need to be used when logging into the system
* consider providing notifications to customers when periodic submissions are due

#### Example workflows for self-employment

Example workflows for self-employment

1. Create an update
    1. [List all businesses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api/1.0/oas/page#/paths/~1individuals~1business~1details~1%7Bnino%7D~1list/get).
    2. [Create a Self-Employment Period Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Period-Summaries/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1period/post).
    3. [Trigger a Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/4.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) - can be triggered anytime but must be triggered at the end of the quarter to meet the obligation.
2. Amend an update
    1. [List Self-Employment Period Summaries](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Period-Summaries/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1period/get).
    2. [Amend a Self-Employment Period Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Period-Summaries/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1period~1%7BperiodId%7D/put).
    3. [Submit End of Period Statement for a Business](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-business-eops-api/2.0/oas/page#/paths/~1individuals~1business~1end-of-period-statement~1%7Bnino%7D/post).
    4. [Retrieve a Self-Employment Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/get).
    5. [Create and Amend Self-Employment Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/put).
    6. [Retrieve a Business Income Source Summary (BISS)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-biss-api/2.0/oas/page#/paths/~1individuals~1self-assessment~1income-summary~1%7Bnino%7D~1%7BtypeOfBusiness%7D~1%7BtaxYear%7D~1%7BbusinessId%7D/get).
    7. [Retrieve Income Tax (Self Assessment) End of Period Statement Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api/2.0/oas/page#/paths/~1obligations~1details~1%7Bnino%7D~1end-of-period-statement/get).
    8. Agree with the declaration within the software.
    9. [Submit End of Period Statement for a Business](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-business-eops-api/2.0/oas/page#/paths/~1individuals~1business~1end-of-period-statement~1%7Bnino%7D/post).
3. Final declaration
    1. Intent to crystallise.
    2. [Retrieve a Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/4.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) - to view the current calculation.
    3. Agree with the declaration within the software.
    4. Make a final declaration - agree on the final calculation.


### Product Demonstration

The product demonstration is the final part of the process after all preceding steps have been completed. Make sure you have completed the <a href="documentation/mtd-itsa-sa-demo-checklist-self-serve.docx" download>pre-demo checklist</a> before the demonstration.

At the product demonstration HMRC expects to see a consumer-ready product and see software go through the following process flows:

1. New customer registers with the software and sets up an account.
2. Customer authorises software (OAuth 2.0 journey).
3. Customer views obligations and his or her status.
4. Customer digitally imports data into the appropriate periodic update and submits information.
5. Software triggers a calculation and replays to customer.
6. End of Period Statement (EOPs) and declaration.
7. Customer final declaration - the appropriate display of the tax calculation, declarations, and error messages.

## Terms of use

You must comply with our [terms of use](https://developer.service.hmrc.gov.uk/api-documentation/docs/terms-of-use). You must accept the terms of use before we can issue you with production credentials.

## Software choices

HMRC publishes a [list of compatible software](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax) for Making Tax Digital for Income Tax. Software providers will be added to this list when they have completed the necessary steps in the ‘Software provider overview’ section.  

From our experience with MTD VAT, businesses, agents and software providers will use this as the definitive list of MTD compatible software. All software listed on the GOV.UK page must allow the user to submit a summary of business or property information up to and including the End of Period Statement, and also offer users the ability to finalise their tax affairs using the software. The current GOV.UK page will be developed over time to meet user needs, including filters that help users to find software.

HMRC expects demand for products that serve all of the requirements of MTD, including keeping the required digital records for business or property income and the ability to submit all relevant non-business information to HMRC.

### Free-to-use software

The government has committed to the availability of free software for small businesses mandated to use MTD for income tax. HMRC strongly encourages all developers to consider producing a free version of their MTD for Income Tax product for this customer group.

By ‘small businesses’ we mean that eligibility for free software will apply where the business meets all of these conditions:

* it is unincorporated (for example self-employed persons or landlords)
* it has turnover within the scope of Income Tax below £85,000
* it has no employees
* it uses cash basis accounting

For the avoidance of any doubt, there is no expectation that a free product will include VAT, Corporation Tax or PAYE functionality.

In addition to the minimum standards set out in the terms of use, and the general functionality standards applicable to all MTD for Income Tax software, we expect any free software product you provide to small businesses to:

* enable the provision of a dataset that correlates to the current [SA103S self-employment supplementary page (short)](https://www.gov.uk/government/publications/self-assessment-self-employment-short-sa103s)
* enable the provision of a dataset that correlates to the current [SA105 UK property](https://www.gov.uk/government/publications/self-assessment-uk-property-sa105) or [SA106 foreign property](https://www.gov.uk/government/publications/self-assessment-foreign-sa106) pages, where the number of properties does not exceed one
* provide a reasonable level of guidance, help and support to users (HMRC is open to views on what might be ‘reasonable’ for a free product and will publish further advice on this in due course)
* allow the end user to own and have access to all their records created using the software product (past and present) to enable them to retrieve data and promptly export it if necessary
* be free for the business to use to comply with their MTD for Income Tax obligations for a full annual accounting period on the understanding the business continues to meet the eligibility criteria below

HMRC would not require free software to link or integrate with an Agent product.

## Finalise business income End of Period Statement (EOPS)

### Business or Agent able to submit End of Period Statement through software

This is the process that allows the customer to finalise the profit or loss for any one source of business income.

An EOPS must be completed for each source of business income the customer has (similar to the current Income Tax process for the SA103, SA105 and SA106 schedules). For example, if a customer has one self-employment business and one property business they will have to complete two EOPS.

EOPS relates to the accounting period or basis period for each source of business income and cannot be completed before the end of that period.

Customers may complete their EOPS at any point after the end of the accounting period and do not have to wait until the 31 January deadline. This helps customers manage their business income in line with the business accounts. However, the deadline to complete is 31 January, Year 2.

The process will take into account all the periodic and annual data already provided by the customer throughout the year.

Customers must make sure they are confident with the information they have provided and add any additional information they have. This is likely to include tax and accounting adjustments, allowances or reliefs.

### EOPS process

<!--- some endpoints below are deprecated, need to update with equivalents -->

1. The customer inputs information about allowances and adjustments for the business income source. They can provide this information throughout the year, but must do it before they complete the EOPS.
2. Depending on the business income type you need to submit, the software calls the [Retrieve a Self-Employment Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/get), [Retrieve a Historic Non-FHL UK Property Business Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/property-business-api/2.0/oas/page#tag/Historic-non-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1non-furnished-holiday-lettings~1%7Bnino%7D~1%7BtaxYear%7D/get)
or [Retrieve a Historic FHL UK Property Business Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/property-business-api/2.0/oas/page#tag/Historic-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1furnished-holiday-lettings~1%7Bnino%7D~1%7BtaxYear%7D/get). This step is optional, but we recommend it to ensure you are getting the most up-to-date information.
3. The customer views the allowances and adjustment information and updates relevant information.
4. Depending on the business income type you need to update, the software submits information using the [Create and Amend Self-Employment Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-employment-business-api/2.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/put),
[Create and Amend a Historic Non-FHL UK Property Business Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/property-business-api/2.0/oas/page#tag/Historic-non-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1non-furnished-holiday-lettings~1%7Bnino%7D~1%7BtaxYear%7D/put) or [Create and Amend a Historic FHL UK Property Business Annual Submission](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/property-business-api/2.0/oas/page#tag/Historic-FHL-UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1annual~1furnished-holiday-lettings~1%7Bnino%7D~1%7BtaxYear%7D/put).
5. HMRC receives and stores information
6. The software calls the [Trigger a Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/4.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint to get the calculation.
7. HMRC receives the request and returns a Calculation ID (calculationId) software must use this when calling the Self Assessment Tax Calculation endpoints.
8. The software receives the calculationId. Note: you could display the calculation to customers at this point if you choose, if you do follow steps 20 and 21 in the periodic update section.
9. The customer wants to make some accounting adjustments following the business accounts being finalised.
10. The software calls the [BSAS API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api).
11. HMRC returns summary totals of all the information for that business income source.
12. The software displays information to the customer.
13. The customer makes adjustments, confirms and submits.
14. The software sends information to HMRC using the [BSAS API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api).
15. HMRC confirms receipt and stores the information.
16. The software calls the relevant endpoints to retrieve the calculation.

Note: the Tax Calculation can take up to 5 seconds to run, so we recommend the software waits 5 seconds – this is optional, the software does not have to retrieve the tax calculation information at this point.

* [List Business Source Adjustable Summaries](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D/get)
* [Trigger a Business Source Adjustable Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1trigger/post)
* [Retrieve a Self-Employment Business Source Adjustable Summary (BSAS)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#tag/Self-employment-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1self-employment~1%7BcalculationId%7D/get)
* [Submit Self-Employment Accounting Adjustments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#tag/Self-employment-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1self-employment~1%7BcalculationId%7D~1adjust/post)
* [Retrieve a UK Property Business Source Adjustable Summary (BSAS)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#tag/UK-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1uk-property~1%7BcalculationId%7D/get)
* [Submit UK Property Accounting Adjustments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#tag/UK-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1uk-property~1%7BcalculationId%7D~1adjust/post)
* [Retrieve a Foreign Property Business Source Adjustable Summary (BSAS)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#tag/Foreign-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1foreign-property~1%7BcalculationId%7D/get)
* [Submit Foreign Property Accounting Adjustments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api/3.0/oas/page#tag/Foreign-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1foreign-property~1%7BcalculationId%7D~1adjust/post)

## Final declaration

Final declaration brings together all the data that a customer needs to provide to HMRC to reach their final tax liability for a specific year. Using this process allows the customer to finalise their tax position for any one tax year, taking into account all sources of chargeable income and gains, whether business income or otherwise.

It is also the process by which most formal claims for reliefs and allowances and any deductions will be made, where these were previously included within a Self Assessment tax return.

Customers are able to tell us at this point (subject to the existing limits) how they wish any losses available to them to be treated.

Customers can make a final declaration from 6 April Year 1. The deadline for final declaration is 31 January Year 2. The software should remind customers to help them to meet this deadline.

We suggest that you retrieve the self-assessment metadata first to check there are no validation errors.

If there are errors the calculation will not have been generated. To view the error messages, call the retrieve self assessment tax calculation endpoint.

The customer must go back and amend the digital records. The software should resubmit the revised summary totals for the relevant periods, then call the intent to crystallise endpoint again.


## End-to-end user journey

These journeys show examples of use:

* [Income Tax Self Assessment (ITSA) set up activities](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/signup.html)
* [retrieving obligations](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/businessandpropertyincome.html#retrieving-obligations)
* [submitting periodic updates for Self Employment and property businesses](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/businessandpropertyincome.html#submit-income-and-expense-updates-for-self-employment-and-property-businesses)
* [submitting annual updates for Self Employment and property businesses](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/businessandpropertyincome.html#submit-allowance-and-adjustment-updates-for-se-and-property-businesses)
* [retrieving a tax calculation](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/businessandpropertyincome.html#retrieve-a-tax-calculation)
* [making changes to previously submitted data](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/businessandpropertyincome.html#making-changes-to-previously-submitted-data)
* [finalising business income End of Period Statement (EOPS)](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/businessandpropertyincome.html#finalise-business-income-end-of-period-statement-eops)
* [providing information about how to treat a loss](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration-crystallisation.html#providing-information-about-how-to-treat-a-loss)
* [making a final declaration](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration-crystallisation.html#final-declaration)
* [ITSA (MTD) close down activities](https://developer.service.hmrc.gov.uk/guides/income-tax-mtd-end-to-end-service-guide/documentation/closedown.html)

## Related API documentation

<!--- Section owner: MTD Programme --->
* [Create Test User API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/api-platform-test-user/1.0)
* [Test Fraud Prevention Headers API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/txm-fph-validator-api/1.0)
* [Agent Authorisation REST API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/agent-authorisation-api/1.0)

## Changelog

The full changelog for Income Tax MTD APIs is now at [https://github.com/hmrc/income-tax-mtd-changelog](https://github.com/hmrc/income-tax-mtd-changelog) - that is the best source for detailed and comprehensive information about API changes.

Below is a summary of significant updates to this service guide:

Version 3.0

* Updated API and endpoint links.

Version 2.9

* Updated direct links to endpoints to reflect changes in how API documentation is published

Version 2.8

* Updated HMRC Assist section

Version 2.7

* Updated guide to reflect simplified v3.0 Final Declaration process and update section on customers opting out of MTD. 

Version 2.6

* Updated guide to reflect API changes including refactored Self Assessment Accounts API.

Version 2.5

* Updated guide to reflect new API versions, update links and correct and clarify some content.

Version 2.4

* Updated Frequently Asked Questions section to remove some items.

Version 2.3

* Added note and an example table demonstrating how adjustments submitted work

Version 2.2

* Added a Frequently Asked Questions section to the menu tree

Version 2.1

* Notice of version change to Business Income Source Summary V1.0
* "Set up" heading replaced by "Sign up" with the menu tree updated to only have three sections: **Agent**, **Individual** and **Link software to HMRC**.
* Updated content in the **Minimum functionality standards** section with two other sections added: **Bridging software** and **Non-MTD products**
* Updated content in the **Declaration** and **Declaration for agents** sections of **Final declaration** (previously called "crystallisation")

Version 2.0

* Addition of Capital Gains Tax, Marriage Allowance, Non-PAYE Income, Coding out underpayments and debts.

Version 1.9

* Addition of requirement for businesses and landlords to provide information about residential property disposals
* Addition of information regarding BSAS adjustments
* Addition of content changes to meet MTD Style Guide V2.2
* Replacing the term ‘crystallisation’ with ‘final declaration'

Version 1.8

* Addition of deprecation dates for Self Assessment API Endpoints
* Notice of version change to Business Source Adjustable Summary (MTD) - V 1.0
* Notice of version change to Individual Losses (MTD) - V1.0
* Notice of version change to Individual Calculations v 1.0

Version 1.7

* Change of title to Income Tax (Making Tax Digital) end-to-end Service Guide
* Inclusion of Income Tax (MTD) APIs
* Inclusion of Tax Terminology
* Addition of Foreign Property reference to Obligations
* Replaced the term, ‘taxpayers’ with ‘customers’
* Replaced references to SA Accounting Summary API with BSAS API

Version 1.6

* Revised wording for Draft MTD ITSA Regulations 2021 page.

Version 1.5

* Production approvals process for Making Tax Digital for Self Assessment.
* Early draft MTD ITSA Regulations 2021 section added.

Version 1.4

* Construction Industry Scheme (CIS) section updated.

Version 1.3

* Losses updated.
* Additional income section added.

Version 1.2

* Multiple businesses section added.
* Construction Industry Scheme (CIS) section added.

Version 1.1

* Payments and Liabilities section added.
