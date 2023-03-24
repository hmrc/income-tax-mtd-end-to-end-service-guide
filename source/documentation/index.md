---
title: ITSA end-to-end service guide
weight: 1
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Income Tax (Making Tax Digital) end-to-end service guide

Version 2.6 issued December 2022
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
This service guide explains how you can integrate your software with the MTD APIs:

* Agent Authorisation   
* Business Details
* Business Income Source Summary
* Business Source Adjustable Summary
* CIS Deductions
* Individual Calculations
* Individual Losses
* Individuals Business End of Period Statement
* Individuals Charges
* Individuals Disclosures
* Individuals Expenses
* Individuals Income Received
* Individuals Reliefs
* Individuals State Benefits
* Obligations
* Other Deductions
* Property Business
* Self Assessment
* Self Assessment Accounts
* Self Employment Business

### Agent Authorisation API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/agent-authorisation-api/1.0) allows tax agents to request authorisation to act on a client's behalf for a specific Making Tax Digital (MTD) tax service and have the option to cancel the authorisation request.

The API also allows the agent to check the status of authorisations already requested and query active or inactive relationships.

This API has no effect on the existing XML API.

### Business Details API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api) allows a developer to list all businesses and retrieve additional information about the details of a user’s business.

### Business Income Source Summary API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-biss-api) allows a developer to retrieve a summary of income and expenditure for a specified self-employment, or property business for a given tax year.

**From 22 March 2022, this API will be at V2.0, and V1.0 will no longer be available.**

### Business Source Adjustable Summary API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api) allows a developer to retrieve a Business Source Adjustable Summary (BSAS) calculation for a specified self-employment or property business, for a given accounting period. Here a developer can:

* generate a list of BSAS
* generate an end of accounting period BSAS
* request a specific BSAS
* request the adjustments made to a specific self-employment BSAS
* provide accounting adjustments against a specified BSAS
* request the adjustments made to a specific property BSAS

**From 22 March 2022, this API will be at V3.0. On 14 April 2022, V2.0 was deprecated and cannot be subscribed to any longer. However, V2.0 can still be called if the subscription was made before this status change.**

### CIS Deductions API
Under the Construction Industry Scheme (CIS), contractors deduct money from a subcontractor’s payments and pass it to HM Revenue and Customs (HMRC).

The deductions count as advance payments towards the subcontractor’s tax and National Insurance.

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/cis-deductions-api) allows a developer to:

* retrieve details of the data the contractor has submitted to HMRC
* retrieve a list of CIS deductions
* create CIS deductions
* remove CIS deductions
* override previous CIS deductions (after the tax year has ended)

### Individual Calculations API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/2.0) allows a developer to:

* trigger a self-assessment tax calculation
* list all their self-assessment tax calculations for a tax year
* retrieve their self-assessment tax calculation result using multiple endpoints
* list self-assessment tax calculations for a given National Insurance number (NINO) and tax year
* trigger a self-assessment tax calculation for a given tax year - the result of the calculation can be explored via the “Retrieve a self-assessment tax calculation metadata” endpoint
* retrieve high-level calculation metadata for a given Calculation ID
* retrieve the calculated Income Tax and National Insurance contributions for a given NINO and Calculation ID
* retrieve the taxable income that has been used in the self-assessment tax calculation for a given NINO and Calculation ID
* retrieve the allowances, deductions and reliefs that exist for the self assessment tax calculation for a given NINO and Calculation ID
* retrieve the end-of-year Income Tax and National Insurance contribution estimates for a given NINO and Calculation ID
* retrieve “info”, “warning” and “error” level messages linked to a Calculation ID
* provide the customer's intent to make a final declaration, for which they will receive a Calculation ID
* submit final declaration for a tax year

Final declaration was previously called "crystallisation".
Before starting the final declaration journey, the software package will need to ensure that, for the relevant tax year, the customer:

* has finalised EOPS for all their businesses (self-employment, uk-property and foreign-property)
* has already provided their entire income e.g. interest, dividends, other SA schedules
* does not have any additional information to provide

**From 30 November 2021 this API will be at V2.0, and V1.0 will no longer be available.**

### Individual Losses API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api) allows a developer to provide financial data for their Brought Forward Losses and Loss Claims.

For Brought Forward losses a developer can:

* provide a list of brought forward losses
* create a new brought forward loss
* show a single brought forward loss
* delete an existing brought forward loss
* update an existing brought forward loss

For Loss claims a developer can:

* provide a list of loss claims
* create a loss claim against an income source for a specific tax year
* show the detail of an existing loss claim
* delete a previously entered loss claim
* update a previously entered loss claim

**From 22 March 2022, this API will be at V3.0, and V2.0 will no longer be available.**

### Individuals Business End of Period Statement API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-business-eops-api/1.0) allows a developer to submit a declaration that the submission data for a business is complete.

### Individuals Charges API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-charges-api) allows a developer to provide a customer’s financial data for their pension charges.

Here a developer can:

* retrieve pension charges
* create and amend pension charges
* delete pension charges

### Individuals Disclosures API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api) allows a developer to:

* create, amend, retrieve and delete data relating to an individual's disclosures
* create data relating to an individual’s Marriage Allowance

### Individuals Expenses API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-expenses-api) allows a developer to retrieve, amend and delete expenses for:

* income for trade union and patent royalties
* existing employment expenses

This API also allows a developer to ignore HMRC provided employment expenses for a user.

### Individuals Income Received API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-income-received-api) allows a developer to retrieve, create, amend or delete data relating to:

* employment income (this includes income from occupational pensions)
* other employment income
* Non-PAYE employment income
* Capital Gains on residential property disposal
* other Capital Gains and disposals
* dividends income
* foreign income
* insurance policies income
* pensions income
* savings income
* other income

This API also allows a developer to ignore or unignore an HMRC-provided employment from the list of employments for a user.

### Individuals Reliefs API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-reliefs-api) allows a developer to retrieve, create, amend or delete:

* relief investments
* other reliefs
* foreign reliefs
* pensions reliefs

### Individuals State Benefits API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-state-benefits-api) allows a developer to:

* list and retrieve state benefits
* create, amend or delete customer added state benefits
* create or amend benefits financial data
* mark a state benefit as ignored
* unignore a state benefit

Amendments to customer added state benefit or HMRC held state benefit must be made after the tax year has ended.

Amendments to Job Seekers Allowance (JSA) or Employment Support Allowance (ESA) may be made at any time.

### Obligations API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api) allows a developer to:

* retrieve obligations for a user's business income sources
* retrieve the final declaration obligations for a user's Income Tax account
* retrieve the End of Period Statement obligations for a user's business income sources

### Other Deductions API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/other-deductions-api) allows a developer to retrieve, create and amend, and delete deductions.

### Property Business API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/property-business-api) allows a developer to:

* list, retrieve, create or amend an individual’s UK property Income & Expenses Period Summaries
* retrieve, create, amend or delete an individual’s UK Property Annual Submissions
* list, retrieve, create or amend an individual's Foreign Property Income & Expenses Period Summaries
* retrieve, create, amend or delete an individual's Foreign Property Annual Summary

From December 2022, this API will provide separate production endpoints for submitting historic data for tax years from 2017-18 to 2021-22. See the API documentation for details.

**From 22 March 2022, this API will be at V2.0. On 14 April 2022, V1.0 was deprecated and cannot be subscribed to any longer. However, V1.0 can still be called if the subscription was made before this status change.**

### Self Assessment API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api) allows a developer to supply business and personal financial data to HMRC.<br>

**From 30 June 2021 the following endpoints will be deprecated:**

* [List all self employment businesses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_list-all-selfemployment-businesses_get_accordion)
* [Get a self employment business](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_get-a-selfemployment-business_get_accordion)
* [Retrieve a self employment business obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_retrieve-selfemployment-business-obligations_get_accordion)
* [Retrieve End of period statement obligations for a Self Employment Business](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_retrieve-end-of-period-statement-obligations-for-a-selfemployment-business_get_accordion)
* [Retrieve Final Declaration Obligation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#crystallisation_retrieve-crystallisation-obligations_get_accordion)

**From 30 November 2021 the following endpoints will be deprecated:**

* [Submit self employment end of period statement](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_submit-selfemployment-endofperiod-statement_post_accordion)
* [Submit UK property end of period statement](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#uk-property-business_submit-uk-property-endofperiod-statement_post_accordion)
* [Get a UK property business](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#uk-property-business_get-a-uk-property-business_get_accordion)
* [Retrieve all UK property business obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#uk-property-business_retrieve-all-uk-property-business-obligations_get_accordion)
* [Retrieve End of Period Statement Obligations for a UK Property Business](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#uk-property-business_retrieve-end-of-period-statement-obligations-for-a-uk-property-business_get_accordion)
* [Intent to submit final declaration](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#crystallisation_intent-to-crystallise_post_accordion)
* [Final declaration](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#crystallisation_crystallisation_post_accordion)

### Self Assessment Accounts API

[This API](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-accounts-api) allows a developer to:

* retrieve the overall liability broken down into overdue, payable and pending amounts
* retrieve a list of charges and payments for a given date range
* retrieve more detail about a specific transaction
* retrieve a list of charges made to an account for a given date range
* retrieve the history of changes to an individual charge
* retrieve a list of payments for a given date range
* retrieve the allocation details of a specific payment against one or more liabilities
* retrieve, create, amend, or delete coding out amounts


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
* [Self Assessment](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api)
* [Individual Calculations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/2.0)
* [Individual Losses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api)
* [Individuals Disclosures (Class 2 NIC’s)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-disclosures-api)
* [Business Income Source Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-biss-api)
* [Business Source Adjustable Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api)
* [Individuals Business End of Period Statement](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individuals-business-eops-api/1.0)
* [Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api)

### Bridging software

Some customers may wish to integrate their existing software solution for digital record keeping with another product that can submit quarterly updates and the End of Period Statement, view tax liabilities, make a self assessment and final declaration and so on. We generally refer to these products as bridging products. It is unclear at this time if developers plan to offer such a product. If they do, then in order to be granted production credentials it must be digitally linked to software which allows customers to maintain business records required by law.

### Non-MTD products

Software products who wish to selectively use Making Tax Digital for Income Tax APIs and not build a Making Tax Digital product will have to submit a business case, justifying use of a particular or multiple API’s. Such products may be granted production credentials at HMRC discretion.

### Testing requirements

The following endpoints are required to be tested to cover the self-employment reporting:

1.	‘Create a test user which is an organisation’ to create test data.
2.	‘Add a self-employment business’ endpoint to create an MTD
subscription for an individual within the sandbox environment.
3.	‘Retrieve self-employment business obligations’ to return obligation
periods (this will return a canned response the sandbox).
4.	‘Create a self-employment periodic update’ to make a submission.
5.	‘Amend a self-employment periodic update’ to amend a submission
already made.
6.	‘Amend a self-employment annual summary’ to create or amend annual
summary information.
7.	‘Trigger a calculation’ to request a calculation.
8.	‘Retrieve a calculation’ to return the calculation liability (this will return a canned response from the sandbox).

    The following endpoints are to be tested to cover EOPS (End of Period Statement) and final declaration:

9.	‘Submit self-employment End of Period Statement’ to finalise your self- employment income. (Developers must also build the facility for a user to make a declaration of correctness and completeness in relation to the EOPS)
10.	‘Retrieve End of Period Statement Obligations for a Self-Employment Business’ to check if an EOPS obligation has been fulfilled, this will return a canned response in the sandbox.
11.	‘Intent to crystallise’ to return the tax Calculation ID for final declaration.
12. ‘Retrieve a calculation’ with the tax Calculation ID for final declaration, to return the calculation liability. This will return a canned response in the sandbox.
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

    a. List all self-employment businesses.<br>
    b. Create a self-employment periodic update.<br>
    c. Trigger a tax calculation - can be triggered anytime but must be triggered at the end of the quarter to meet the obligation.

2. Amend an update

    a. List all self-employment update periods.<br>
    b. Amend a self-employment periodic update.<br>
    c. End of Period Statement.<br>
    d. Get a self-employment annual summary.<br>
    e. Amend a self-employment annual summary.<br>
    f. Get self-employment Business Income Summary Source (BISS).<br>
    g. Retrieve end of period statement obligations for a self-employment business.<br>
    h. Agree with the declaration within the software.<br>
    i. Submit self-employment end of period statement.

3. Final declaration

    a. Intent to crystallise.<br>
    b. Retrieve a tax calculation - to view the current calculation.<br>
    c. Agree with the declaration within the software.<br>
    d. Make a final declaration - agree on the final calculation.<br>


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

HMRC publishes a [list of compatible software](https://www.gov.uk/government/publications/making-tax-digital-software-suppliers-terms-of-collaboration/terms-of-collaboration-between-hm-revenue-and-customs-and-software-developers#Annex-C) for Making Tax Digital for Income Tax on GOV.UK. Software providers will be added to this list when they have completed the necessary steps in the ‘Software provider overview’ section.  

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

## Retrieving Obligations

Once a business or agent has completed authentication and granted access to the software, the software can then use our APIs to request the information the customer provided at sign up and to find out the customer’s update obligation dates.
The software must make customers aware of their obligations.

### Endpoints

The [List All Businesses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api#List%20All%20Businesses) endpoint provides a list of all the customer’s business income sources, along with the business ID which the software will need to send to HMRC.

The [Retrieve Business Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api#Retrieve%20business%20details) endpoint will provide the information HMRC holds for a specific self-employment or property business.

The [Retrieve Income Tax (Self Assessment) Income and Expenditure Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api#Retrieve%20Income%20Tax%20%28Self%20Assessment%29%20Income%20and%20Expenditure%20Obligations) endpoint provides obligation dates for all self-employment and property businesses, including grace periods and whether obligations have been met or not.

Note: the obligations for property obligations cover both FHL and non-FHL.

## Submit income and expense updates for self-employment and property businesses

Businesses and agents who represent them must provide summary-level information of their business income and expenses (transactional information to be kept digitally) on a quarterly basis or more often as required.

The quarterly obligations are initially created based on the accounting period for the income source. The deadline for meeting a quarterly obligation is one month after the obligation period end date.

The software should present these deadlines clearly to the customer and prompt them to submit information when the update is due.

Submissions of summary-level information should not span an obligation period. If this happens, the software will need to send two updates that fall into different obligations.

The software package will need to convert the transactional information into summary totals for each category, for example, expenses by category.

HMRC has provided APIs to enable the software to be able to send the summary information to HMRC for each income source and allow HMRC to provide a calculation based on all the information we have received to date.

When the update is received, HMRC checks if the customer is signed up to MTD, if the submission is coming from an agent and if that agent is subscribed to agent services and authorised to act on behalf of the client if not, an error is returned.

Note: If you still get the error and the client insists they have met all of the scenarios, check they have used the correct Government Gateway credentials when granting access to the software.

* [List all self-employment update periods](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_list-all-selfemployment-update-periods_get_accordion)
* [Create a self-employment periodic update](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_create-a-selfemployment-periodic-update_post_accordion)
* [Get a self-employment periodic update](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_get-a-selfemployment-periodic-update_get_accordion)
* [Amend a self-employment periodic update](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api#selfemployment-business_amend-a-selfemployment-periodic-update_put_accordion)

The service will include a number of business validation rules to ensure that all submissions are cross-validated before being accepted.

HMRC cannot apply these rules without knowing that no further submission (APIs calls) will be sent by the customer for the period being validated.

## Finalise business income End of Period Statement (EOPS)

### Business or Agent able to submit End of Period Statement through software

This is the process that allows the customer to finalise the profit or loss for any one source of business income.

An EOPS must be completed for each source of business income the customer has (similar to the current Income Tax process for the SA103, SA105 and SA106 schedules). For example, if a customer has one self-employment business and one property business they will have to complete two EOPS.

EOPS relates to the accounting period or basis period for each source of business income and cannot be completed before the end of that period.

Customers may complete their EOPS at any point after the end of the accounting period and do not have to wait until the 31 January deadline. This helps customers manage their business income in line with the business accounts. However, the deadline to complete is 31 January, Year 2.

The process will take into account all the periodic and annual data already provided by the customer throughout the year.

Customers must make sure they are confident with the information they have provided and add any additional information they have. This is likely to include tax and accounting adjustments, allowances or reliefs.

### EOPS process

1. The customer inputs information about allowances and adjustments for the business income source. They can provide this information throughout the year, but must do it before they complete the EOPS.
2. Depending on the business income type you need to submit, the software calls the [Get a self-employment annual summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/2.0#Get%20a%20self-employment%20annual%20summary), [Get a non-FHL UK property business annual summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/2.0#Get%20a%20non-FHL%20UK%20property%20business%20annual%20summary) or [Get a FHL UK property business annual summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/2.0#Get%20a%20FHL%20UK%20property%20business%20annual%20summary). This step is optional, but we recommend it to ensure you are getting the most up-to-date information.
3. The customer views the allowances and adjustment information and updates relevant information.
4. Depending on the business income type you need to update, the software submits information using the [Amend a self-employment annual summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/2.0#Amend%20a%20self-employment%20annual%20summary), [Amend a non-FHL UK property business annual summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/2.0#Amend%20a%20non-FHL%20UK%20property%20business%20annual%20summary) or [Amend a FHL UK Property business annual summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-api/2.0#Amend%20a%20FHL%20UK%20property%20business%20annual%20summary).
5. HMRC receives and stores information
6. The software calls the [Trigger a Self Assessment Tax Calculation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-calculations-api/2.0#Trigger%20a%20Self%20Assessment%20Tax%20Calculation) endpoint to get the calculation.
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

* [List Business Source Adjustable Summaries](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#List%20Business%20Source%20Adjustable%20Summaries)
* [Trigger a Business Source Adjustable Summary](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#Trigger%20a%20Business%20Source%20Adjustable%20Summary)
* [Retrieve a Self-Employment Business Source Adjustable Summary (BSAS)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#Retrieve%20a%20Self)
* [Submit Self-Employment Accounting Adjustments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#Submit%20Self)
* [Retrieve a UK Property Business Source Adjustable Summary (BSAS)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#Retrieve%20a%20UK%20Property%20Business%20Source%20Adjustable%20Summary%20(BSAS))
* [Submit UK Property Accounting Adjustments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#Submit%20UK%20Property%20Accounting%20Adjustments)
* [Retrieve a Foreign Property Business Source Adjustable Summary (BSAS)](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#Retrieve%20a%20Foreign%20Property%20Business%20Source%20Adjustable%20Summary%20(BSAS))
* [Submit Foreign Property Accounting Adjustments](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-bsas-api#Submit%20Foreign%20Property%20Accounting%20Adjustments)

## Multiple businesses

Users with multiple self-employment businesses and those with a foreign property business will be able to sign up to Making Tax Digital.

To enable this we are providing a number of new endpoints:

* [List All Businesses](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api/1.0#List%20All%20Businesses) - returns a list of the business income sources
* [Retrieve Business Details](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/business-details-api/1.0#Retrieve%20business%20details) - returns further information about a single business income source
* [Retrieve Income Tax (Self Assessment) Income and Expenditure Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api/1.0#Retrieve%20Income%20Tax%20%28Self%20Assessment%29%20Income%20and%20Expenditure%20Obligations) - returns the quarterly obligations for each business income source
* [Retrieve Income Tax (Self Assessment) End of Period Statement Obligations](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/obligations-api/1.0#Retrieve%20Income%20Tax%20%28Self%20Assessment%29%20End%20of%20Period%20Statement%20Obligations) - returns the End of Period Statement obligations for a user’s business income sources
* [Amend Loss Claims Order](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/individual-losses-api/3.0#Amend%20Loss%20Claims%20Order) - permits a change in the order in which loss claims are consumed

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
